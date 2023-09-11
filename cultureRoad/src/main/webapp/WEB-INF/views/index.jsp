<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<!--

TemplateMo 574 Mexant

https://templatemo.com/tm-574-mexant

-->
<script type="text/javascript">
	$(function() {
		$(".movieinfo").click(function() {ㅇㅇ
			let id = $(this).attr("data-num");
			console.log("id :", id);
			$("#id").val(id);
			$("#detail").attr({
				method : "post",
				action : "/movieDetail/" + id
			})
			$("#detail").submit();
		})

		$("#searchBtn").click(function(){
			$("#search").attr({
				method : "post",
				action : "/movieSearch"
			})
			$("#search").submit();
		})
	})
	</script>
    <style type="text/css">
     	.movieDetail{ 
      		height: 540px; 
      		width : 380px; 
     	} 
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
 
 	<jsp:include page="template/header.jsp"/>
 	<jsp:include page="template/banner.jsp"/>
	<jsp:include page="template/search.jsp"/>
 	<jsp:include page="template/ranking.jsp"/>
	<jsp:include page="template/bestComment.jsp"/>
 
  </body>
</html>