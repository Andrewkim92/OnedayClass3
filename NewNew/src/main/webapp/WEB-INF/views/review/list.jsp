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
	<table class="table table-board">
		<tr>
			<th>호스트 후기</th>
		</tr>
		<tr>
			<td>${count} 건</td>
		</tr>
		<tr>
			<td>평균 별점 : <fmt:formatNumber value="${rateAvg}" pattern=".00"/> </td>
		</tr>
	</table>
	<table class="table table-board" border="1px" width="80%" align="center">
        <tr>
            <th style="width:10%">회원번호</th>
            <th style="width:10%">리뷰점수</th>
            <th style="width:30%">리뷰내용</th>            
        </tr>
 
    <c:forEach items="${reviewList}" var="ReviewVO">
        <tr>
            <td>${ReviewVO.user_userNumber}</td>
            <td>${ReviewVO.reviewRate}</td>        
            <td>${ReviewVO.reviewComment}</td>       
        </tr>
       	<tr>
       		<td>작성일자 : <fmt:formatDate value="${ReviewVO.reviewDate}" pattern="yyyy.MM.dd.hh.mm" /></td>
       		<td>프로그램 : ${ReviewVO.program_progSeq}</td>
       		<td>
			 좋아요 : ${ReviewVO.likeCount}
	 		</td>       		
       	</tr>
    </c:forEach>
    </table>
</body>
<script type="text/javascript">

</script>
</html>