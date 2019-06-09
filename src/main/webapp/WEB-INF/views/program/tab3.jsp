<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css">

<form id="tab3" method="get" action="classBoardWrite/tab3">
	<div class="content-wrap">
		<div id="wrap">
			<div id="wrap_">
				<div id="title">
					<p class="title">
						<b>세부일정&emsp;&emsp;&emsp; </b>
					</p>
				</div>
				<div id="content">
					<textarea cols="67" rows="3" name="details1"></textarea>
				</div>
			</div>
			<div id="wrap_">
				<div id="title">
					<p class="title">
						<b>포함사항&emsp;&emsp;&emsp; </b>
					</p>
				</div>
				<div id="content">
					<textarea cols="67" rows="3" name="details2"></textarea>
				</div>
			</div>
			<div id="wrap_">
				<div id="title">
					<p class="title">
						<b>불포함사항&emsp;&emsp;&emsp; </b>
					</p>
				</div>
				<div id="content">
					<textarea cols="67" rows="3" name="details3"></textarea>
				</div>
			</div>
			<div id="wrap_">
				<div id="title">
					<p class="title">
						<b>준비물&emsp;&emsp;&emsp; </b>
					</p>
				</div>
				<div id="content">
					<textarea cols="67" rows="3" name="details4"></textarea>
				</div>
			</div>
			<div id="button">
				<input type="submit" value="저장"> 
				<input type="button" value="취소">
			</div>
		</div>
	</div>
</form>
