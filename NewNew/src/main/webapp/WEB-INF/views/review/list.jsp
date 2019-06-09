<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
	<h4> 호스트 후기 ${count}</h4>
	</div>
 	<div>				
 				<c:forEach var="item" varStatus="i" begin="2" end="${rateAvg}" step="2">
				★	
				</c:forEach>
				<c:if test="${rateAvg % 2 >= 1}">
				※
				</c:if>
				<c:forEach var="item2" varStatus="j" begin="${rateAvg}" end="8" step="2">
				☆	
				</c:forEach>
				<fmt:formatNumber value="${rateAvg / 2}" pattern=".00"/>
	</div>
	<div class="row">
     ---------
    </div>
    <c:forEach items="${reviewList}" var="ReviewVO">
        <div class="row">
            <div class="col-md-1">    
    	    		${nameList[ReviewVO.user_userNumber]}
    		</div>
            <div class="col-md-2 col-md-offset-1">   
				<c:forEach var="item" varStatus="i" begin="2" end="${ReviewVO.reviewRate}" step="2">
				★	
				</c:forEach>
				<c:if test="${ReviewVO.reviewRate % 2 eq 1}">
				※
				</c:if>
				<c:forEach var="item2" varStatus="j" begin="${ReviewVO.reviewRate}" end="8" step="2">
				☆	
				</c:forEach>
				(${ReviewVO.reviewRate / 2})   
			</div>        
     		<div class="col-md-4 col-md-offset-1"><fmt:formatDate value="${ReviewVO.reviewDate}" pattern="yyyy.MM.dd HH:mm " /> 작성</div>
        </div>
       	<div class="row">
       	    <div class="span12"><pre><br>${ReviewVO.reviewComment}</pre></div>  
       	</div>
       	<div class="row">
        <br>
       	</div>
       	<div class="row">
       		<div class="col-md-4">프로그램 : ${progName}</div>
       		<div class="col-md-4 col-md-offset-4">
       		<c:if test="${empty sessionScope.userVO.userNumber }">
				좋아요 : ${ReviewVO.likeCount}
			</c:if>
			<c:if test="${not empty sessionScope.userVO.userNumber }">
				<a href=# class="likeAction">
				<input type="hidden" id="${ReviewVO.user_userNumber}" value="${ReviewVO.program_progSeq}">
				좋아요 : ${ReviewVO.likeCount}
				</a>
			</c:if>		 
	 		</div>  		
       	</div>
       	<div class="row">
        ---
       	</div>
    </c:forEach>
</div>
</body>
<script type="text/javascript">
$(function(){
    $(".likeAction").click(function(){
        var likedUser = ${sessionScope.userVO.userNumber};
        var reviewUser = $(this).children('input').attr('id');
        var progSeq = $(this).children('input').attr('value');
    $.ajax({
        url:'/review/reviewLike',
        type:"POST",
        dataType: "json",
        data: {'likedUser':likedUser, 'reviewUser':reviewUser, 'progSeq':progSeq },
        success:function(data){
            alert("완료!");
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
        }
    });
    });
});
</script>
</html>