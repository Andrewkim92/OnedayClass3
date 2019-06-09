<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>


<script type="text/javascript">
$(function() {
	//이미지 클릭시 업로드창 실행
	$('#profile_file_add').click(function() {
		console.log('fileadd');
		$("#file").click();

	})

	$(function() {
		$("#file").change(function() {
			var form = new FormData(document.getElementById('uploadForm'));
			
			$.ajax({
				url : '/upload/uploadAjax',
				data : form,
				dataType : 'json',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(response) {
					alert("success");
					console.log(response);
					location.reload();
				},
				error : function(jqXHR) {
					alert("error : "+jqXHR.responseText);
//						window.location.href = 'http://localhost:8080/my/info/';
					location.reload();
				}
			});
		});
	});

})
</script>

<div id="infoArea"
	style="width: 100%; height: 800px; margin: 100px 0px 50px 0px; text-align: center;">

	<div id="infoUP"
		style="margin: 0px 0px 100px 0px; width: 100%; height: 200px;">
		<div id="profile_pic" style="float: left; width: 30%;">
			<a href="#" id="profile_file_add"><img id="profile_file_add_img"
				style="margin: 0px 50px 100px 50px; width: 50%; height: 150px;"
				src="${sessionScope.userVO.imgPath}"
				alt="프로필 이미지"></a>
			
			<div id="hiddenArea" style="display:none">
			<form id="uploadForm" enctype="multipart/form-data" method="POST"
				action="/upload/uploadForm">
				<div>
					<input type="file" id="file" name="file" required="required" />
					<input id="userNumber" name="userNumber" type="hidden" value="${sessionScope.userVO.userNumber}">
				</div>
			</form>
			</div>

		</div>
		<div id="myInfo" style="float: left; width: 30%">
			<div style="">
				<h1>${sessionScope.userVO.name}
					<a href="/my/info"><button id="changeNic">설정</button></a>
				</h1>
			</div>
			<h2>관심사 영역</h2>
			<h2>이메일 계정</h2>

		</div>
		<div id="cashArea" style="float: left; width: 30%; display: inline;">
			<div id="cash" style="display: inline;">
				<h1>캐시</h1>
				<h2>1000원</h2>
			</div>
			<div id="co" style="display: inline;">b</div>
		</div>

	</div>

	<div
		style="background: #CECECE; width: 100%; height: 1px; padding: 0; margin: auto;">
	</div>

	<div id="infoDown"
		style="margin: 50px 0px 0px 0px; width: 100%; height: 800px;">
		<div id="infoDown_nav"
			style="float: left; width: 20%; text-align: left;">
			<div id="infoDown_nav_b1">
				<a href="../my/history">내 프립</a>
			</div>
			<br>
			<div id="infoDown_nav_b2">
				<a href="../my/info">프로필 수정</a>
			</div>

		</div>
		<div id="infoDown_content"
			style="float: left; width: 70%; height: 50px; text-align: left; margin: 0px 0px 0px 0px;">
			<div id="hisDown_nav" style="display: inline; min-width: 1200px;">
				<div style='display: inline; float: left; width: 25%'><a href="#">사용가능</a></div>
				<div style='display: inline; float: left; width: 25%'><a href="#">신청 내역</a></div>
				<div style='display: inline; float: left; width: 25%'><a href="#">후기</a></div>
			</div>
		</div>
		<br><br>
		<div id="his_content"
			style="float: left; ">
			컨텐츠가 없습니다.
		</div>

	</div>

</div>

