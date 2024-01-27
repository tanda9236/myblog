<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<c:set var="rawCreateDate" value="${board.createDate}" />
<fmt:parseDate var="parsedDate" value="${rawCreateDate}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
<fmt:formatDate value="${parsedDate}" pattern="yyyy년 M월 d일" var="formattedDate"/>
<c:if test="${board.user.id == principal.user.id}">
<div class="my-side-btn-write">
	<a href="/board/${board.id}/blogUpdate" class="side-write my-bg-warning">
		edit
	</a>
	<button id="btn-delete" class="side-write my-bg-danger">
		del
	</button>
</div>
</c:if>
<div class="my-details-body">
<div class="my-details">
<div class="my-details-middle">
	<div class="my-details-title">${board.title}</div>

	<div class="my-details-info">
	<a class="my-writer" href="/${board.user.id}">${board.user.username}</a> · ${formattedDate} · <span id=id>${board.id}</span></div>

	<div class="my-details-content">${board.content}</div>
	
</div>
<div class="my-box-end"></div>

<div class="my-float-right my-mt0">
	<div class="button-container-2">
		<span class="mas">버튼</span>
		<button id="">버튼</button>
	</div>
</div>
</div>
</div>
<div class="my-side-btn">
	<button class="rollUp" onclick="window.scrollTo(0,0);">
		<img src="/image/top.png" alt="top">
	</button>
</div>
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>