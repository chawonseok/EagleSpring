<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<main class="main">
		<div class="notice">
			<form action="notice-edit" method="post">
				<fieldset>
					<legend>공지사항 수정정보 필드</legend>
					<table class="table">
						<tbody>
							<tr class="tr">
								<td class="td">제목</td>
								<td class="td" colspan="3"><input type="text" name="title"
									value="${n.title}" /></td>
		
							</tr>
							<tr class="tr">
								<td class="td">작성일</td>
								<td class="td" colspan="3"><fmt:formatDate pattern="yyyy년-MM월-dd일"
										value="${n.regDate}" /></td>
							</tr>
							<tr class="tr">
								<td class="td">작성자</td>
								<td class="td">${n.member_id}</td>
								<td class="td">조회수</td>
								<td class="td">${n.hit}<%-- <%=hit%> --%></td>
							</tr>
							<tr class="tr">
								<td class="td" colspan="4"><textarea name="content" rows="20" cols="60">${n.content}</textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<div>
						<input type="hidden" name="code" value="${n.code}" /> <input
							type="submit" value="저장"> <a
							href="notice-detail?code=${n.code}">취소</a>
					</div>
				</fieldset>
			</form>
		</div>
	</main>