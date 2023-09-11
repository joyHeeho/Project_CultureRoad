<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
	<script type="text/javascript">
		$(function(){
		
			$("#updateMyPageBtn").click(function(){
				$("#myPageForm").attr({
					"method" : "post",
					"action" : "/user/updateMyPage"
				});
				$("#myPageForm").submit();
			}); 		
			$("#cancelBtn").click(function(){
				location.href="/user/main";
			});
			
		})
	</script>
	
	</head>
	<body>
		<div class="container">
			<div class="logo">
				<img src="/resources/image/cultureLogo.jpg">
			</div>
			<c:if test="${empty userLogin}">
				<form class="form-signin" id="loginForm">
				<h1>로그인을 해주세용</h1>
				</form>
			</c:if>
			<c:if test = "${not empty userLogin}">
				<form id="myPageForm"> 
					<div>
						<label>이름</label>
						<label>${userLogin.userName}</label>				
					</div>
					<div>
						<label>아이디</label>
 		                <input type="hidden" id="userId" name="userId" value="${userLogin.userId}">
						<label>${userLogin.userId}</label>
					</div>
					<div>
						<label>비밀번호</label>
						<input type="password" id="userPw" name="userPw" placeholder="변경할 비밀번호를 입력해 주세요." />
					</div>
					<div>
						<label>이메일</label>
						<input type="email" id="userEmail" name="userEmail" placeholder="변경할 이메일을 입력해 주세요."/>
						<button type="button" id="emailChk" name="emailChk">이메일 인증</button>
					</div>
					<div>
						<label>전화번호</label>
						<input type="text" id="userPhone" name="userPhone" placeholder="변경할 핸드폰 번호를 -빼고 입력해 주세요" />
						<button type="button" id="phoneChk" name="phoneChk">핸드폰 인증</button>
					</div>
					<div>
						<label>생년월일</label>
						<label>${userLogin.userBirth }</label>
					</div>
					<div>
						<label>가입일</label>
						<label>${userLogin.userDate }</label>
					</div>
					<button type="button" id="updateMyPageBtn" name="updateMyPageBtn">수정 완료</button>
					<button type="button" id="cancelBtn" name="cancelBtn">메인페이지로</button>
				</form>
			</c:if> 
		</div>	
	</body>
</html>