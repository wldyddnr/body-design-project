<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.member.domain.Member" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="EUC-KR">
        <title>회원가입</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.3.js"
            integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
        <script>
            function check() {
                const check = document.getElementById('check');

                if (memberInfo.name.value.length < 1) {
                    check.innerHTML = '이름을 입력하세요.';
                    memberInfo.name.focus();
                    return false;
                }

                if (memberInfo.password.value.length < 1) {
                    check.innerHTML = '수정하시려면 현재 비밀번호를 입력하세요.';
                    memberInfo.password.focus();
                    return false;
                }

                if (memberInfo.password.value != ${member.getPassword()}){
                    check.innerHTML = '비밀번호를 확인해주세요..';
                    memberInfo.password.focus();
                    return false;
                }

                join.submit();
            }

        </script>
    </head>
    <body>
        <jsp:include page="nav.jsp" />
        <div class="container-sm" style="max-width: 500px;">
            <br> <br>
            <div class="mb-3">
                <h3 style="padding: 20px;">회원정보</h3>
            </div>
            <br>
            <form class="row g-3" name="memberInfo" action="updateInfo" onsubmit="return check(event)" method="post">
                <input type="hidden" value="1" id="idCheck" name="idCheck">
                <div class="mb-1">
                    <label for="id" class="form-label">아이디</label>
                    <div class="input-group">
                        ${member.getId()}
                    </div>
                </div>
                <div class="mb-1">
                    <label for="name" class="form-label">이름</label> <input type="text" class="form-control" id="name"
                        name="name" value="${member.getName()}">
                </div>
                <div class="mb-1">
                    <label for="password" class="form-label">비밀번호</label> <input type="password" class="form-control"
                        id="password" name="password" placeholder="현재 비밀번호를 입력해주세요.">
                </div>
                <div class="mb-1">
                    <label for="email" class="form-label">이메일</label>
                    <div class="input-group">
                        ${member.getEmail()}
                    </div>
                    <br>
                </div>
                <div id="check" style="text-align: center;"></div>
                <div style="text-align: center;"><a style="text-decoration: none;" href="updatePasswordForm">비밀번호 변경</a>&nbsp&nbsp
                <a style="text-decoration: none;" href="deleteMember">탈퇴하기</a></div>
                <div style="text-align: center;">
                    <br>
                    <button type="submit" class="btn btn-dark btn-lg" style="width: 50%; height: 50px;">수정하기</button>
                </div>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
            <jsp:include page="footer.jsp" />
    </body>

    </html>