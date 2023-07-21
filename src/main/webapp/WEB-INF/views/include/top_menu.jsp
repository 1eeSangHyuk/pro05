<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <c:url var="root" value="/" /> -->
<!-- localhost(127.0.0.1):portnumber/projectname : Context Path -->
<c:set var="root" value="${pageContext.request.contextPath }/" />

		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
				<img src="${pageContext.request.contextPath}/resources/images/logo_wh.png" alt="로고"
					style="width: 30px; height: auto;"> <a href="${root }"
					class="navbar-brand" style="margin-left: 10px; font-size: 1.5em;"
					alt="다시 홈으로">JEJUMATJIP</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="navbar navbar-expand-lg">
					<ul class="nav nav-pills">
						<li class="nav-item"><a class="nav-link" href="/restaurant/main">맛집리스트</a></li>
						<li class="nav-item"><a class="nav-link" href="/review">리뷰</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${root }notice/main">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="${root }qna/qna">QnA</a></li>
					</ul>
				</div>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active" href="/user/login">Login</a></li>
						<li class="nav-item"><a class="nav-link active" href="/user/join">Sign up</a></li>
						<li class="nav-item"><a class="nav-link" href="#!">Admin</a></li>
					</ul>
				</div>
			</div>
		</nav>