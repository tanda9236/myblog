<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<div class="container">
<br><br><br><br><br><br>
<div class="row">
	
<!-- 좌측 사이드 start -->
<div class="col-lg-4">
	<div class="col-lg-11">
		<div class="card-body my-category-box-info">
			<a class="my-profile-category my-bold" href="/profile/${principal.user.id}" class=""><img class="dropdown-img" src="/image/profile.png" />프로필</a>
			<a class="my-profile-category my-bold active" href="/password/${principal.user.id}" class=""><img class="dropdown-img" src="/image/password.png" style="padding-right: 1px;"/>비밀번호 변경</a>
		</div>
	</div>
</div>
<!-- 좌측 사이드 end -->

<div class="col-lg-8">
<!-- 비밀번호 변경창 start -->
<form>
<div class="card mb-4">
	<div class="card-header my-card-header">
		<div class="my-postInfo-top justify-content-between">
			<div class="my-postInfo-top">
				<img class="my-profile-img my-mr1" src="/image/password.png" />
					<div class="my-bold">
						<p class="my-fs2">비밀번호 변경</p>
					</div>
			</div>
			<div class="my-font-small"></div>
		</div>
	</div>
	<div class="card-body">
		<div class="my-postInfo-right" >
			<div class ="my-profile-info" >
				<div class="my-profile-left"></div>
				<div class="my-profile-right">
					<div class="my-mb1">
						<p class="my-mb1">새 비밀번호</p>
						<input id="password" class="my-profile-input" type="password" placeholder="Enter Password (8~64)">
					</div>
					<div>
						<p class="my-mb1">새 비밀번호 확인</p>
						<p><input id="passwordCheck" class="my-profile-input" type="password"></p>
						<input type="hidden" id="id" value="${principal.user.id}" />
					</div>
				</div>
			</div>
			<div class="my-end my-font-small">
				<p>마지막 수정일 : 
				<c:set var="rawUpdateDate" value="${user.updateDate}" />
				<fmt:parseDate var="parsedDate" value="${rawUpdateDate}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
				<fmt:formatDate value="${parsedDate}" pattern="yyyy년 M월 d일" var="formattedDate" />
				${formattedDate} ( ${diffDays}일 전 )
				</p>
			</div>
		</div>
	</div>
</div>
</form>
<!-- 비밀번호 변경창 end -->
	
<div class="button-container-2">
	<span class="mas">저장</span>
	<button id="btn-pass-update">저장</button>
</div>

</div>
</div>
</div>
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>