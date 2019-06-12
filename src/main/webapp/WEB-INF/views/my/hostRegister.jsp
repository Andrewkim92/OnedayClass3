<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
	
</script>

<div id="loginArea"
	style="width: 100% height:1300px; margin: 100px 0px 100px 0px; text-align: center;">

	<form method="post" action="../my/doHostRegister" name="vo"
		onsubmit="return checkValue()">
		<div id="nameArea" style="width: 100%; height: 50px;">
			<div style="float: left; width: 30%; text-align: center;">
				<h3>이름</h3>
			</div>
			<div style="float: left; width: 50%; text-align: left;">
				<input type="text" id="name" name="name"
					value="${sessionScope.userVO.name}">
			</div>
		</div>
		<div id="nickNameArea" style="width: 100%; height: 50px;">
			<div style="float: left; width: 30%; text-align: center;">
				<h3>닉네임</h3>
			</div>
			<div style="float: left; width: 50%; text-align: left;">
				<input type="text" id="name" name="name"
					value="${sessionScope.userVO.name}">
			</div>
		</div>
		<br>
		<div id="phNumber" style="width: 100%; height: 50px;">
			<div style="float: left; width: 30%; text-align: center;">
				<h3>휴대전화번호</h3>
			</div>
			<div style="float: left; width: 50%; text-align: left;">
				<button id="">본인인증하기</button>
			</div>
		</div>
		<div id="phNumber2" style="width: 100%; height: 50px;">
			<div style="float: left; width: 30%; text-align: center;">
				<h3>공개연락처</h3>
			</div>
			<div style="float: left; width: 50%; text-align: left;">
				<input type="text" id="phNumber2" name="phNumber2"
					value="${sessionScope.userVO.name}">
			</div>
		</div>
		<br>
		<div id="emailArea" style="width: 100%; height: 50px;">
			<div style="float: left; width: 30%; text-align: center;">
				<h2>이메일</h2>
			</div>
			<div style="float: left; width: 50%; text-align: left;">
				<input type="text" id="id" name="id"
					value="${sessionScope.userVO.id}"><br>
			</div>
		</div>
		<br>
		<div id="interestings" style="width: 100%; height: 50px;">
			<div style="float: left; width: 30%; text-align: center;">
				<h2>관심사</h2>
			</div>
			<div style="float: left; width: 50%; text-align: left;">
				<h2>후순위</h2>
			</div>
		</div>
		<br>

		<div id="intro" style="width: 100%; height: 50px;">
			<div style="float: left; width: 30%; text-align: center;">
				<h2>소개</h2>
			</div>
			<div id="intro" style="float: left; ">
				<textarea rows="10" cols="50"></textarea>
			</div>
		</div>
		<br>
		<br><br><br><br>
		<div id="save" style="text-align: center;">
			<input type="submit" value="신청하기"
				style="width: 30%; height: 30px; background-color: rgb(51, 151, 255); color: white; line-height: 13px; font-size: 13px; border-radius: 4px;">
		</div>

	</form>
</div>