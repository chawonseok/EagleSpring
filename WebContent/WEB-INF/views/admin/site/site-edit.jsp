<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main class="main">
<div class="site">
	<form action="site-edit" method="post">
		<fieldset>
			<table class="table" border="1" style="margin: auto;">
				<tbody>
					<tr>
						<td>제목</td>
						<td colspan="3">
						<td><input type="text" name="name" value="${s.name}" /></td>
					</tr>
					<tr>
						<td>사이트 주소</td>
						<td colspan="3">
						<td><input type="text" name="address" value="${s.address}" /></td>
					</tr>
					<tr>
						<td>검색키워드</td>
						<td colspan="3">
						<td><input type="text" name="search" value="${s.search}" /></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td colspan="3">
						<td><input type="text" name="category" value="${s.category}" /></td>
					</tr>
					<tr>
						<td>평가</td>
						<td colspan="3">
						<td><input type="text" name="comment" value="${com}" /></td>
					</tr>
					<tr>
						<td class="td" colspan="4"><textarea name="content" rows="20"cols="60">${s.content}</textarea></td>
						
					</tr>
				</tbody>
			</table>
			<div style="text-align: center;">
				<input type="hidden" name="code" value="${s.code}" /> <input
					type="submit" value="저장"> <a
					href="reivew-detail?code=${s.code}">취소</a>
			</div>
		</fieldset>
	</form>
</div>
</main>

<!-- 					<tr>
						<td>검색키워드</td>
						<td><input type="checkbox" name="c1" value="1">ppt <input
							type="checkbox" name="c1" value="2">design <input
							type="checkbox" name="c1" value="3">fashion <input
							type="checkbox" name="c1" value="4">living <input
							type="checkbox" name="c1" value="5">help</td>
					</tr>
					 -->