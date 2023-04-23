<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.domain.Member" %>
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
<%
    Member member = (Member) session.getAttribute("member");
    System.out.println(member);
%>
	<nav class="navbar navbar-expand-lg bg-body-white">
		<div class="container-fluid">
			<a class="navbar-brand" href="/"><img src="https://pds.saramin.co.kr/company/logo/201509/08/1441692003_fa79-b4d24804_logo.jpg" style="height:70px;"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
 			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<%
        			if(member == null){
                %>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="loginForm">로그인</a></li>
				<%
				}else{
				%>
				    <li class="nav-item"><a class="nav-link" href="/memberInfo"><%=member.getName()%></a></li>
                    <li class="nav-item"><a class="nav-link active" href="/logout">로그아웃</a></li>
                <%
                }
                %>
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