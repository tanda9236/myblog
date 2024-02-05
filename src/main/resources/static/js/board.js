let index = {
	init: function() {
		$("#btn-save").on("click", () => {
			this.save();
		});
		$("#btn-delete").on("click", () => {
			this.deleteById();
		});
		$("#btn-update").on("click", () => {
			this.update();
		});
		$("#btn-reply-save").on("click", () => {
			this.replySave();
		});
	},

	save: function() {
		
		let title = $("#title").val();
		if (!title) {
        alert('Title을 입력해주세요');
        return;
    	}
    	
		let data = {
			title: title,
			content: $("#summernote").val()
		};

		$.ajax({
			type: "POST",
			url: "/api/board",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert('작성이 완료되었습니다.');
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},

	deleteById: function() {
		if (confirm("정말로 삭제하시겠습니까?\n( 복구할 수 없습니다 )")) {
			let id = $("#id").text();
	
			$.ajax({
				type: "DELETE",
				url: "/api/board/" + id,
				dataType: "json"
			}).done(function(resp) {
				alert('삭제가 완료되었습니다.');
				location.href = "/";
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		}
	},

	update: function() {
		let id = $("#id").val();
		let title = $("#title").val();
		if (!title) {
        alert('Title을 입력해주세요');
        return;
    	}
		
		let data = {
			title: title,
			content: $("#summernote").val()
		};

		$.ajax({
			type: "PUT",
			url: "/api/board/" + id,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert('글수정이 완료되었습니다.');
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},
	
	replySave: function() {
		let content = $("#reply-content").val()
		
		if (content.length < 1) {
	        alert('내용을 입력해주세요.');
	        return false;
	    }
	    
		let data = {
			userId: $("#userId").val(),
			boardId: $("#boardId").val(),
			content: content
		};

		$.ajax({
			type: "POST",
			url: `/api/board/${data.boardId}/reply`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert('댓글작성이 완료되었습니다.');
			location.reload();
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},

	replyDelete: function(boardId, replyId) {
		if (confirm("정말로 삭제하시겠습니까?\n( 복구할 수 없습니다 )")) {
			$.ajax({
				type: "DELETE",
				url: `/api/board/${boardId}/reply/${replyId}`,
				dataType: "json"
			}).done(function(resp) {
				alert('댓글삭제 성공.');
				location.reload();
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		}
	}
}

index.init();