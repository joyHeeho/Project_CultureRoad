<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

	</head>
	<body>
		<div class="container">
			<div class="logo">
				<img src="/resources/image/cultureLogo.jpg">
			</div>
			<div>
				<c:if test = "${not empty userLogin}">
					<form id="myOrderList">
						<h1>나의 예매내역</h1>
						<div>
							<label>예매번호</label>
							<label>${userLogin.}</label>
						</div>
						<div>
							<label>제목</label>
							<label>${userLogin.}</label>					
						</div>
						<div>
							<label>상영장소</label>
							<label>${userLogin.}</label>
						</div>
						<div>
							<label>상영일시</label>
							<label>${userLogin.}</label>
						</div>
						<div>
							<label>좌석(인원수)</label>
							<label>${userLogin.}</label>
						</div>
						<button type="button" id="enterBtn" name="enterBtn">확인</button>
						<button type="button" id="orderCancelBtn" name="orderCancelBtn">예매 취소</button>
					</form>
				</c:if>
			</div>
		</div>
	</body>
</html>