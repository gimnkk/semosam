$("#idCheckAlertDanger1").hide();
$("#pwdCheckAlert").hide();
$("#pwdCheckAlertSuccess").hide();
$("#pwdCheckAlertDanger").hide();

function idCheck() {
   var email = $("#email").val();

   var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;// 이메일정규식
   var idcheck = document.getElementById("idcheck");
   if (email.match(emailRule) == null) {
      $("#idcheck").hide();
      $("#idCheckAlertDanger1").show();
      $("#submit").attr("disabled", "disabled");
   } else {
      $("#idcheck").show();
      $("#idCheckAlertDanger1").hide();
      $("#submit").removeAttr("disabled");
      idCheckOfServer(email);
   }
}

function idCheckOfServer(email) {
   var xhttp = new XMLHttpRequest();
   xhttp.onreadystatechange = function() {
      var idcheck = document.getElementById("idcheck");
      if (this.readyState == 4 && this.status == 200) {
         var div = this.response;
         idcheck.innerHTML = div;
         return div;
      }
   }
   var params = "?email=" + encodeURIComponent(email);
   xhttp.open("GET", "/JSP_PROJECT/nohead/idCheck.jsp" + params);
   xhttp.send();
}

function pwdCheck() {

   var pwd = $("#pwd1").val();
   var pwdRule = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
   if (pwd.match(pwdRule) != null) {
      $("#pwdCheckAlert").hide();
      $("#submit").removeAttr("disabled");
   } else {
      $("#pwdCheckAlert").show();
      $("#submit").attr("disabled", "disabled");
   }

}

function pwdCheck2() {

   var pwd1 = $("#pwd1").val();
   var pwd2 = $("#pwd2").val();

   if (pwd1 != "" || pwd2 != "") {
      if (pwd1 == pwd2) {
         $("#pwdCheckAlertSuccess").show();
         $("#pwdCheckAlertDanger").hide();
         $("#submit").removeAttr("disabled");
      } else {
         $("#pwdCheckAlertSuccess").hide();
         $("#pwdCheckAlertDanger").show();
         $("#submit").attr("disabled", "disabled");
      }
   }

}
