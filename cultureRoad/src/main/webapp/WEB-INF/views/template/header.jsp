<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
      <div class="container">
          <div class="row">
              <div class="col-12">
                  <nav class="main-nav">
                      <!-- ***** Logo Start ***** -->
                      <a href="/user/main" class="logo">
                          <img src="/resources/image/logo.png" alt="">
                      </a>
                      <!-- ***** Logo End ***** -->
                      <!-- ***** Menu Start ***** -->
                      <ul class="nav">
                          <li class="scroll-to-section"><a href="#top" class="active">Main</a></li>
                          <li class="scroll-to-section"><a href="#search">Search</a></li>
                          <li class="scroll-to-section"><a href="#movie">Ranking</a></li>
                          <li class="has-sub">
                              <a href="javascript:void(0)">Movie</a>
                              <ul class="sub-menu">
                                  <li><a href="about-us.jsp">Movie List</a></li>
                                  <li><a href="our-services.jsp">Movie Board</a></li>
                                  <li><a href="contact-us.jsp">Reservation</a></li>
                              </ul>
                          </li>
                          <li class="scroll-to-section"><a href="#bestComment">BestComment</a></li>
                          <li><a href="">Notice</a>
                          <c:choose>
                          	<c:when test = "${empty userLogin}">
                          		<li><a href="/user/signUpForm">회원가입</a></li>
                          		<li><a href="/user/loginUser">로그인</a></li>
                          	</c:when>
                          	<c:when test = "${not empty userLogin}">
                          		<li><a href="/user/myPage">마이페이지</a></li>
                          		<li><a href="/user/logout">로그아웃</a></li>
                          	</c:when>
                          </c:choose>
                      </ul>        
                      <a class='menu-trigger'>
                          <span>Menu</span>
                      </a>
                      <!-- ***** Menu End ***** -->
                  </nav>
              </div>
          </div>
      </div>
  </header>
  <!-- ***** Header Area End ***** -->
