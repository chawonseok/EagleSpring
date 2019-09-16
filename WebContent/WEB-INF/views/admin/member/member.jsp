<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
	
	

	<p style="font-size:20px;line-height:20px;">
		맴버관리페이지		
	</p>
	
	<ul class="member-head">
		<li>아이디</li>
		<li>비밀번호</li>
		<li>별명</li>
		<li>권한</li>
		<li>가입일자</li>
		<li>활성화</li>
	</ul>
	<form method="post" action="member">
		<div class="member-con">
			<c:forEach var="m" items="${list}">
			<ul class="member-body">
				<li>${m.memberId}</li>
				<li>${m.pwd}</li>
				<li>${m.nickname}</li>
				<li>${m.rolename}</li>
				<li>${m.regdate}</li>
				<li>${m.enable}</li>	
			</ul>
			<div class="member-delete">
				<a href="member-del?memberId=${m.memberId}">X</a>
			</div>
			</c:forEach>
		</div>
	</form>