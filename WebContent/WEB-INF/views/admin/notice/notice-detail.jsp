<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<main class="main">
		<div class="notice">
			<form action="notice-detail" method="get">
		
				<table class="table">
					<tr class="tr">
						<td class="td">제목</td>
						<td class="td" colspan="3">${n.title}</td>
					</tr>
					<tr class="tr">
						<td class="td">작성일</td>
						<td class="td" colspan="3"><fmt:formatDate pattern="yyyy-MM-dd"
								value="${n.regDate}" /></td>
					</tr>
					<tr class="tr">
						<td class="td">작성자</td>
						<td class="td">${n.member_id}</td>
						<td class="td">조회수</td>
						<td class="td">${n.hit}</td>
					</tr>
					<tr class="tr">
						<td class="td">첨부파일</td>
						<td class="td" colspan="3"><c:forEach items="${files}" var="f"
								varStatus="s">
								<a href="/donwload?f=${f.src}">${f.src}</a>
								<c:if test="${! s.last}">,				
						</c:if>
							</c:forEach></td>
					</tr>
					<tr class="tr">
						<td class="td" colspan="4"><c:forEach items="${files}" var="f">
								<img src="upload/${files}" />
							</c:forEach> ${n.content}</td>
					</tr>
		
				</table>
				<div>
					<c:if test="${empty prev}">
				이전글 : 이전글이 없습니다
			</c:if>
					<c:if test="${not empty prev}">
				이전글 :<a href="notice-detail?code=${prev.code}">${prev.title}</a>
					</c:if>
		
				</div>
				<div>
					<c:if test="${next.code==null}">
				다음글 : 다음글이 없습니다
				</c:if>
					<c:if test="${next.code!=null}">
				다음글 :<a href="notice-detail?code=${next.code}">${next.title}</a>
					</c:if>
				</div>
				<div>
					<a href="notice">목록</a> <a href="notice-edit?code=${n.code}">수정</a> <a
						href="notice-del?code=${n.code}">삭제</a>
				</div>
			</form>
		</div>
	</main>
