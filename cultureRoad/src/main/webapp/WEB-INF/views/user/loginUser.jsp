<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<script type="text/javascript">
	
	function resetData(){
		$("#userId").val("");
		$("#userPw").val("");
		$("#userId").focus();
	}
	
	$(function(){
		$("#loginBtn").click(function(){
			let userPw = $("#userPw").val();
			let userId = $("#userId").val();
				$.ajax({
					type : "post",
					url : "/user/login",
					data : {userPw : userPw, userId : userId},
					success : function(result) {
						if(result === "3") {
							$("#loginForm").attr({
								method : "post",
								action : "/user/loginProcess"
							})
							$("#loginForm").submit();
							}else if(result === "2") {
							alert("탈퇴한 회원입니다. 새로운 계정으로 로그인 해주세요.");
							resetData();
						} else {
							alert("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
							resetData();
						}
					}, error : function(){
						alert("서버오류");
					}
				});
			})
				
		$("#signUpBtn").click(function(){
			location.href="/user/signUpForm"
		});
		
		$("#findIdBtn").click(function(){
			location.href="/user/findIdSelect"
		});
		
		$("#findPwdBtn").click(function(){
			location.href="/user/findPwSelect"
		})
		
		$("#logoutBtn").click(function(){
			location.href = "/user/logout"
		});
		$("#myPageBtn").click(function(){
			location.href = "/user/myPage"
		});
		
	})
	</script>

</head>
<body>
	<div class="container">
		<div class="logo">
			<img src="/resources/image/cultureLogo.jpg">
		</div>
		<div>
			<c:if test="${empty userLogin}">
				<form id="loginForm">
					<div>
						<label>아이디</label> <input type="text" name="userId" id="userId">
					</div>
					<div>
						<label>비밀번호</label> <input type="password" name="userPw"
							id="userPw">
					</div>
					<button type="button" id="loginBtn" name="loginBtn">로그인</button>
					<button type="button" id="signUpBtn" name="signUpBtn">회원가입</button>
					<button type="button" id="findIdBtn" name="findIdBtn">아이디
						찾기</button>
					<button type="button" id="findPwdBtn" name="findPwdBtn">비밀번호
						찾기</button>
					<button type="button" id="kakaoLogin" name="kakaoLogin">카카오로
						로그인</button>
					<button type="button" id="naverLogin" name="naverLogin">네이버로
						로그인</button>
				</form>
			</c:if>
			<c:if test="${not empty userLogin}">
				<form class="form-signin" id="userSession">
					<table>
						<tr>
							<td>${userLogin.userName}님환영합니다.</td>
						</tr>
					</table>
					<button type="button" id="logoutBtn" name="logoutBtn">로그아웃</button>
					<button type="button" id="myPageBtn" name="myPageBtn">마이페이지-확인용</button>
				</form>
			</c:if>
		</div>
	</div>
</body>
</html>