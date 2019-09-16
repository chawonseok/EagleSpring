<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<main class="main">
	
		<div class="notice">
			<form action="notice-reg" method="post" enctype="multipart/form-data">
				<table class="table">
					<tr class="tr">
						<td class="td">제목</td>
						<td class="td" colspan="3"><input type="text" name="title"
							value="${n.title}" /></td>
					</tr>
					<tr class="tr">
						<td class="td">작성자</td>
						<td class="td" colspan="3"></td>
					</tr>
					<tr class="tr">
						<td class="td">첨부파일</td>
						<td class="td" colspan="3"><input type="file" name="file"></td>
					</tr>
					<tr class="tr">
						<td class="td" colspan="4"><textarea name="content" rows="20" cols="60">${n.content}</textarea>
						</td>
					</tr>
		
				</table>
				<div>
					<input type="submit" value="등록" /> <a href="notice">취소</a>
				</div>
			</form>
		</div>
	</main>