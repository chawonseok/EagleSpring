<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="../css/notice.css?ver=9131215421323123131312"
	type="text/css" rel="stylesheet" />

	<main class="main">
		<div class="notice">
			<form action="qna-edit" method="post">
				<fieldset>
					<div class="detail-option">
						<input type="hidden" name="code" value="${n.code}" /> <input
							type="submit" value="저장" /> <a
							href="qna-detail?code=${n.code}">취소</a>
					</div>
					<table class="notice">
						<tbody>
							<tr class="tr">
								<td class="td">제목</td>
								<td class="td" colspan="3"><input type="text" name="title"
									value="${n.title}" /></td>
							</tr>
							<tr class="tr">
								<td class="td">작성자</td>
								<td class="td">${n.member_id}</td>
								<td class="td">작성일</td>
								<td class="td"><fmt:formatDate pattern="yyyy-MM-dd"
										value="${n.regDate}" /></td>
							</tr>
							<tr class="tr">
								<th class="td"></th>
								<td class="td" colspan="4">
								<textarea name="content" rows="20" cols="60">${n.content}</textarea>
								</td>
							</tr>
						</tbody>
					</table>
					
				</fieldset>
			</form>
			
		</div>
	</main>
