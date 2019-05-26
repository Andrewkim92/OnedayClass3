<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

 <!--  메인사진........ -->
    <div class="site-blocks-cover inner-page" style="background-image: url(/resources/images/hero_b1_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="row align-items-center justify-content-center">
        <div class="col-md-7 text-center" data-aos="fade">
          <h1> 프로그램 목록</h1>
          <span class="caption d-block text-white">Read Our Healthy Tips</span>
        </div>
      </div>
    </div>  
    
   <p><a href="/board/register" class="btn btn-primary text-white px-4"><span class="caption"> 클래스 등록하기</span> </a></p>
    
    <!--  게시판 시작 ..........-->
    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
        
       <%--  
       <!-- class 1 -->
         <c:forEach var="program" items="${programs}">
             <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
               <div class="media-with-text mb-5">
                 <div class="mb-4">
                   <a href="/program/info">
                     <img src="/resources/images/img_1.jpg" alt="" class="img-fluid">
                   </a>
                 </div>
                 <h2 class="h5 mb-2"><a href="/program/info?progSeq=${program.progSeq}">${program.progName}class 6</a></h2>
                 <span class="mb-3 d-block post-date">January 20, 2018 &bullet; By${program.progLocation} <a href="#">${program.name}Josh Holmes</a></span>
                 <p>${program.progBigTitle}</p>
               </div>
             </div>
          </c:forEach> --%>
          
           <%--  <!-- class 1 -->
         <c:forEach var="program" items="${programs}">
             <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
               <div class="media-with-text mb-5">
                 <div class="mb-4">
                   <a href="/program/info">
                     <img src="/resources/images/img_1.jpg" alt="" class="img-fluid">
                   </a>
                 </div>
                 <h2 class="h5 mb-2"><a href="/program/info?progSeq=<c:out value="${program.progSeq}"/>><c:out value="${program.progName}"/>class 6</a></h2>
                 <span class="mb-3 d-block post-date">January 20, 2018 &bullet; By <c:out value="${program.progLocation}"/> <a href="#"><c:out value="${program.name}"/>Josh Holmes</a></span>
                 <p><c:out value="${program.progBigTitle"/>}</p>
               </div>
             </div>
          </c:forEach> --%>
          
    <%-- <c:forEach var="program" items="${programs}">
  			<h1><c:out value="${program.progSeq}"/></h1>
  			<h1><c:out value="${program.progName}"/></h1>
  			<h1><c:out value="${program.progLocation}"/></h1>
  			<h1><c:out value="${program.progBigTitle}"/></h1>
  			<h1><c:out value="${program.name}"/></h1>
 	  </c:forEach>    --%>
       <%-- <!-- class 1 -->
         <c:forEach var="program" items="${programs}">
             <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
               <div class="media-with-text mb-5">
                 <div class="mb-4">
                   <a href="/program/info">
                     <img src="/resources/images/img_1.jpg" alt="" class="img-fluid">
                   </a>
                 </div>
                 <h2 class="h5 mb-2"><a href='/program/info?progSeq=<c:out value="${program.progSeq}"/>'><c:out value="${program.progName}"/>class 6</a></h2>
                 <span class="mb-3 d-block post-date">January 20, 2018 By<c:out value="${program.progLocation}"/> <a href="#"><c:out value="${program.name}"/>Josh Holmes</a></span>
                 <p><c:out value="${program.progBigTitle}"/></p>
               </div>
             </div>
          </c:forEach>       --%>
	
      <!--    페이징  -->
        <div class="row">
          <div class="col-md-12 text-center">
            <div class="site-block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="program/programAllList?pageNum=2">2</a></li>
                <li><a href="program/programAllList?pageNum=3">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
        </div>
      </div>
    </div>
    