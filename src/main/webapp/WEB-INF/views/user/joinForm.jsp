<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<div class="my-logo my-middle my-fs1">
	<span class="my-scroll-no">MyBlog</span>
</div>
<div class="container my-join">

	<div class="container my-login-form">
		<form action="/join" method="POST" onsubmit="return confirm()">
			<div>
				<div>
					<p class="my-fc-w my-scroll-no my-mb2">회원가입</p>
				</div>
				<div id="searchbar" style="margin-bottom: 16px;">
					<input type="text" name="username" id="username" class="my-input" placeholder="Enter Username (6~20)" maxlength="30"/>
				</div>

				<div id="searchbar" style="margin-bottom: 16px;">
					<input type="password" name="password" id="password1" class="my-input" placeholder="Enter Password (8~64)" maxlength="64"/>
				</div>

				<div id="searchbar" style="margin-bottom: 16px; background: #aaaaaa;">
					<input type="password" name="password-check" id="password2" class="my-input" placeholder="Check Password" maxlength="64" style="background: #aaaaaa;"/>
				</div>

				<div id="searchbar" style="margin-bottom: 16px;">
					<input type="email" name="email" id="email" class="my-input" placeholder="Enter Email" maxlength="50"/>
				</div>

				<div>
					<div class="button-container-2">
						<span class="mas">회원가입</span>
						<button>회원가입</button>
					</div>
<!-- 					<button class="my-btn-login my-mb1 my-scroll-no">회원가입</button> -->
				</div>

				<div class="my-sb my-scroll-no">
					<p class="my-fc-71 my-mt0">Welcome to MyBlog!</p>
				</div>
			</div>

		</form>
	</div>

</div>
<script type="text/javascript">
	function confirm() {
		var u = document.getElementById('username').value;
		var p1 = document.getElementById('password1').value;
		var p2 = document.getElementById('password2').value;
		var e = document.getElementById('email').value;
		var eForm = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		
		if (u == null || u.length < 6 || u.length > 20) {
			alert('Username을 입력해주세요(6~20자)');
			return false;
		}
		if (p1.length < 8) {
			alert('Password를 입력해주세요 (8~64)자');
			return false;
		}
		if (p1 != p2) {
			alert("Password가 일치하지 않습니다");
			return false;
		}
		if (!e || !eForm.test(e)) {
			alert('올바른 Email을 입력해주세요');
			return false;
		}
	}
</script>
<%@ include file="../layout/footer.jsp"%>