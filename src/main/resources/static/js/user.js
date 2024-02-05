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
		let username = $("#username").val();
		let password = $("#password").val();
		let passwordCheck = $("#passwordCheck").val();
		let email = $("#email").val();
		let emailForm = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	    
	    if (username == null || username.length < 6 || username.length > 20) {
	        alert('Username을 입력해주세요(6~20자)');
	        return false;
	    }
	    if (password.length < 8 || password.length > 64) {
	        alert('Password를 입력해주세요 (8~64)자');
	        return false;
	    }
	    if (password != passwordCheck) {
	        alert("Password가 일치하지 않습니다");
	        return false;
	    }
	    if (!email || !emailForm.test(email)) {
	        alert('올바른 Email을 입력해주세요');
	        return false;
	    }
		
		let data = {
			username: username,
			password: password,
			email: email
		};
		
		$.ajax({
			type: "POST",
			url: "/auth/joinProc",
			data: JSON.stringify(data), 
			contentType: "application/json; charset=utf-8",
			dataType: "json" 
		}).done(function(resp){
			if(resp.status === 500){
				alert('회원가입이 실패하였습니다.(아이디 중복)');
			}else{
				alert('회원가입이 완료되었습니다.');
				location.href = "/loginForm";
			}
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
		updateNickname: function() {
	    let nickname = $("#nickname").val();
	    if (!nickname || nickname.length < 2 || nickname.length > 18) {
	        alert('Nickname을 입력해주세요(2~18자)');
	        return;
	    }
	    
	    let formData = new FormData();
	    formData.append("id", $("#id").val());
	    formData.append("nickname", nickname);
	    formData.append("intro", $("#intro").val());
	    formData.append("file", $("#file")[0].files[0]);

	    $.ajax({
	        type: "PUT",
	        url: "/user/nickname",
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function(resp) {
	            alert('수정이 완료되었습니다.');
	            location.reload();
	        },
	        error: function(xhr, status, error) {
	            alert(JSON.stringify(error));
	        }
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