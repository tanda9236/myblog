<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tanda.myblog.model.User"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.6);
}
.my-modal-content {
	background-color: #1a1a1a;
	border-radius: 20px;
	color: white;
	margin: 15% auto;
	padding: 10px 20px 10px 20px;
	border: 1px solid #888;
	width: 435px;
	height: 280px;
	border: none;
}
.md-close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}
.md-close:hover, .md-close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
.donate-info {
	display: flex;
	align-items: center;
	padding: 30px 0 0 20px;
}
.donate-img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
}
.donate-text {
	margin-left: 20px;
    margin-right: 20px;
}
</style>
<link href="/css/styles.css" rel="stylesheet" />
<link href="/css/styles_plus.css" rel="stylesheet" />
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
	<button onclick="openModal()">모달 열기</button>
	<div id="myModal" class="modal">
		<div class="my-modal-content">
			<span class="md-close">&times;</span>
			<div class="donate-info">
				<img class="donate-img" src="/profileImage/71993c4f-69b0-457a-95fb-ccec1beaf1d9_20180528_191247_IMG_0775.PNG" onerror="this.src='/image/no_profile_img.jpg'" alt="profile">
				<div class="donate-text">
					<h4 class="my-bold">monkey2469</h4>
					<p>이 블로그에 후원</p>
				</div>
			</div>
			
			<div class="text-center my-mt1">
				<p>₩1,990/월</p>
				<div class="button-container-2 my-mt4" style="width: 120px;">
					<span class="mas">후원</span>
					<button>후원</button>
				</div>
			</div>
		</div>
	</div>




<script type="text/javascript">
function openModal() {
	document.getElementById("myModal").style.display = "block";
}
function closeModal() {
	document.getElementById("myModal").style.display = "none";
}
document.getElementsByClassName("md-close")[0].onclick = function() {
	closeModal();
}
window.onclick = function(event) {
	if (event.target == document.getElementById("myModal")) {
		closeModal();
	}
}
</script>
</body>
</html>