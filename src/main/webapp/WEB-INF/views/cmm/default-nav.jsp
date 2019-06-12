<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>

<div class="site-mobile-menu">
	<div class="site-mobile-menu-header">
		<div class="site-mobile-menu-close mt-3">
			<span class="icon-close2 js-menu-toggle"></span>
		</div>
	</div>
	<div class="site-mobile-menu-body"></div>
</div>

<!-- .site-mobile-menu -->
<div class="site-navbar-wrap js-site-navbar bg-white">
	<div class="container">
		<div class="site-navbar bg-light">
			<div class="py-1">
				<div class="row align-items-center">
					<div class="col-2">
						<h2 class="mb-0 site-logo">
							<a href="/">OneDay<strong>Class</strong></a>
						</h2>
					</div>
					<!-- 					<div>asdasda</div> -->
					<div class="col-10">
						<nav class="site-navigation text-right" role="navigation">
							<div class="container">
								<div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3">
									<a href="#" class="site-menu-toggle js-menu-toggle text-black"><span
										class="icon-menu h3"></span></a>
								</div>
								<ul class="site-menu js-clone-nav d-none d-lg-block">
									<li style="float: left; width:400px;"><img style="float: left; width="30px" height="30px"
										src="data:image/png;base64,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"><input
										type="text" value="input..." style="width:200px; height:50px; float: left;"></li>
									<c:choose>
										<c:when test="${not empty sessionScope.userVO}">
											<li class="has-children"><a href="program"> <c:choose>
														<c:when test="${not empty sessionScope.userVO.name}">
                              ${sessionScope.userVO.name}</c:when>
														<c:otherwise>
                              ${sessionScope.userVO.id}
                              </c:otherwise>
													</c:choose> <c:choose>
														<c:when test="${sessionScope.userVO.userGrade==2}">
                              호스트님</c:when>
														<c:otherwise>대원님</c:otherwise>
													</c:choose>
											</a>
												<ul class="dropdown arrow-top">
													<li><a href="/my/history">내 좋아요</a></li>
													<li><a href="/my/info">프로필 수정</a></li>
													<li><a href="/login/logout">로그아웃</a></li>
												</ul></li>

										</c:when>
										<c:otherwise>
											<li><a href="/login/register">회원가입</a></li>
											<li><a href="/login/login">로그인</a></li>
										</c:otherwise>
									</c:choose>

									<li class="has-children"><a href="program">고객센터</a>
										<ul class="dropdown arrow-top">
											<li><a href="/program">공지사항</a></li>
											<li><a href="/program">자주 묻는 질문</a></li>
											<li><a href="/my/hostRegisterTerm">호스트 가입</a></li>

										</ul></li>
									<!-- 									<li><a href="/program/list">program</a></li> -->
									<c:choose>
										<c:when
											test="${not empty sessionScope.userVO&&sessionScope.userVO.userGrade==2 }">
											<li><a href="/program/register">program 등록</a></li>

										</c:when>
									</c:choose>
									<li><a href="/about">제휴문의</a></li>
									<!--  <li><a href="contact">Contact</a></li> -->
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>