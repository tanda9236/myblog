let index = {
	init: function(){
		$("#btn-save").on("click",()=>{ 
			this.save();
		});
		$("#btn-nick-update").on("click",()=>{
			this.updateNickname();
		});
		$("#btn-pass-update").on("click",()=>{
			this.updatePass();
		});
	},
	
	save: function(){
		let data = {
			username: $("#username").val(),
			password: $("#password").val(),
			email: $("#email").val()
		};
		
		$.ajax({
			type: "POST",
			url: "/auth/joinProc",
			data: JSON.stringify(data), 
			contentType: "application/json; charset=utf-8",
			dataType: "json" 
		}).done(function(resp){
			if(resp.status === 500){
				alert('회원가입이 실패하였습니다.');
			}else{
				alert('회원가입이 완료되었습니다.');
				location.href = "/";
			}
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	updateNickname: function(){
		let nickname = $("#nickname").val();
		if(!nickname || nickname.length < 2 || nickname.length > 18){
			alert('Nickname을 입력해주세요(2~18자)');
			return;
		}
		
		let data = {
			id: $("#id").val(),
			nickname: nickname,
			
			password: $("#password").val(),
			username: $("#username").val()
		};
		
		console.log(id);
		console.log(nickname);
		
		$.ajax({
			type: "PUT",
			url: "/user/nickname",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert('닉네임 수정이 완료되었습니다.');
			location.reload();
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	updatePass: function(){
		let pass = $("#password").val();
		let passCheck = $("#passwordCheck").val();
		if(!pass || pass != passCheck || pass.length < 8 || pass.length > 64){
			alert('Password를 입력해주세요(8~64자)');
			return;
		}
		let data = {
			id: $("#id").val(),
			password: $("#password").val(),
		};
		
		$.ajax({
			type: "PUT",
			url: "/user/password",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert('비밀번호 수정이 완료되었습니다.');
			location.href = "/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
}

index.init(); 