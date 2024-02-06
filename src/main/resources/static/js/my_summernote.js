// 썸머노트 커스텀
$(document).ready(function() {
	$('#summernote').summernote({
		placeholder : '',
		tabsize : 2,
		height: 530,
		minHeight : 530,
		maxHeight : 530,
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
			onImageUpload : function(files) {
				console.log(files)
                uploadSummernoteImageFile(files[0],this);
            }
	}
	});
});

// 썸머노트 이미지 저장 이름형식 변경
function uploadSummernoteImageFile(file, editor) {
    data = new FormData();
    data.append("file", file);
    $.ajax({
        data : data,
        type : "POST",
        url : "/uploadSummernoteImageFile",
        contentType : false,
        processData : false,
        success : function(data) {
            //항상 업로드된 파일의 url이 있어야 한다.
            $(editor).summernote('insertImage', data.url);
        }
    });
}