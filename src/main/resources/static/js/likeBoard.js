let index2 = {
	init: function() {
		$("#btn-like").on("click", () => {
			this.likeBoard();
		});
		$("#btn-unlike").on("click", () => {
			this.unLikeBoard();
		});
	},
	
	// 좋아요 추가
	likeBoard: function() {
		let boardId = $("#boardId").val();
		$.ajax({
			type: "POST",
			url: "/api/board/" + boardId + "/like",
			contentType: "application/json",
            data: JSON.stringify({}) // 빈객체 해주기
		}).done(function(resp) {
//			alert('좋아요 완료.');
			location.reload();
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},
	
	// 좋아요 취소
	unLikeBoard: function() {
		let boardId = $("#boardId").val();
		console.log("취소boardId:"+boardId);
			$.ajax({
				type: "DELETE",
				url: "/api/board/" + boardId + "/unlike",
				dataType: "json"
			}).done(function(resp) {
//				alert('좋아요 취소 완료.');
				location.reload();
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
	}
	
}

index2.init();