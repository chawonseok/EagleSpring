<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main class="main">
<div class="notice">
		<h1>회원가입 페이지</h1>
		
		<form action="join" method="post">
			<fieldset>
				<legend>회원가입 입력 필드</legend>
				<div>
					<table class="table">
						<tbody>
							<tr class="tr">
								<td class="td">
								<input name="id" type="text" placeholder="이메일 주소" value="${id}"/> 
								<input type="submit" name="btn"	value="중복확인" />
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
								</td>
							</tr>
							<tr class="tr">
								<td class="td">
								<input name="pwd" type="password" placeholder="비밀번호" /></td>
							</tr>
							<tr class="tr">
								<td class="td">
								<input name="pwd2" type="password" placeholder="비밀번호 재입력" />
								<c:if test="${not empty errorMsgPwdNotMatch}">
								<span>${errorMsgPwdNotMatch}</span>
								</c:if>
								</td>
							</tr>
							<tr class="tr">
								<td class="td">
								<input name="nickName" type="text" placeholder="닉네임" value="${nickName }"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<div>
						<input name="btn" type="submit" value="확인" />
					</div>
					<%-- <a href="notice-detail?code=${n.code}">취소</a> --%>
				</div>
			</fieldset>
		</form>
	
	</div>
</main>