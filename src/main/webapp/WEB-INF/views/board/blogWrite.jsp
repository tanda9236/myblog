<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<!-- 글작성 start -->
<div class="my-write-middle">
	<form>
		<div>
			<input type="text" class="my-write-title" placeholder="제목을 입력하세요" id="title">
		</div>
		<div class="form-group my-write-content">
			<textarea id="summernote" name="editordata"></textarea>
		</div>
	</form>
	<div class="my-write-content my-float-right my-mt0">
		<div class="button-container-2">
			<span class="mas">완료</span>
			<button id="btn-save">완료</button>
		</div>
	</div>
</div>
<!-- 글작성 start -->

<script src="/js/my_summernote.js"></script>
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>