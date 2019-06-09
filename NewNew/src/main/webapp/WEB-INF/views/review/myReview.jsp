<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-board" border="1px" width="80%" align="center">
        <tr>
            <th style="width:10%">회원번호</th>
            <th style="width:10%">리뷰점수</th>
            <th style="width:30%">리뷰내용</th>            
        </tr>
    <c:forEach items="${myReview}" var="ReviewVO">
        <tr>
            <td>${ReviewVO.user_userNumber}</td>
            <td>
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
            </td>        
            <td><pre>${ReviewVO.reviewComment}</pre></td>       
        </tr>
       	<tr>
       		<td>작성일자 : <fmt:formatDate value="${ReviewVO.reviewDate}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
       		<td>프로그램 : ${ReviewVO.program_progSeq}</td>
       		<td>
			 <a href="/review/update?user_userNumber=${ReviewVO.user_userNumber}&Program_progSeq=${ReviewVO.program_progSeq}">수정/삭제</a>
	 		</td>       		
       	</tr>
    </c:forEach>
    </table>
</body>
<script type="text/javascript">

</script>
</html>