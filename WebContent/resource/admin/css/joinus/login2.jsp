<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set> 

<main> 
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<a id="kakao-login-btn"></a> <input type="button" value="카톡 로그아웃"
	onclick="kakaologout()"> <script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('3bfc7c28d28e2040bc5080725fbbeba6');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				// 로그인 성공시, API를 호출합니다.
				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {
						alert(res.properties.nickname + '님 안녕하세용');
						location.href = "notice";
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

		function kakaologout() {
			Kakao.Auth.logout(function() {
				setTimeout(function() {
					location.href = "main"
				}, 1000);
			});
		}
	</script>

<h2>로그인</h2>
<c:if test="${not empty msg}">
<div style="color:red;">
${msg}
</div>
</c:if>
<form action="${ctx}/j_spring_security_check" method="post">
<label>아이디:</label>
<input name="j_username"/>
<label>비번:</label>
<input name="j_password"/>
<input type="submit" name="btn" value="확인" />
</form>

</main>
