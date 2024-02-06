<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tanda.myblog.model.User"%>
<%@page import="java.util.List"%>
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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="/css/styles_plus.css" rel="stylesheet" />
<link href="/css/summernote_plus.css" rel="stylesheet" />
<link rel="shortcut icon" href="#">
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
<script src="/js/features/dropdownProfile.js"></script>

<!-- 헤더 (네비바) start -->
<nav class="my-navbar">
	<div class="my-navbar-items">
		<div class="my-logo" style=""> <!-- item 1 -->
			<a class="my-scroll-no" href="/">&#x3000;MyBlog</a>
		</div>
		<div id="searchbar"> <!-- item 2 -->
			<div>
				<img class="my-scroll-no" height="38px" src="/image/search.png" />
			</div>
			<section class="my-section-s">
				<input type="text" class="" id="search" placeholder="검색(닉네임)" autocomplete="off" />
				<div class="autocomplete"></div>
			</section>
		</div>
		<div class="my-nav-btn-box my-scroll-no"> <!-- item 3 -->
			<div class="my-profile-btn">
			<c:choose>
				<c:when test="${empty principal}">
					<a class="my-login-link" href="/loginForm">로그인&#x3000;</a>
				</c:when>
				<c:otherwise>
					<div class="dropdown">
					<div class="my-profile-img-box-s">
					<img class="dropdown-toggle my-cur-p" src="${principal.user.profilePath}" onerror="this.src='/image/no_profile_img.jpg'"/>
					</div>
					<div class="dropdown-content">
					    <div class="my-row dropdown-elm-top" >
						    <div class="my-profile-img-box-s my-mr2">
						    <img class="" src="${principal.user.profilePath}" onerror="this.src='/image/no_profile_img.jpg'"/>
						    </div>
							    <div style="width: 155px;">
							    	<a href="/${principal.user.id}" style="word-wrap: break-word;" class="my-bold ss">${principal.user.nickname}</a>
							    </div>
					    </div><hr/>
					    <div class="my-row dropdown-elm" >
					    	<img class="dropdown-img" src="/image/logout.png" />
					    	<a href="/logout">로그아웃</a>
					    </div><hr/>
					    <div class="my-row dropdown-elm" >
					    	<img class="dropdown-img" src="/image/profile.png" />
					    	<a href="/profile/${principal.user.id}">프로필</a>
					    </div><hr/>
					    <div class="my-row dropdown-elm" >
					    	<img class="dropdown-img" src="/image/question.png" />
					    	<a class="my-cur-p" href="mailto:boong2469@gmail.com">고객센터(email)</a>
					    </div>
					</div>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
</nav>
<!-- 헤더 (네비바) end -->


<%
List<User> userListAll = (List<User>) request.getAttribute("users");
List<String> userListNickname = new ArrayList<>();
List<String> userListId = new ArrayList<>();
for (User user : userListAll) {
	String nickname = user.getNickname();
	userListNickname.add(nickname);
}
for (User user : userListAll) {
	Integer id = user.getId();
	userListId.add(String.valueOf(id));
}
%>
<script type="text/javascript">
 const userListNickname = <%= new Gson().toJson(userListNickname) %>;
 const userListId = <%= new Gson().toJson(userListId) %>;
</script>