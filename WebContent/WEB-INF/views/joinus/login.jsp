<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<div class="main-top">
	<h1 class="main-title">2글 로그인</h1>
	<%-- <c:if test="${not empty msg}">
<div style="color:red;">
${msg}
</c:if> --%>
</div>

<div class="main-bottom">
	<div class="join-form">
		<form action="${ctx}/j_spring_security_check" method="post">
			<div class="input-form">


				<input type="email" name="j_username" placeholder="이메일 주소" /> <!-- <a
					href="findPwd">가입한 이메일주소가 기억나지 않으세요?</a> --> <input type="password"
					name="j_password" placeholder="비밀번호" /> <a href="findPwd">비밀번호가
					기억나지 않으세요?</a>

			</div>
				<div class="table-button">
					<div>
					<input type="image" name="btn"
						src="${ctx}/resource/images/joinus-ok.png" value="로그인" /> 
						<!-- <input
						type="reset" value="취소" /> -->
				<c:if test="${not empty param.error}">
					<span>입력하신 정보가 유효하지 않습니다.</span>
				</c:if>
				</div>
				</div>
		</form>

	</div>
	<div class="dif-form">
		<div id="sns-button-form">
			<a id="kakao-login-btn"></a> <!-- <input type="button" value="카톡 로그아웃"
				onclick="kakaologout()"> -->
		</div>
	</div>
</div>

<script type='text/javascript'>
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('da73a6537cd23ba690961e02bf0be78a');
	// 카카오 로그인 버튼을 생성합니다.
	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			// 로그인 성공시, API를 호출합니다.
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
					//alert(res.properties.nickname + '님 안녕하세용');
					location.href = "${ctx}/customer/search";
					/* alert(JSON.stringify(res)); */
				},
				fail : function(error) {
					alert(JSON.stringify(error));
				}
			});
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
	//]]>

/* 	function kakaologout() {
		Kakao.Auth.logout(function() {
			setTimeout(function() {
				location.href = "main"
			}, 1000);
		});
	} */
</script>

