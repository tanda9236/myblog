<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

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
<script>
$(document).ready(function() {
	$('#summernote').summernote({
		placeholder : '',
		tabsize : 2,
		height: 530,
		minHeight : 530,
		maxHeight : 530,
// 		focus : true,
		disableResizeEditor : true,
		lang : 'ko-KR',
		toolbar : [
			['style', ['style'] ],
			['fontsize', ['fontsize']],
			['font',['bold','italic','underline','strikethrough','clear']],
			['color',['color']],
			['para',['paragraph']],
			['height',['height']],
			['table',['table']],
			['insert',['picture','link','hr']],
			['view',['codeview']]],
		fontSizes : ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72',],
		lineHeights : ['0.2','0.3','0.4','0.5','0.6','0.8','1.0','1.2','1.4','1.5','2.0','3.0'],
		callbacks : {
			onInit : function() {
				$('.note-editable').css({'color' : 'white'});
				}
	}
	});
});
</script>
<script type="text/javascript">
function confirm() {
	var t = document.getElementById('title').value;
	var c = document.getElementById('content').value;
	
if (!t) {
	alert('Title을 입력해주세요');
	return false;
	}
}
</script>
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>