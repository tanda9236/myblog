<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<div class="my-logo my-middle my-fs1">
	<span class="my-scroll-no">MyBlog</span>
</div>
<div class="container my-login">

	<div class="container my-login-form">
		<form action="/login" method="POST" onsubmit="return confirm()">
			<div>
				<div>
					<p class="my-fc-w my-scroll-no my-mb3">로그인</p>
				</div>
				<div id="searchbar" style="margin-bottom: 16px;">
					<input type="text" name="username" id="username" class="my-input" placeholder="Enter Username" maxlength="30"/>
				</div>

				<div id="searchbar" style="margin-bottom: 16px;">
					<input type="password" name="password" id="password" class="my-input" placeholder="Enter Password" maxlength="64"/>
				</div>

				<div>
					<div class="button-container-2">
						<span class="mas" style="padding-top: 2px;">로그인</span>
						<button>로그인</button>
					</div>
				</div>
				<div class="my-sb my-scroll-no my-mt0">
					<a class="my-fc-71 my-cur-p" href="/joinForm">회원가입</a>
					<p class="my-fc-71 my-mlr-1">|</p>
					<a class="my-fc-71 my-cur-p" onclick="alert('준비중!')">계정찾기</a>
				</div>
			</div>

			<div class="my-mt1">
				<div class="my-oauth-login my-scroll-no">
					<a href="/oauth2/authorization/kakao"><img class="my_icon" src="/image/icon_kakao.png" /></a>
					<a href="/oauth2/authorization/google"><img class="my_icon" src="/image/google.png" /></a>
					<a href="/oauth2/authorization/naver"><img class="my_icon" src="/image/naver.png" /></a>
				</div>
			</div>
		</form>
	</div>
	<div class="my-err-msg">
		<c:if test="${not empty error}">
			<p>${exception}</p>
		</c:if>
	</div>
</div>


<c:if test="${not empty error}">
	<script>
		// 		alert("${exception}");
	</script>
</c:if>

<script type="text/javascript">
function confirm() {
	var u = document.getElementById('username').value;
	var p = document.getElementById('password').value;

	if (!u || !p) {
		alert('Username과 Password를 입력해주세요');
		return false;
	}
}
</script>
<%@ include file="../layout/footer.jsp"%>