<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>nav</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-white">
		<div class="container-fluid">
			<a class="navbar-brand" href="/"><img src="https://item.kakaocdn.net/do/bbb480ec0250be12133594a2dce321e6ac8e738cb631e72fdb9a96b36413984e" style="height:50px;"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
 			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<c:choose>
                  <c:when test="${!empty member}">
                      <li class="nav-item"><a class="nav-link" href="/memberInfo">${member.getName()}</a></li>
                      <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                      <li class="nav-item"><a class="nav-link" href="/metabolismForm">칼로리계산기</a></li>
                  </c:when>
                  <c:otherwise>
                      <li class="nav-item"><a class="nav-link" aria-current="page" href="loginForm">로그인</a></li>
                  </c:otherwise>
                </c:choose>
				</ul>
			</div>
		</div>
	</nav>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>