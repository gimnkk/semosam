$(function() {
	$("#alert-success1").hide();
	$("#alert-danger1").hide();
	$("#alert-success2").hide();
	$("#alert-danger2").hide();
	$("#email").keyup(function() {
		var email= $("#email").val();
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
		if(email.match(emailRule)!=null){
			$("#alert-success1").show();
			$("#alert-danger1").hide();
			$("#submit").removeAttr("disabled");
		} else{
			$("#alert-success1").hide();
			$("#alert-danger1").show();
			$("#submit").attr("disabled", "disabled");
		}

	});
	$("#pwd2").keyup(function() {
		var pwd1 = $("#pwd1").val();
		var pwd2 = $("#pwd2").val();
		if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#alert-success2").show();
				$("#alert-danger2").hide();
				$("#submit").removeAttr("disabled");
			} else {
				$("#alert-success2").hide();
				$("#alert-danger2").show();
				$("#submit").attr("disabled", "disabled");
			}
		}
	});
});
