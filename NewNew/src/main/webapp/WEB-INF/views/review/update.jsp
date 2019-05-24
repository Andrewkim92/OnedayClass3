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
<h1>
    리뷰 수정
</h1>
    <form action="/review/update" method="POST">
        <div class="createForm">
            <input type="hidden" name="program_progSeq" class="createForm" value = ${progSeq}>
            <input type="hidden" name="user_userNumber" class="createForm" value = ${userNumber}>
            <input type="hidden" name="uploadLocation" class="createForm" value = "">
            <input type="hidden" name="likeCount" class="createForm" value = 0>
        </div>
        <div class="createForm">
            <label>별점</label>
            <input type="number" name="reviewRate" class="createForm" min="1" max="5">
        </div>
        <div class="createForm">
            <label>리뷰내용</label>
            <textarea rows="4" cols="15" name="reviewComment" class="createForm" placeholder = "리뷰 내용"></textarea>
        </div>
        <div class="Formfooter">
                <button type="submit" class="btn_button">수정하기</button>
        </div>
    </form>
    
    <form action="/review/delete" method="POST">
         <input type="text" name="program_progSeq" class="createForm" value = ${progSeq}>
         <input type="text" name="user_userNumber" class="createForm" value = ${userNumber}>
    	 <div class="Formfooter">
                <button type="submit" class="btn_button">삭제하기</button>
        </div>
    </form>
</body>
</html>