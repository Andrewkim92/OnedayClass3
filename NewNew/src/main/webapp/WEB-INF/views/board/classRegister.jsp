<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css">

<div class="content-wrap tab1">
	<div id="wrap">
		<table>
			<tr height="200">
				<td class="a">
					<div style="text-align: center;">
						<img src="/resources/images/imgreg.png" width="150" height="150">
					</div>
				</td>
			</tr>
			<tr height="50">
				<td>
					<input type="text" class="hide" placeholder="한줄 소개" size="95">
				</td>
			</tr>
			<tr>
				<td class="title">
					<input type="text" class="hide" placeholder="제목" style="font-size: 30px;" size="50">
				</td>
			</tr>
			<tr>
				<td class="a hide" style="padding-top: 60px;">
					<textarea class="hide" cols="95" rows="30" placeholder="강의 소개"></textarea>
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

<div class="content-wrap tab2">
	<div id="wrap">
		<table>
			<tr>
				<td class="title" width="125"><font size="4em"> 가격 </font></td>
				<td width="30"></td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td class="title" style="padding-top:80px;"><font size="4em" > 날짜 </font></td>
				<td width="30"></td>
				<td colspan="2"></td>
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
				<td colspan="2">
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
				<td colspan="4" style="padding-top:80px;">
					<div style="text-align: center">
						<input type="submit" value="저장" /> 
						<input type="button" value="취소">
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>

<div class="content-wrap tab3">
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

