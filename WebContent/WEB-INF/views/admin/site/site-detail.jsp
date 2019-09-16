<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<a href="">(${s.code} : ${s.name})디테일 페이지</a>
	</h1>
	<form action="bookmark-reg" method="post"
		style="float:left; width: 50%;">
		<fieldset>
			<table border=1>
				<tbody>
					<tr>
						<td>사이트 이름</td>
						<td>사이트 주소</td>
						<td>좋아요 수</td>
						<td>검색어 출력</td>
						<td>카테고리 이름</td>
					</tr>
					<tr>
						<td>${s.name}</td>
						<td>${s.address}</td>
						<td>${s.good}</td>
						<td>${s.search}</td>
						<td>${s.category}</td>
					</tr>
				</tbody>
			</table>
			<div>
				<input type="hidden" name="code" value="${s.code}"/>
				<input type="submit" value="즐겨찾기"/>
			</div>
		</fieldset>
	</form>
	<div>
	<a href="search">검색페이지</a>
	</div>
</body>
</html>



















