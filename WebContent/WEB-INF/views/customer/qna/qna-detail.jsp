<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="../css/notice.css?ver=913312"
	type="text/css" rel="stylesheet" />

	<main class="main">
		<div class="notice">
		<div class="detail-option">
				<a href="qna">목록</a> <a href="qna-edit?code=${n.code}">수정</a> <a
					href="qna-del?code=${n.code}">삭제</a>
			</div>
			<div class="detail-table">
				<table class="table">
						<tr class="tr">
							<td class="td">제목</td>
							<td class="td" colspan="3">${n.title}</td>
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
							<td class="td" colspan="3">${n.content}</td>
						</tr>
				</table>
			</div>
			
			
		</div>
	</main>
