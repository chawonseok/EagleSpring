<%@page import="com.web.model.ReviewModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<!--  "여기에 되돌아갈 파일링크하시면됩니다" -->
<div id="review">
	<div id="title-bar">
		<table>
			<tbody>
				<tr>
					<td><a href="">Adobe color</a></td>
					<td>
						<p>추천 :	${site.good}	즐겨찾기 :	${site.bookcount}</p>
					</td>
					<td>
						<form action="site-up">
							<c:if test="${empty pageContext.request.userPrincipal}">
								<a href="../joinus/login">추천(로그인)</a>
							</c:if>
							<c:if test="${!empty pageContext.request.userPrincipal}">
								<!-- <a>추천</a> -->
								<c:if test="${er eq 'up'}">
									<a href="site-up?code=${site.code}">추천하기</a>
								</c:if>
								<c:if test="${er eq 'down'}">
									<a href="site-up?code=${site.code}">추천지우기</a>
								</c:if>
							</c:if>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div id="content">
		<div id="content-box">

			<div></div>
			<div></div>
			<ul>
				<li><a href=""><img src="${site.src}"></a></li>
				<li><a href=""><img src="${site.src}"></a></li>
				<li><a href=""><img src="${site.src}"></a></li>
				<li><a href=""><img src="${site.src}"></a></li>
			</ul>
		</div>
			
			<div id="comment-box">
				<div id="comment-list">
					<ul>
						<li>${n.member_id}</li>
						<li><fmt:formatDate pattern="yyyy.MM.dd hh:mm"
								value="${n.regdate}" /></li>
						<li><form action="review" method="post">
								<input type="hidden" name="delcode" value="${n.code}" /> <input
									type="hidden" name="s_code" value="${s_code}" /> <input
									type="hidden" name="ID" value="${n.member_id}" /> <input
									type="hidden" name="query" value="${query}" /> <input
									type="submit" name="btn" value="del" />
							</form></li>
						<li>${n.content}</li>
					</ul>
				</div>
				<div id="comment-page">
					<div>${page}/${end}page</div>
					<a href="review?p=${(start>=1)?1:start-1}&code=${s_code}">이전 </a>
	
					<c:forEach var="i" begin="0" end="4">
						<c:if test="${start+i<=end}">
							<c:if test="${page == start+i}">
								<a href="review?p= ${start+i}&code=${s_code} " class="strong">${start+i}</a>
							</c:if>
		
							<c:if test="${page != start+i }">
								<a href="review?p=${start+i}&code=${s_code}">${start+i}</a>
							</c:if>
						</c:if>
					</c:forEach>
	
					<a href="review?p=${(end==page)?end:start+1}&code=${s_code}"> 다음</a>
			</div>
				<div id="comment-post">
					<form action="review" method="post">
						<fieldset>
							<legend></legend>
		
							<textarea name="content">${n.content}</textarea>
							<input type="hidden" name="s_code" value="${s_code}" /> <input
								type="submit" name="btn" value="coment" />
						</fieldset>
					</form>
				</div>
				
		</div>
	</div>
		
</div>
