<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
	
</script>
<!-- 수정 -->
<div id="infoArea"
	style="width: 100%; height: 700px; margin: 100px 0px 100px 0px; text-align: center;">

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
		style="margin: 100px 0px 100px 0px; width: 100%; height: 500px;">
		<div id="infoDown_nav" style="float: left; width:20%; text-align: left; ">
			<div id="infoDown_nav_b1">
				<a href="/my/history">내 프립</a>
			</div><br>
			<div id="infoDown_nav_b2">
				<a href="/my/info">프로필 수정</a>
			</div>
			
		</div>
		<div id="infoDown_content" style="float: left; width:70%; text-align: left;">
				<div style="float:left; width:30%; text-align:left">
					<a href="#">사용가능</a>
				</div>
				<div style="float:left; width:30%; text-align:left">
					<a href="../my/history/class">신청내역</a>
				</div>
				<div style="float:left; width:30%; text-align:left">
					<a href="../my/history/reviews">후기</a>
				</div>
		</div>

	</div>

</div>

