<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<main class="main">
	
		<div class="notice">
			<form action="site-reg" method="post" enctype="multipart/form-data">
				<table class="table" border="1" style="margin: auto;">
				<tbody>
					<tr>
						<td>제목</td>
						<td colspan="2"></td>
						<td><input type="text" name="name" value="${s.name}" /></td>
					</tr>
					<tr>
						<td>사이트 주소</td>
						<td colspan="2"></td>
						<td><input type="text" name="address" value="${s.address}" /></td>
					</tr>
					<tr>
						<td>검색키워드</td>
						<td colspan="2"></td>
						<td><input type="text" name="search" value="${s.search}" /></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td colspan="2"></td>
						<td><input type="text" name="category" value="${s.category}" /></td>
					</tr>
					<tr>
						<td>이미지경로</td>
						<td colspan="2"></td>
						<td><input type="text" name="src" value="${s.src}" /></td>
					</tr>
					<tr>
						<td>평가</td>
						<td colspan="2"></td>
						<td><input type="text" name="comment" value="${a.comment}" /></td>
					</tr>
										
					<tr>
						<td class="td" colspan="4"><textarea name="content" rows="20"cols="60">${s.content}</textarea></td>
						
					</tr>
				</tbody>
			</table>
				<div style="text-align: center;">
					<input type="submit" value="등록" /> <a href="site">취소</a>
				</div>
			</form>
		</div>
	</main>