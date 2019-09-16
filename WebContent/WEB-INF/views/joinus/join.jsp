<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set> 
<div class="main-top">
   <h1 class="main-title">가입하기</h1>
</div>

<div class="main-bottom">
   <div class="join-form">
      <form action="join" method="post">
         <div class="input-form">
            <input id="id" name="id" type="email" placeholder="이메일 주소"   value="${id}" /> 
            <input id="check-button" type="image" src="${ctx}/resource/images/zoom.png" name="btn" value="중복확인" />
            <c:choose>
               <c:when test="${not empty duplicatedResult}">
                  <span>${duplicatedResult}</span>
               </c:when>
               <c:when test="${not empty errorMsgIdNotInput}">
                  <span>${errorMsgIdNotInput}</span>
               </c:when>
               <c:when test="${not empty errorMsgIdNotChecked}">
                  <span>${errorMsgIdNotChecked}</span>
               </c:when>
               <c:when test="${not empty errorMsgIdNotCorrect}">
                  <span>${errorMsgIdNotCorrect}</span>
               </c:when>
               <c:otherwise></c:otherwise>
            </c:choose>
            <input name="pwd" type="password" placeholder="비밀번호" /> 
            <input name="pwd2" type="password" placeholder="비밀번호 재입력" />
            <c:if test="${not empty errorMsgPwdNotMatch}">
               <span>${errorMsgPwdNotMatch}</span>
            </c:if>
            <input name="nickName" type="text" placeholder="닉네임" value="${nickName}" />
         </div>


         <div class="table-button">
            <div>
               <input name="btn" type="image" src="${ctx}/resource/images/joinus-ok.png" value="확인" />
            	<input name="btn" type="image" onreset="" src="${ctx}/resource/images/joinus-cancel.png" value="취소"/>
            </div>
            <%-- <a href="notice-detail?code=${n.code}">취소</a> --%>
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
					alert(res.properties.nickname + '님 안녕하세용');
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