<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<div class="main-top">
	<h1 class="main-title">2글 비밀번호 찾기</h1>
</div>
<div class="main-bottom">
	<div class="join-form">
		<form action="findPwd" method="post">
			<div class="input-form">

				<span>가입된 이메일 주소를 입력해주세요.</span> 
				<span>2글이 이메일로 임시 비밀번호를 보내드립니다.</span> 
				<span>임시 비밀번호로 로그인 후, 비밀번호를 변경해주세요.</span> 
				<input type="email" name="id" placeholder="이메일 주소 입력" />
				<div class="table-button">


					<input name="btn" type="image"
						src="${ctx}/resource/images/joinus-ok.png" value="확인" />

				<c:if test="${not empty errorMsgIdNotCorrect}">
					<span id="error">${errorMsgIdNotCorrect}</span>
				</c:if>
				</div>
			</div>



		</form>
	</div>
</div>
