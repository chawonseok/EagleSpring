<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<div class="main-top">
	<h1 class="main-title">정보변경</h1>
</div>
<div class="main-bottom">
	<div class="join-form">


		<form action="edit" method="post">

			<div class="input-form">

				<input id="id" name="id" type="text" readonly value="${m.id}" /> <input
					id="nick-name" name="nickName" type="text" placeholder="닉네임"
					value="${nickName}" /> <input name="pwd" type="password"
					placeholder="비밀번호" /> <input name="pwd2" type="password"
					placeholder="비밀번호 재입력" />

				<input type="text" readonly
					value="<fmt:formatDate pattern="yyyy년-MM월-dd일 가입" value="${m.regDate}"/>" />
			</div>

			<div class="table-button">
				<div>
					<input type="image" src="${ctx}/resource/images/joinus-ok.png" value="저장"> 
				<c:if test="${not empty errorMsgPwdNotMatch}">
					<span>${errorMsgPwdNotMatch}</span>
				</c:if>
				</div>
			</div>

		</form>
	</div>

</div>
