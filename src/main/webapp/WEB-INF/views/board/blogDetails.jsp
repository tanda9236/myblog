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
	<a class="my-writer" href="/${board.user.id}">${board.user.nickname}</a> · ${formattedDate} · <span id=id>${board.id}</span></div>
	<div class="my-details-content">${board.content}</div>
</div>
<div class="my-box-end"></div>

<!-- 글쓴이 소개 start -->
<div class="my-postInfo-bet">
	<div class="my-postInfo-top">
		<a href="/${board.user.id}" class="my-profile-left"><img src="${board.user.profilePath}" onerror="this.src='/image/no_profile_img.jpg'" alt="profile"></a>
		<div class="my-fc-w">
			<a href="/${board.user.id}" class="my-fc-w my-bold my-fs3">${board.user.nickname}</a>
			<div class="my-w2">나개나의소개나의소개</div>
		</div>
	</div>
	<div class="">
		<button class="btn btn-dark my-ml1"><span>팔로우</span></button>
	</div>
</div>
<!-- 글쓴이 소개 end -->
<!-- 댓글작성 start -->
<h4 class="my-fc-w">${board.replyCount}개의 댓글</h4>
<form>
<%-- <input type="hidden" id="" value="${board.user.id}"> --%>
<input type="hidden" id="userId" value="${principal.user.id}">
<input type="hidden" id="boardId" value="${board.id}">
<c:choose>
	<c:when test="${empty principal}">
		<textarea placeholder="로그인 후 작성가능" class="my-reply-write" style="height: 70px;" readonly></textarea>
	</c:when>
	<c:otherwise>
		<textarea id="reply-content" placeholder="댓글을 작성하세요" class="my-reply-write" style="height: 70px;"></textarea>
		<div class="my-row-reverse">
			<div class="">
				<button type="button" id="btn-reply-save" class="btn btn-dark my-ml1 my-mr1">댓글작성</button>
			</div>
		</div>	
	</c:otherwise>
	</c:choose>
</form>
<!-- 댓글작성 end -->
<!-- 댓글리스트 start -->
<c:forEach var="reply" items="${board.replies}">
<div class="my-reply-box my-fc-w my-box-underline">
	<div class="my-reply-top my-sb-or">
	<a class="my-fc-w" href="/${reply.user.id}"><img class="my-profile-img dropdown-toggle" src="${reply.user.profilePath}" onerror="this.src='/image/no_profile_img.jpg'" />&ensp;${reply.user.nickname}</a>
	<div class="my-font-small">
		<c:if test="${reply.user.id == principal.user.id}">
		<button class="my-mr1 my-badge" onClick="index.replyDelete(${board.id}, ${reply.id})">삭제</button>
		</c:if>
		<c:set var="rawCreateDate" value="${reply.createDate}" />
		<fmt:parseDate var="parsedDate" value="${rawCreateDate}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
		<fmt:formatDate value="${parsedDate}" pattern="yyyy년 M월 d일" var="formattedDate" />
		${formattedDate}
	</div>
	</div>
	<p>${reply.content}</p>
</div>
</c:forEach>
<!-- 댓글리스트 end -->
</div>
</div>
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>