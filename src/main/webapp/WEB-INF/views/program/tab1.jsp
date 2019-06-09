<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css">

<div class="content-wrap tab1">
	<div id="wrap">
		<table>
			<tr height="50">
				<td>
					<input type="text" class="hide" name="sub_title" placeholder="한줄 소개" size="95">
				</td>
			</tr>
			<tr>
				<td class="title">
					<input type="text" class="hide"  name="title" placeholder="제목" style="font-size: 30px;" size="50">
				</td>
			</tr>
			<tr>
				<td class="a hide" style="padding-top: 60px;">
					<!-- 	네이버에디터   -->
					<textarea rows="20" cols="90" id="editerArea" name="editerArea"></textarea>
				</td>
			</tr>
			<tr>
				<td style="padding-top:80px;">
					<div style="text-align: center">
						<input type="submit" value="저장" /> 
						<input type="button" value="취소">
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>

<script>

// 네이버에디터 
$(document).ready(function() {
	
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	   oAppRef: oEditors
	 , elPlaceHolder: "editerArea" // element ID
	 , sSkinURI: "/resources/js/naver_editor/SmartEditor2Skin.html"
	 , fCreator: "createSEditor2"
	});

});
</script>