<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
	<script type="text/javascript">
	  let idCheckPassed = false;
      let pwCheckPassed = false;
      
		function isUserIdValid(userId) {
		    let regex = /^[a-z0-9]{6,15}$/;
		    
		    if (regex.test(userId)) {
		        // 유효성 검사 통과
		        $.ajax({
		            url: "/user/idChk",
		            type: "post",
		            dataType: "text",
		            data: {
		                userId: userId
		            },
		            success: function(result) {
		                if (result === "사용가능") { // === 연산자 사용
		                    alert("사용할 수 있는 아이디 입니다.");
		                	idCheckPassed = true;
		                } else {
		                    alert("이미 존재하는 아이디입니다. 영어 소문자, 숫자를 조합하여 6~15자 내외로 입력하세요.");
		                    $("#userId").val("");
			                $("#userId").focus();
		                }
		            },
		            error: function(xhr, textStatus, errorThrown) {
		                alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
		            }
		        });
		    } else {
		        alert("영어 소문자와 숫자를 조합하여 6~15자리 사이로 입력하세요.");
		    }
		}
	 

	 function isUserPwValid(userPw) {
	     var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!])[A-Za-z\d@#$%^&+=!]{9,20}$/;
	     
	     if (regex.test(userPw)) {
	         // 유효성 검사 통과
	         $("#msg").text("적합한 비밀번호입니다.");
	         pwCheckPassed = true;
	     } else {
	         $("#msg").text("사용할 수 없는 비밀번호 입니다. 소문자, 대문자, 숫자, 특수문자를 조합하여 9~20자 내외로 입력하세요.").css("red");
	         $("#userPw").val(""); // 비밀번호 필드를 비웁니다.
	         $("#userPw").focus();
	     }
	 }
	 
		// 아이디 확인 버튼 클릭 시 유효성 검사 및 중복 체크 수행
		$(function() {
          
		    $("#idChk").click(function() {
		        let userId = $("#userId").val();
		        isUserIdValid(userId); 
		    });
		    
		    $("#PwChk").click(function(){
		    	let userPw = $("#userPw").val();
		    	isUserPwValid(userPw);
		    })
		    
		    $("#cancelBtn").click(function(){
				location.href="/user/main";
			})
			
			$("#confirmBtn").click(function(){
				if(!chkData("#userName","이름을")) return;
	            else if(!chkData("#userId","아이디를")) return;
	            else if(!chkData("#userPw","비밀번호를")) return;
	            else if(!chkData("#userEmail","이메일을")) return;
	            else if(!chkData("#userPhone","핸드폰번호를")) return;
	            else if(!chkData("#userBirth","생년월일을")) return;
				else{
					if(idCheckPassed && pwCheckPassed) {
						$("#signUpForm").attr({
							"method" : "post",
							"action" : "/user/signUp"
						});
						$("#signUpForm").submit();
					} else {
						alert("중복체크가 완료되지 않았습니다.");
					}	
				}
			});
		}); 
		
	</script>
	</head>
	<body>
		<div class="container">
			<div class="logo">
				<img src="/resources/image/cultureLogo.jpg">
			</div>
			<form id="signUpForm">
				<div>
					<label>이름</label>
					<input type="text" id="userName" name="userName" placeholder="이름을 입력해 주세요."/>
				</div>
				<div>
					<label>아이디</label>
					<input type="text" id="userId" name="userId" placeholder="아이디를 입력해 주세요."/>
					<button type="button" id="idChk" name="idChk">아이디중복체크</button>
				</div>
				<div>
					<label>비밀번호</label>
					<input type="password" id="userPw" name="userPw" maxlength="20" placeholder="비밀번호를 입력해 주세요." />
					<button type="button" id="PwChk" name="PwChk">비밀번호체크</button>
					<span id="msg"></span>				
				</div>
				<div>
					<label>이메일</label>
					<input type="email" id="userEmail" name="userEmail" />
					<button type="button" id="emailChk" name="emailChk">이메일 인증</button>
				</div>
				<div>
					<label>전화번호</label>
					<input type="text" id="userPhone" name="userPhone"/>
					<button type="button" id="phoneChk" name="phoneChk">핸드폰 인증</button>
				</div>
				<div>
					<label>생년월일</label>
					<input type="text" id="userBirth" name="userBirth" placeholder="000101형식으로 입력하세요" maxlength="6"/>
				</div>
				
				<button type="button" id="confirmBtn" name="confirmBtn">회원가입</button>
				<button type="button" id="cancelBtn" name="cancelBtn">취소</button>
			</form>
		</div>
	</body>
</html>