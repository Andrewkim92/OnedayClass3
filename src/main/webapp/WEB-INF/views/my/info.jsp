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
// 						alert("error : "+jqXHR.responseText);
						alert("success");
						
// 						window.location.href = 'http://localhost:8080/my/info/';
						location.reload();
					}
				});
			});
		});

	})
</script>

<div id="infoArea"
	style="width: 100%; height: 800px; margin: 100px 0px 50px 0px;">
<!-- 	push test 3344 -->
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
		<div id="myInfo" style="text-align: center; float: left; width: 60%">
			<div style="">
				<h1>${sessionScope.userVO.name}
					<a href="/my/info"><button id="changeNic">설정</button></a>
				</h1>
			</div>
			<h2>관심사 영역</h2>
			<h2>이메일 계정</h2>

		</div>
<!-- 		<div id="cashArea" style="float: left; width: 30%; display: inline;"> -->
<!-- 			<div id="cash" style="display: inline;"> -->
<!-- 				<h1>캐시</h1> -->
<!-- 				<h2>1000원</h2> -->
<!-- 			</div> -->
<!-- 			<div id="co" style="display: inline;">b</div> -->
<!-- 		</div> -->

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
			style="float: left; width: 70%; height: 500px; text-align: left; margin: 0px 0px 0px 0px;">
			<form method="post" action="../my/updateProfile" name="vo"
				onsubmit="return checkValue()">
				<div style="text-align: left">
					<h1>내 프로필</h1>
				</div>
				<div id="nickNameArea" style="width: 100%; height: 50px;">
					<div style="float: left; width: 30%; text-align: left;">
						<h3>닉네임</h3>
					</div>
					<div style="float: left; width: 50%; text-align: left;">
						<input type="text" id="name" name="name"
							value="${sessionScope.userVO.name}">
					</div>
				</div>
				<br>
				<div id="phNumber" style="width: 100%; height: 50px;">
					<div style="float: left; width: 30%; text-align: left;">
						<h3>휴대전화번호</h3>
					</div>
					<div style="float: left; width: 50%; text-align: left;">
						<button id="">본인인증하기</button>
					</div>
				</div>
				<br>
				<div id="emailArea" style="width: 100%; height: 50px;">
					<div style="float: left; width: 30%; text-align: left;">
						<h2>이메일</h2>
					</div>
					<div style="float: left; width: 50%; text-align: left;">
						<input type="text" id="id" name="id"
							value="${sessionScope.userVO.id}"><br> <br> <input
							type="checkbox">다양한 이벤트, 할인, 상품 정보 메일을 받겠습니다.
					</div>
				</div>
				<br>
				<div id="password" style="width: 100%; height: 50px;">
					<div style="float: left; width: 30%; text-align: left;">
						<h2>비밀번호</h2>
					</div>
					<div style="float: left; width: 50%; text-align: left;">
						<button id="">변경하기</button>
					</div>
				</div>
				<br>
				<div id="interestings" style="width: 100%; height: 50px;">
					<div style="float: left; width: 30%; text-align: left;">
						<h2>관심사</h2>
					</div>
					<div style="float: left; width: 50%; text-align: left;">
						<h2>후순위</h2>
					</div>
				</div>
				<br>
				<div id="save" style="text-align: center;">
					<input type="submit" value="수정하기"
						style="width: 30%; height: 30px; background-color: rgb(51, 151, 255); color: white; line-height: 13px; font-size: 13px; border-radius: 4px;">
				</div>
			</form>
		</div>

	</div>

</div>

