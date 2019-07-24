<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--  메인사진........ -->
<div class="site-blocks-cover inner-page"
	style="background-image: url(/resources/images/hero_b1_1.jpg);"
	data-aos="fade" data-stellar-background-ratio="0.5">
	<div class="row align-items-center justify-content-center">
		<div class="col-md-7 text-center" data-aos="fade">
			<h1>프로그램 목록</h1>
			<span class="caption d-block text-white">Read Our Healthy Tips</span>
		</div>
	</div>
</div>

<!-- <p><a href="/program/register" class="btn btn-primary text-white px-4"><span class="caption"> 클래스 등록하기</span> </a></p> -->
<!--  게시판 시작 ..........-->
<div class="site-section">

	<div class='row' align='center'>
		<div class="col-lg-12">
			<form id='searchForm' action="/program/list" method='get'>
				<select name='type'>
					<option value="PTH"
						<c:out value="${pageMaker.cri.type == 'TCH'?'selected':''}"/>>전체</option>
					<option value="P"
						<c:out value="${pageMaker.cri.type eq 'P'?'selected':''}"/>>프로그램
						이름</option>
					<option value="T"
						<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>주제</option>
					<option value="H"
						<c:out value="${pageMaker.cri.type eq 'H'?'selected':''}"/>>호스트
						이름</option>
					<option value="PT"
						<c:out value="${pageMaker.cri.type eq 'PT'?'selected':''}"/>>프로그램명+주제</option>
				</select> <input type='text' name='keyword'
					value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
					type='hidden' name='pageNum'
					value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
					type='hidden' name='amount'
					value='<c:out value="${pageMaker.cri.amount}"/>' />
				<button class='btn btn-default'>Search</button>
			</form>
		</div>
		<!-- div class="col-lg-12" -->
	</div>
	<!-- div class='row' -->

	<div class="container">
		<div class="row mb-5">
			<c:choose>
				<c:when test="${pageMaker.total < 1}">
					<h2>검색 결과가 없습니다.</h2>
				</c:when>
				<c:otherwise>
					<h4>${pageMaker.total} 건의 검색 결과가 있습니다.</h4>
					
				</c:otherwise>
			</c:choose>
	<br>
			<c:forEach var="program" items="${programs}">
				<div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
					<div class="media-with-text mb-5">
						<div class="mb-4">
							<a class='move' href='<c:out value="${program.progSeq}"/>'> <img
								src="/resources/images/img_1.jpg" alt="" class="img-fluid">
							</a>
						</div>
						<h2 class="h5 mb-2">
							<a class='move' href='<c:out value="${program.progSeq}"/>'>${program.progName}</a>
						</h2>
						<span class="mb-3 d-block post-date">January 20, 2018
							&bullet; By ${program.user_userNumber} </span><span> <a href="#">지역:
								${program.progLocation}</a></span> <span>
								<p>주제:
								${program.progBigTitle}</p></span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!--    페이징  -->
	<form action="/program/list" method="get">
		<div class="row" align='center'>
			<div class="col-md-12 text-center">
				<div class="site-block-27">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">&lt;</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li
								class='paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} '>
								<span><a href="${num}">${num}</a></span>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">&gt;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</form>

	<form id='actionForm' action="/program/list" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		<input type='hidden' name='type' value='${pageMaker.cri.type}'>
		<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
	</form>
</div>

<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
	/* $( document ).ready(function() {
	 console.log( "document loaded" );
	 }); */
	$(document)
			.ready(
					function() {

						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='progSeq' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/program/info");
											actionForm.submit();

										});

						$("#searchForm button").on(
								"click",
								function(e) {

									/* if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									} */

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();
								});
					});
</script>

