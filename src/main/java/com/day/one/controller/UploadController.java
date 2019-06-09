package com.day.one.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.day.one.common.UploadFileUtils;
import com.day.one.dao.UserDao;
import com.day.one.vo.UserVO;


@Controller
@RequestMapping("/upload/*")
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public String uploadFormGET() {
		return "/upload/uploadForm";
	}
	
	@Autowired
	private UserDao loginService;
	
	//Post 방식 파일 업로드
	/*@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadFormPOST(MultipartFile file, Model model,MultipartHttpServletRequest req) throws Exception {
		
		logger.info("uploadFormPost");
		
		if(file != null) {
			logger.info("originalName:" + file.getOriginalFilename());
			logger.info("size:" + file.getSize());
			logger.info("ContentType:" + file.getContentType());
		}
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes(),uploadPath);
		
		model.addAttribute("savedName", savedName);
		
		return "/upload/uploadForm";
	}*/
	
	//업로드된 파일을 저장하는 함수
	private String uploadFile(String originalName, byte[] fileDate,String uploadPath) throws IOException {
		
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_" + originalName;	
		
		File target = new File(uploadPath, savedName);
		
		//org.springframework.util 패키지의 FileCopyUtils는 파일 데이터를 파일로 처리하거나, 복사하는 등의 기능이 있다.
		FileCopyUtils.copy(fileDate, target);
		
		return savedName;
		
	}
	
	//Ajax 파일 업로드
//	@RequestMapping(value="/upload/uploadAjax", method = RequestMethod.GET)
//	public String uploadAjaxGET() {
//		return "/upload/uploadAjax";
//	}
	
	//Ajax 파일 업로드 produces는 한국어를 정상적으로 전송하기 위한 속성
	@ResponseBody
	@RequestMapping(value="/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjaxPOST(MultipartFile file,MultipartHttpServletRequest req,HttpServletRequest request,int userNumber,HttpSession session) throws Exception {
		
		logger.info("originalName:" + file.getOriginalFilename());
		logger.info("size:" + file.getSize());
		logger.info("contentType:" + file.getContentType());
		
		//String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		//HttpStatus.CREATED : 리소스가 정상적으로 생성되었다는 상태코드.
		//return new ResponseEntity<>(file.getOriginalFilename(), HttpStatus.CREATED);
		
		String savedPath = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		
		String path = "/resources/profile_imgs";
		
		String imgPath = path + savedPath;
		System.out.println(imgPath);
		
		UserVO vo = new UserVO();
		vo.setUserNumber(userNumber);
		vo.setImgPath(imgPath);
		loginService.updateImgPath(vo);
		
		UserVO tmpVO = (UserVO) session.getAttribute("userVO");
		tmpVO.setImgPath(imgPath);
		session.setAttribute("userVO", tmpVO);
		
		Thread.sleep(2000);
		return new ResponseEntity<>(savedPath, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax_program", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax_program(MultipartFile file,MultipartHttpServletRequest req,HttpServletRequest request,int userNumber,HttpSession session) throws Exception {
		
		logger.info("originalName:" + file.getOriginalFilename());
		logger.info("size:" + file.getSize());
		logger.info("contentType:" + file.getContentType());
		
		//String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		//HttpStatus.CREATED : 리소스가 정상적으로 생성되었다는 상태코드.
		//return new ResponseEntity<>(file.getOriginalFilename(), HttpStatus.CREATED);
		
		String savedPath = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		
		String path = "/resources/profile_imgs";
		
		String imgPath = path + savedPath;
		System.out.println(imgPath);
		
//		UserVO vo = new UserVO();
//		vo.setUserNumber(userNumber);
//		vo.setImgPath(imgPath);
//		loginService.updateImgPath(vo);
		
		UserVO tmpVO = (UserVO) session.getAttribute("userVO");
		tmpVO.setImgPath(imgPath);
		session.setAttribute("userVO", tmpVO);
		
		Thread.sleep(1000);
		return new ResponseEntity<>(savedPath, HttpStatus.OK);
	}
	
	//화면에 저장된 파일을 보여주는 컨트롤러 /년/월/일/파일명 형태로 입력 받는다.
	// displayFile?fileName=/년/월/일/파일명
	/*@ResponseBody
	@RequestMapping(value="/upload/displayFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("File name: " + fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + fileName);
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}// else
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		
		return entity;
	}// displayFile
*/	
	
	//업로드된 파일 삭제 처리
	/*@ResponseBody
	@RequestMapping(value="/upload/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) throws Exception {
		
		logger.info("delete file:" + fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null) {
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}//if
		
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		
	}*/
	
	
}