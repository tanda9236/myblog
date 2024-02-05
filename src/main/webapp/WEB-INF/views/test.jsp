<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>무한 슬라이드 테스트</title>
<style type="text/css">
.slides {
	margin: 0;
	padding: 0;
}

.slide_li{
	list-style: none;
}

.slide_wrapper {
	position: relative;
	width: 660px;
	margin: 0 auto;
	height: 200px;
	overflow: hidden;
}

.slides {
	position: absolute;
	left: 0;
	top: 0;
}

.slides.animated {
	transition: 0.5s ease-out;
}

.slides li {
	width: 200px;
	height: 200px;
	background: #ccc;
	float: left;
}

.slides li:not(:last-child) {
	margin-right: 30px;
}

.controls {
	text-align: center;
	margin-top: 50px;
}

.controls span {
	background: #333;
	color: #fff;
	padding: 10px 20px;
	margin: 0 10px;
}
</style>
<link rel="shortcut icon" href="#">
</head>

<body>
	<!-- partial:index.partial.html -->
	<div class="slide_wrapper">
		<ul class="slides">
			<li class="slide_li">slide 01</li>
			<li class="slide_li">slide 02</li>
			<li class="slide_li">slide 03</li>
			<li class="slide_li">slide 04</li>
			<li class="slide_li">slide 05</li>
		</ul>

	</div>
	<p class="controls">
		<span class="prev">prev</span> <span class="next">next</span>
	</p>
	<!-- partial -->
	<script src="/js/test.js"></script>
</body>
</html>