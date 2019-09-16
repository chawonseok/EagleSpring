<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../css/notice.css?ver=9131215421323123131312"
	type="text/css" rel="stylesheet" />
	
<main class="main">
	<div class="qna-reg">

	<form action="qna-reg" method="post">
			<fieldset>
				<table class="table">
					<tbody>
						<tr class="tr">
							<th class="td" scope="row">제목</th>
							<td class="td"><input type="text" name="title" value="${n.title}" /></td>
						</tr>
						<tr class="tr">
							<th class="td" scope="row">내용</th>
							<td class="td"><textarea name="content" rows="20" cols="60">${n.content}</textarea></td>
						</tr>
					</tbody>
				</table>
	
				<div>
					<input type="submit" value="등록" /> <a href="qna">취소</a>
				</div>
			</fieldset>
		</form>
	</div>
</main>