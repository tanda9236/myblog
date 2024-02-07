<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<div class="container">
<br><br><br><br><br><br>
<div class="row">

<!-- 좌측 사이드 start -->
<div class="col-lg-4">
	<div class="col-lg-11">
		<div class="card-body my-category-box-info">
			<a class="my-profile-category my-bold active" href="/profile/${principal.user.id}" class=""><img class="dropdown-img" src="/image/profile.png" />프로필</a>
			<c:if test="${empty principal.user.provider}">
			<a class="my-profile-category my-bold" href="/password/${principal.user.id}" class=""><img class="dropdown-img" src="/image/password.png" style="padding-right: 1px;"/>비밀번호 변경</a>
			</c:if>
		</div>
	</div>
</div>
<!-- 좌측 사이드 end -->

<div class="col-lg-8">
<!-- 프로필 변경창 start -->
<form enctype="multipart/form-data">
<div class="card mb-4">
	<div class="card-header my-card-header">
		<div class="my-postInfo-top justify-content-between">
			<div class="my-postInfo-top">
				<img class="my-profile-img my-mr1" src="/image/profile.png" />
				<div class="my-bold">
					<p class="my-fs2">회원정보</p>
				</div>
			</div>
			<div class="my-font-small"></div>
		</div>
	</div>
	<div class="card-body">
		<div class="my-postInfo-right" >
			<div class ="my-profile-info" >
				<div class="my-profile-left">
					<div class="my-profile-img-box">
						<img src="${user.profilePath}" onerror="this.src='/image/no_profile_img.jpg'"/>
					</div>
					<div id="fileContainer">
						<div class="filebtn"><label for="file">파일 선택</label></div>
						<input type="file" id="file" name="file" accept=".png, .jpg, .jpeg, .gif" onchange="displayFileName()">
						<div id="fileName"></div>
					</div>
				</div>
				<div class="my-profile-right">
					<div class="my-mb1">
						<p class="my-mb1">이메일</p>
						<input class="my-profile-input" type="text" placeholder="${user.email}" readonly="readonly">
					</div>
					<div class="my-mb1">
						<p class="my-mb1">닉네임</p>
						<p><input id="nickname" class="my-profile-input" type="text" value="${user.nickname}" maxlength="18"></p>
						<input type="hidden" id="id" value="${principal.user.id}" />
						<input type="hidden" id="username" value="${principal.user.username}" />
						<input type="hidden" id="profilePath" value="${user.profilePath}" />
					</div>
					<div>
						<p class="my-mb1">한 줄 소개</p>
						<input id="intro" class="my-profile-input-long" type="text" value="${principal.user.intro}" />
					</div>
				</div>
			</div>
			<div class="my-end my-font-small">
				<p>가입일 : 
				<c:set var="rawCreateDate" value="${user.createDate}" />
				<fmt:parseDate var="parsedDate" value="${rawCreateDate}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
				<fmt:formatDate value="${parsedDate}" pattern="yyyy년 M월 d일" var="formattedDate" />
				${formattedDate}
				</p>
			</div>
		</div>
	</div>
</div>
</form>
<!-- 프로필 변경창 end -->

<div class="button-container-2">
	<span class="mas">저장</span>
	<button id="btn-nick-update">저장</button>
</div>

</div>
</div>
</div>
<script src="/js/user.js"></script>
<script>
function displayFileName() {
    const input = document.getElementById('file');
    const fileNameDisplay = document.getElementById('fileName');
    
    if (input.files.length > 0) {
        fileNameDisplay.textContent = input.files[0].name;
    } else {
        fileNameDisplay.textContent = '';
    }
}
</script>
<%@ include file="../layout/footer.jsp"%>