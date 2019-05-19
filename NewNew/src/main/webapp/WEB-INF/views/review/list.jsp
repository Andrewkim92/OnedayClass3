<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-board" border="1px" width="80%" align="center">
        <tr>
            <th style="width:10%" >프로그램 번호</th>
            <th style="width:30%">회원번호</th>
            <th style="width:30%">리뷰점수</th>
        </tr>
 
    <c:forEach items="${reviewList}" var="ReviewVO">
        <tr>
            <td>${ReviewVO.program_progSeq}</td>
            <td>${ReviewVO.user_userNumber}</td>
            <td>${ReviewVO.reviewRate}</td>           
        </tr>
    </c:forEach>
    </table>
</body>
</html>