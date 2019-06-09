package com.day.one.vo;


import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class ProgVO {
	
	private int progSeq;
	
	@NotNull
	 @Size(min=1, max=100 , message="프로그램 이름을 입력해주세요.") 
	private String progName;
	
	@NotNull
	 @Size(min=1, max=100 , message="프로그램 대주제을 입력해주세요.") 
	private String progBigTitle;
	
	@NotNull
	 @Size(min=1, max=100 , message="프로그램 소주제을 입력해주세요.") 
	private String progSmallTitle;
	
	@NotNull
	 @Size(min=1, max=100 , message="프로그램 내용을 입력해주세요.") 
	private String progContents;
	
	private String progLocation;
	
	private String progLikeCount;
	
	//private String memberCode;
	
	private String user_userNumber;
	
	private String uploadLocation;
	
	private String isFinished;
	
}
