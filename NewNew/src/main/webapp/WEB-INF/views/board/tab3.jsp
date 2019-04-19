<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css">

<div class="content-wrap">
	<div id="wrap">
		<table>
			<tr>
				<td class="title b" width="95" height="20">
					<font size="4em"> 세부일정 </font>
				</td>
				<td width="30"></td>
				<td rowspan="2">
					<textarea cols="75" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td class="title b" height="20" style="padding-top:80px;">
					<font size="4em"> 포함사항 </font>
				</td>
				<td width="30"></td>
				<td rowspan="2" height="50" style="padding-top:80px;">
					<textarea cols="75" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td class="title b" height="20" style="padding-top:80px;">
					<font size="4em"> 불포함사항</font></td>
				<td width="30"></td>
				<td rowspan="2" height="50" style="padding-top:80px;" >
					<textarea cols="75" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td class="title b"  height="20" style="padding-top:80px;">
					<font size="4em"> 준비물 </font>
				</td>
				<td width="30"></td>
				<td rowspan="2" height="50" style="padding-top:80px;">
					<textarea cols="75" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td colspan="3" style="padding-top:80px;">
					<div style="text-align: center">
						<input type="submit" value="등록" /> 
						<input type="button" value="취소">
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>

