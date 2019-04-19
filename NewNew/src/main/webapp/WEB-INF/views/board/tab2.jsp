<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css">

<div class="content-wrap">
	<div id="wrap">
		<table>
			<tr>
				<td class="title" width="125"><font size="4em"> 가격 </font></td>
				<td width="30"></td>
				<td width="105"><input type="text" size ="10" style="text-align:right;"></td>
				<td><font size="4em"> 원 </font></td>
			</tr>
			<tr>
				<td class="title" style="padding-top:80px;"><font size="4em" > 날짜 </font></td>
				<td width="30"></td>
				<td colspan="2"><input type="text" id="testDatepicker">  </td>
			</tr>
			<tr>
				<td class="title" style="padding-top:80px;"><font size="4em"> 시작/종료시간 </font></td>
				<td width="30"></td>
				<td colspan="2">
					<select name="hourSelect"></select>
					<select name="minSelect"></select>
					<font size="4em">&emsp;~&emsp;</font>
					<select name="hourSelect"></select>
					<select name="minSelect"></select>
				</td>
				
			</tr>
			<tr>
				<td class="title" style="padding-top:80px;"><font size="4em"> 진행장소 </font></td>
				<td width="30"></td>
				<td colspan="3">
					<font size="4em"> 우편번호&emsp; </font> 
					<input type="text" size="5"> 
					<font size="4em"> - </font> 
					<input type="text" size="5">&emsp;
					<input type="button" value="우편번호 검색">
				</td>
			</tr>
			<tr>
				<td rowspan="3"></td>
			</tr>
			<tr>
				<td width="30"></td>
				<td colspan="3">
					<font size="4em"> 기본주소&emsp; </font> 
					<input type="text" size="60">
				</td>
			</tr>
			<tr>
				<td width="30"></td>
				<td colspan="3">
					<font size="4em"> 상세주소&emsp; </font> 
					<input type="text" size="60">
				</td>
			</tr>
			<tr>
				<td colspan="5" style="padding-top:80px;">
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
$(function() {
    $( "#testDatepicker" ).datepicker({
    });
});

//board timeSelecter

$(document).ready(function() {
	var len = document.getElementsByName("hourSelect").length;
	var len2 = document.getElementsByName("minSelect").length;
	
	for(var j = 0; j < len; j++){
		var timeSelect = document.getElementsByName("hourSelect")[j];
		var docfrag = document.createDocumentFragment();
		var hour = "";
		for(var i = 0; i <24; i++){
			hour = i < 10 ? "0" + i : i;
			
			var option = document.createElement("option");
			var optionElement = i == 0 ? 
					"<option value ='" + hour + "' selected>" + hour + "</option>" 
					: "<option value ='" + hour + "'>" + hour + "</option>";
					
			option.innerHTML = optionElement;
			docfrag.appendChild(option);
		}
		timeSelect.appendChild(docfrag);
	}
	
	for(var j = 0; j < len2; j++){
		var timeSelect = document.getElementsByName("minSelect")[j];
		var docfrag = document.createDocumentFragment();
		var min = "";
		for(var i = 0; i <6; i++){
			min = i + "0";
			
			var option = document.createElement("option");
			var optionElement = i == 0 ? 
					"<option value ='" + min + "' selected>" + min + "</option>" 
					: "<option value ='" + min + "'>" + min + "</option>";
					
			option.innerHTML = optionElement;
			docfrag.appendChild(option);
		}
		timeSelect.appendChild(docfrag);
	}
});

</script>