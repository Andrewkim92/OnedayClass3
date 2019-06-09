<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css">
<%-- <%@ page session="true"%> --%>
<style type="text/css">
.errormsg {
	color: red;
}
</style>
<div class="container">
	<h2 align="center" class="text-primary">Spring MVC Form Validation
		Example</h2>
	<hr />
	<div></div>

	<form:form action="register" method="POST" modelAttribute="prog">
		<div class="form-group">
			<label>progName :</label>
			<form:input path="progName" size="30" cssClass="form-control"
				placeholder="Enter progName" />
			<small><form:errors path="progName" cssClass="errormsg" /></small>
		</div>
		<div class="form-group">
			<label>progBigTitle:</label>
			<form:input path="progBigTitle" size="30" cssClass="form-control"
				placeholder="Enter progBigTitle" />
			<small><form:errors path="progBigTitle" cssClass="errormsg" /></small>
		</div>
		<div class="form-group">
			<label>progSmallTitle:</label>
			<form:input path="progSmallTitle" size="30" cssClass="form-control"
				placeholder="Enter progSmallTitle" />
			<small><form:errors path="progSmallTitle" cssClass="errormsg" /></small>
		</div>
		<div class="form-group">
			<label>progContents:</label>
			<form:input path="progContents" size="30" cssClass="form-control"
				placeholder="Enter progContents" />
			<small><form:errors path="progContents" cssClass="errormsg" /></small>
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-primary">등록</button>
		</div>
	</form:form>
</div>
ㅇㅇ
<%-- <f:form commandName="registerForm" modelAttribute="prog" enctype="Multipart/form-data" >
	<f:hidden path="user_userNumber" value="10"/>
	
	<div class="content-wrap">
		<div id="wrap">
			<div>
				<div id="title">
					<p class="title">
						<b>프로그램 이름&emsp;&emsp;&emsp; </b>
					</p>
				</div>
				<div id="content">
					<f:textarea path="progName" cols="67" rows="3" />
					<input type="text" name="progName"/>
					<f:errors path="progName" />
				</div>
			</div>
			<div id="wrap_">
				<div id="title">
					<p class="title">
						<b>대주제&emsp;&emsp;&emsp; </b>
					</p>
				</div>
				<div id="content">
					<f:textarea path="progBigTitle" cols="67" rows="3" />
					<f:errors path="progBigTitle"/>
				</div>
			</div>
			<div id="wrap_">
				<div id="title">
					<p class="title">
						<b>소주제&emsp;&emsp;&emsp; </b>
					</p>
				</div>
				<div id="content">
					<f:textarea path="progSmallTitle" cols="67" rows="3" />
					<input type="text" name="progSmallTitle"/>
					<f:errors path="progSmallTitle" />
				</div>
			</div>
			<div id="wrap_">
				<div id="title">
					<p class="title">
						<b>프로그램 내용&emsp;&emsp;&emsp; </b>
					</p>
				</div>
				<div id="content">
					<f:textarea path="progContents" cols="67" rows="3" />
					<input type="text" name="progContents"/>
					<f:errors path="progContents"/>
				</div>
			</div>
			<div id="wrap_">
				<div id="title">
					<p class="title">
						<b>업로드&emsp;&emsp;&emsp; </b>
					</p>
				</div>
				<div id="content">
					<div>파일명: <input type="file" name="file"/><br/></div>
				</div>
			</div>
			
		 	<div align="center"><input type="button" id="registerBtn" value="등록" /><input type="reset" value="취소" /></div>
		</div>
		
	</div>
</f:form>

<script type="text/javascript">
	$().ready(function(){
		
		$("#registerBtn").click(function(){
			$("#registerForm").attr({
				"method" : "post",
				"action" : "<c:url value='/register' />"
			});
			$("#registerBtn").submit();
		});
		
	});
</script> --%>


<!-- <form id="uploadForm" enctype="multipart/form-data" method="POST" action="/upload/uploadForm">
					<div>
						<input type="file" id="file" name="file" required="required" />
					</div>
				</form> -->

<!-- 
<script type="text/javascript">
	$(function() {
		//이미지 클릭시 업로드창 실행
			$("#file").click(function() {

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
// 						window.location.href = 'http://localhost:8080/my/info/';
						location.reload();
					}
				});
			});
	})
</script> -->