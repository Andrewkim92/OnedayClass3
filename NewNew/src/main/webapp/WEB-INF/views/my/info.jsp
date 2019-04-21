<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
	
</script>

<div id="infoArea"
	style="width: 100%; height: 800px; margin: 100px 0px 100px 0px; text-align: center;">

	<div id="infoUP"
		style="margin: 0px 0px 100px 0px; width: 100%; height: 200px;">
		<div id="profile_pic" style="float: left; width: 30%;">
			<img style="margin: 0px 50px 100px 50px; width: 50%; height: 150px;"
				src="https://t1.daumcdn.net/cfile/tistory/99D95E425C727AE821"
				alt="프로필 이미지">
		</div>
		<div id="myInfo" style="float: left; width: 50%">
			<div style="">
				<h1>닉네임영역</h1>
				<button id="changeNic">변경</button>
			</div>
			<h2>관심사 영역</h2>
			<h2>이메일 계정</h2>
		</div>
	</div>

	<div
		style="background: #CECECE; width: 100%; height: 1px; padding: 0; margin: auto;">
	</div>

	<div id="infoDown"
		style="margin: 100px 0px 0px 0px; width: 100%; height: 500px;">
		<div id="infoDown_nav"
			style="float: left; width: 20%; text-align: left;">
			<div id="infoDown_nav_b1">
				<a href="">내 프립</a>
			</div>
			<br>
			<div id="infoDown_nav_b2">
				<a href="">프로필 수정</a>
			</div>

		</div>
		<div id="infoDown_content"
			style="float: left; width: 70%; text-align: left;">

			<div style="text-align: left">
				<h1>내 프로필</h1>
			</div>
			<div id="nickName" style="width:100%; height:50px;">
				<div style="float: left; width: 30%; text-align: left;">
					<h3>닉네임</h3>
				</div>
				<div style="float:left; width:50%; text-align:left;">
					<input type="text" value="nickName">
				</div>
			</div><br>
			<div id="phNumber" style="width:100%; height:50px;">
				<div style="float: left; width: 30%; text-align: left;">
					<h3>휴대전화번호</h3>
				</div>
				<div style="float:left; width:50%; text-align:left;">
					<input type="text" value="nickName">
				</div>
			</div><br>
			<div id="email" style="width:100%; height:50px;">
				<div style="float: left; width: 30%; text-align: left;">
					<h2>이메일</h2>
				</div>
				<div style="float:left; width:50%; text-align:left;">
					<input type="text" value="nickName">
				</div>
			</div><br>
			<div id="password" style="width:100%; height:50px;">
				<div style="float: left; width: 30%; text-align: left;">
					<h2>비밀번호</h2>
				</div>
				<div style="float:left; width:50%; text-align:left;">
					<input type="text" value="nickName">
				</div>
			</div><br>
			<div id="interestings" style="width:100%; height:50px;">
				<div style="float: left; width: 30%; text-align: left;">
					<h2>관심사</h2>
				</div>
				<div style="float:left; width:50%; text-align:left;">
					<h2>후순위 </h2>
				</div>
			</div>
		</div>

	</div>

</div>

