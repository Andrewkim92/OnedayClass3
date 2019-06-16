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
					<span>좋아요 : ${ReviewVO.likeCount}</span>
				</a>
			</c:if>		 
	 		</div>
	 		<div class="col-md-4 col-md-offset-3">
	 			<button class="btn btn-secondary">댓글달기</button>
	 		</div>
	 		<span></span>
       	</div>
       	<div class="row">
        ---
       	</div>
    </c:forEach>
	<div>
    	<c:if test="${reviewPager.curBlock ne 1}">
    		<a href="/review/list?Program_progSeq=${program_progSeq}&curPage=1">[처음]</a>
    	</c:if>
    	<c:if test="${reviewPager.curPage ne 1}">
    		<a href="/review/list?Program_progSeq=${program_progSeq}&curPage=${reviewPager.prevPage}">[이전]</a>
    	</c:if>
    	<c:forEach var="pageNum" begin="${reviewPager.blockBegin }" end="${reviewPager.blockEnd }">
        	<c:choose>
            	<c:when test="${pageNum eq  reviewPager.curPage}">
                	<span style="font-weight: bold;">${pageNum}</span> 
                </c:when>
                <c:otherwise>
                	<a href="/review/list?Program_progSeq=${program_progSeq}&curPage=${pageNum}">${pageNum}</a> 
                </c:otherwise>
             </c:choose>
         </c:forEach>
         <c:if test="${reviewPager.curPage ne reviewPager.pageCnt && reviewPager.pageCnt > 0}">
         	<a href="/review/list?Program_progSeq=${program_progSeq}&curPage=${reviewPager.nextPage}">[다음]</a> 
         </c:if>
         <c:if test="${reviewPager.curBlock ne reviewPager.totBlock && reviewPager.totBlock > 0}">
         	<a href="/review/list?Program_progSeq=${program_progSeq}&curPage=${reviewPager.pageCnt}">[끝]</a> 
         </c:if>
	</div>
	<div>
                    총 게시글 수 : ${reviewPager.reviewCnt} /    총 페이지 수 : ${reviewPager.pageCnt } / 현재 페이지 : ${reviewPager.curPage } / 현재 블럭 : ${reviewPager.curBlock } / 총 블럭 수 : ${reviewPager.totBlock }
    </div>
</div>
</body>
<script type="text/javascript">
$(function(){
    $(".likeAction").click(function(){
        var likedUser = ${sessionScope.userVO.userNumber};
        var reviewUser = $(this).children('input').attr('id');
        var progSeq = $(this).children('input').attr('value');
        var element = this;
        $.ajax({
        url:'/review/reviewLike',
        type:"POST",
        cache: false,
        dataType: "json",
        data: {'likedUser':likedUser, 'reviewUser':reviewUser, 'progSeq':progSeq },
        success:function(data){
        	$(element).children('span').text("좋아요 : "+ data);
        },
        error: function (request, status, error){
        	alert("ajax실패"); 
        }
    });
    });
});

$(function(){
    $(".btn-secondary").click(function(){
    	var element2 = $(this).parent().parent().children('span');
    	if(element2.html() == "" ){
    		element2.html("<form id='rComment' method='POST'><textarea style='resize: none;' cols='80' id='rCommentData'></textarea>"+"<button class='rComment'>제출</button></form>")
    	} else {
    		element2.html("");
    	}
    	});
});     

</script>
</html>