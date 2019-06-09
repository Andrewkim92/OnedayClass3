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
               <div class="col-10">
                  <nav class="site-navigation text-right" role="navigation">
                     <div class="container">
                        <div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3">
                           <a href="#" class="site-menu-toggle js-menu-toggle text-black"><span
                              class="icon-menu h3"></span></a>
                        </div>

                        <ul class="site-menu js-clone-nav d-none d-lg-block">

                        <c:choose>
                           <c:when test="${not empty sessionScope.userVO}">
                              <li class="has-children"><a href="program">
                              <c:choose>
                              <c:when test="${not empty sessionScope.userVO.name}">
                              ${sessionScope.userVO.name}</c:when>
                              <c:otherwise>
                              ${sessionScope.userVO.id}
                              </c:otherwise>
                              </c:choose>
                               대원님</a>
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
                                    <li><a href="/program">Body Building</a></li>
                                    <li><a href="/program">Morning Energy</a></li>
                                    <li><a href="/my/hostRegisterTerm">호스트 가입</a></li>
<!--                                     <li class="has-children"><a href="program">Sub -->
<!--                                           Menus</a> -->
<!--                                        <ul class="dropdown"> -->
<!--                                           <li><a href="/program">Swimming</a></li> -->
<!--                                           <li><a href="/program">Boxing</a></li> -->
<!--                                           <li><a href="/program">Running</a></li> -->
<!--                                           <li><a href="/program">Jogging</a></li> -->
<!--                                        </ul> -->
<!--                                        </li> -->

                                 </ul></li>
                              <li><a href="/program/list">program</a></li>
                              <li><a href="/program/register">program 등록</a></li>
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