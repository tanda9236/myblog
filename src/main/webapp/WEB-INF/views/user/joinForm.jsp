<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<div class="my-logo my-middle my-fs1">
	<span class="my-scroll-no">MyBlog</span>
</div>
<div class="container my-join">

	<div class="container my-login-form">
		<div>
			<form>
				<div>
					<p class="my-fc-w my-scroll-no my-mb2">회원가입</p>
				</div>
				<div id="searchbar" style="margin-bottom: 16px;">
					<input type="text" name="username" id="username" class="my-input" placeholder="Enter Username (6~20)" maxlength="30"/>
				</div>

				<div id="searchbar" style="margin-bottom: 16px;">
					<input type="password" name="password" id="password" class="my-input" placeholder="Enter Password (8~64)" maxlength="64"/>
				</div>

				<div id="searchbar" style="margin-bottom: 16px; background: #aaaaaa;">
					<input type="password" name="passwordCheck" id="passwordCheck" class="my-input" placeholder="Check Password" maxlength="64" style="background: #aaaaaa;"/>
				</div>

				<div id="searchbar" style="margin-bottom: 16px;">
					<input type="email" name="email" id="email" class="my-input" placeholder="Enter Email" maxlength="50"/>
				</div>
			</form>
				<div>
					<div class="button-container-2">
						<span class="mas">회원가입</span>
						<button id="btn-save">회원가입</button>
					</div>
				</div>

				<div class="my-sb my-scroll-no">
					<p class="my-fc-71 my-mt0">Welcome to MyBlog!</p>
				</div>
		</div>
	</div>
</div>
<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>