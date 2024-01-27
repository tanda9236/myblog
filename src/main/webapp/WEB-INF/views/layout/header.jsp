<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>My Blog</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>

<link href="/css/styles.css" rel="stylesheet" />
<link href="/css/styles_plus.css" rel="stylesheet" />
<link href="/css/summernote_plus.css" rel="stylesheet" />
</head>
<body>
<script type="text/javascript"> // 드롭다운
document.addEventListener("DOMContentLoaded", function() {
    var dropdownToggle = document.querySelector('.dropdown-toggle');
    var dropdownContent = document.querySelector('.dropdown-content');

    dropdownToggle.addEventListener('click', function() {
        if (dropdownContent.style.display === "block") {
            dropdownContent.style.display = "none";
        } else {
            dropdownContent.style.display = "block";
        }
    });
    window.addEventListener('click', function(event) {
        if (!dropdownToggle.contains(event.target) && !dropdownContent.contains(event.target)) {
            dropdownContent.style.display = "none";
        }
    });
});
</script>
	<!-- Responsive navbar-->
	<nav class="my-navbar">
		<div class="my-navbar-items">
			<div class="my-logo">
				<a class="my-scroll-no" href="/">&#x3000;MyBlog</a>
			</div>

			<div id="searchbar">
				<div>
					<img class="my-scroll-no" height="38px" src="/image/search.png" />
				</div>
				<input type="text" class="my-input2" placeholder="검색">
			</div>
			<div class="my-nav-btn-box my-scroll-no">
				<div class="my-profile-btn">

					<c:choose>
						<c:when test="${empty principal}">
							<a class="my-login-link" href="/loginForm">로그인&#x3000;</a>
							<div class="dropdown">
							<img class="my-profile-img dropdown-toggle my-cur-p" src="/image/no_profile_img.jpg" />
							<div class="dropdown-content">
							    <a href="/loginForm">로그인</a>
							    <a class="my-cur-p" style="color:red;">고객센터</a>
							</div>
							</div>
						</c:when>
						<c:otherwise>
							<a class="my-login-link" href="/logout">로그아웃&#x3000;</a>
							<div class="dropdown">
							<img class="my-profile-img dropdown-toggle my-cur-p" src="/image/no_profile_img.jpg" />
							<div class="dropdown-content">
							    <a href="/logout">로그아웃</a>
							    <a class="my-cur-p" style="color:red;">마이페이지</a>
							    <a class="my-cur-p" style="color:red;">고객센터</a>
							</div>
							</div>
						</c:otherwise>
					</c:choose>



				</div>
			</div>
		</div>
	</nav>