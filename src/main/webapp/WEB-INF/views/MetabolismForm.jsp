<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>칼로리계산기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script>

        $(document).ready(function(){
            if('${metabolism.getGender()}' == 'female'){
                $('#female').prop('checked', true);
            } else{
                $('#male').prop('checked', true);
            }
            $('#activity').val('${metabolism.getActivity()}').prop("selected",true);

        });


        function metabolism() {

            const check = document.getElementById('check');
            if (age.value.length < 1) {
                check.innerHTML = '나이를 입력하세요.';
                age.focus();
                return false;
            }

            if (height.value.length < 1) {
                check.innerHTML = '키를 입력하세요.';
                height.focus();
                return false;
            }

            if (weight.value.length < 1) {
                check.innerHTML = '몸무게를 입력하세요.';
                weight.focus();
                return false;
            }

            if($("input:radio[name=gender]:checked").length < 1){
                check.innerHTML = '성별을 선택하세요.';
                gender-radio.focus();
                return false;
            }

            if (activity.value == 1) {
                check.innerHTML = '활동량을 선택하세요.';
                activityRate.focus();
                return false;
            }

            check.innerHTML = '';

            var BMR = 0;
            var gender = $("input[type=radio][name=gender]:checked").val();

            if (gender == 'male') {
                BMR = 10 * weight.value + 6.25 * height.value - 5 * age.value + 5;
            } else {
                BMR = 10 * weight.value + 6.25 * height.value - 5 * age.value - 161;
            }
            console.log(BMR);
            $('#basalMetabolicRate').val(Math.round(BMR));
            $('#activityMetabolism').val(Math.round(BMR * $('#activity').val()));
        }


        function check() {

            const check = document.getElementById('check');
            const check2 = document.getElementById('check2');
            if (age.value.length < 1) {
                check.innerHTML = '나이를 입력하세요.';
                age.focus();
                return false;
            }

            if (height.value.length < 1) {
                check.innerHTML = '키를 입력하세요.';
                height.focus();
                return false;
            }

            if (weight.value.length < 1) {
                check.innerHTML = '몸무게를 입력하세요.';
                weight.focus();
                return false;
            }



            if (activity.value == 1) {
                check.innerHTML = '활동량을 선택하세요.';
                activityRate.focus();
                return false;
            }

            if (basalMetabolicRate.value.length < 1) {
                check2.innerHTML = '계산하기를 눌러주세요.';
                basalMetabolicRate.focus();
                return false;
            }

            check.innerHTML = '';
            metabolismForm.submit();
        }
    </script>
</head>
<body>
    <jsp:include page="nav.jsp" />
    <div class="container-sm" style="max-width: 500px;">
            <br><br>
            <div class="mb-3">
                <h3 style="padding: 20px;">칼로리 계산기</h3>
            </div>
            <br>
            <form class="row g-3" action="metabolismUpdate" name="metabolismForm" method="post">
                <input type="hidden" value="${member.getId()}" id="mid" name="mid">
                <div class="mb-3 row">
                    <label for="age" class="col-sm-2 col-form-label">나이:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="age" name="age" value="${metabolism.getAge()}">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="height" class="col-sm-2 col-form-label">키(cm):</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="height" name="height" value="${metabolism.getHeight()}">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="weight" class="col-sm-2 col-form-label">몸무게(kg):</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="weight" name="weight" value="${metabolism.getWeight()}">
                    </div>
                </div>
                <div class="mb-3 row">
                    <div class="form-check-inline" id="gender-radio" name="gender-radio">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="male">
                        <label class="form-check-label" for="male">
                            남자
                        </label>
                        <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                        <label class="form-check-label" for="female">
                            여자
                        </label>
                    </div>
                </div>
                <div class="mb-3 row">
                    <select class="form-select" aria-label="Default select example" id="activity" name="activity">
                        <option value="1">활동량을 선택해주세요</option>
                        <option value="1.2">빈둥빈둥</option>
                        <option value="1.5">좌식 업무</option>
                        <option value="1.8">돌아다니는 업무</option>
                        <option value="2">활동적인 업무</option>
                    </select>

                </div>
                <div class="mb-3 row">
                    <div id="check" style="text-align: center; font-weight:bold; color: blue;"></div>
                </div>
                <div class="mb-3 row">
                    <div style="text-align: center;">
                        <button type="button" class="btn btn-dark" style="width: 50%; height: 50px;"
                            onclick="metabolism();">계산하기</button>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="basalMetabolicRate" class="col-sm-2 col-form-label">기초대사량:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="basalMetabolicRate" name="basalMetabolicRate" value="${metabolism.getBasalMetabolicRate()}" readonly>kcal
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="activityMetabolism" class="col-sm-2 col-form-label">활동대사량:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="activityMetabolism" name="activityMetabolism" value="${metabolism.getActivityMetabolism()}" readonly>kcal
                    </div>
                </div>
                <div class="mb-3 row">
                    <div id="check2" style="text-align: center; font-weight:bold; color: blue;"></div>
                </div>
                <div class="mb-3 row">
                    <div style="text-align: center;">
                        <button type="button" class="btn btn-dark" style="width: 50%; height: 50px;"
                            onclick="check();">저장하기</button>
                    </div>
                </div>
            </form>
        </div>
        <jsp:include page="footer.jsp" />
</body>
</html>