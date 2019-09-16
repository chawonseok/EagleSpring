<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<main class="main">
	
		<div class="reg">
			<form action="notice-reg" method="post" enctype="multipart/form-data">
			
				<table class="table">
					<tr class="tr">
						<th class="th">제목</th>
						<td class="td"><input type="text" name="title"
							value="${n.title}" /></td>
					</tr>
					<tr class="tr">
						<th class="th">작성자</th>
						<td class="td"></td>
					</tr>
					
					<tr class="tr">
						<th class="th">내용</th>
						<td class="td"><textarea name="content" rows="20" cols="60">${n.content}</textarea>
						</td>
					</tr>
		
				</table>
				<div>
					<input type="submit" value="등록" /> <a href="notice">취소</a>
				</div>
			</form>
		</div>
	</main>