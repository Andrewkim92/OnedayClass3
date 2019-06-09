<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css">


<div class="container2">
	<br>
	<br>
	<h3>&emsp;클래스 등록하기</h3>
	<br>
	<div class="container3">
		<div class="tabs tabs-style-bar">
			<nav>
				<ul>
					<li class="tabmenu tab-current" data-tab="tab1">
						<a href="#"><span>클래스 기본정보</span></a>
					</li>
					<li class="tabmenu" data-tab="tab2">
						<a href="#"><span>클래스 운영정보</span></a>
					</li>
					<li class="tabmenu" data-tab="tab3">
						<a href="#"><span>기타정보</span></a>
					</li>
				</ul>
			</nav>
			<div id="contents">
			
			</div>
		</div>
	</div>
</div>


<script>
$(document).ready(function() {
	$('#contents').load("/board/tab1");
	$('.tabmenu').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('li').removeClass('tab-current');
		$(this).addClass('tab-current');
		$('#contents').load("/board/" + activeTab);
	});
});


</script>
