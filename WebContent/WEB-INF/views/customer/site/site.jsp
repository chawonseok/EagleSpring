<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사이트 페이지</h1>
	<table border="1">
		<thead>
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>주소</td>
				<td>좋다</td>
				<td>굳굳</td>
				<td>짱짱</td>
				<td>검색어</td>
				<td>카테고리</td>
			</tr>
		</thead>
		<tbody>
			<!-- 반복문 태그 -->
			<c:forEach var="s" items="${list}">
				<tr>
					<td>${s.code}</td>
					<td><a href="review?code=${s.code}">${s.name}</a></td>
					<td>${s.address}</td>
					<td>${s.good}</td>
					<td>${s.nice}</td>
					<td>${s.excellent}</td>
					<td>${s.search}</td>
					<td>${s.category}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br/><br/>
	<a href="bookmark">즐겨찾기 페이지</a>

</body>
</html>