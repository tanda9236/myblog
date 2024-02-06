<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<!-- 글작성 start -->
<div class="my-write-middle">
	<form>
	<input type="hidden" id="id" value="${board.id}"/>
	<input type="hidden" id="userId" value="${board.user.id}"/>
		<div>
			<input value="${board.title}" type="text" class="my-write-title" placeholder="제목을 입력하세요" id="title">
		</div>
		<div class="form-group my-write-content">
			<textarea id="summernote" name="editordata">${board.content}</textarea>
		</div>
	</form>
	<div class="my-write-content my-float-right my-mt0">
		<div class="button-container-2">
			<span class="mas">수정</span>
			<button id="btn-update">수정</button>
		</div>
	</div>
</div>
<!-- 글작성 end -->

<script src="/js/my_summernote.js"></script>
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>