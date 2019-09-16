<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<main class="main">
	<div class="notice">

		<table class="table">
			<thead>
				<tr class="tr">
					<th class="th">번호</th>
					<th class="th">제목</th>
					<th class="th">작성자</th>
					<th class="th">작성일</th>
				</tr>
	
			</thead>
			<tbody>
				<c:forEach var="q" items="${list}">
					<tr class="tr">
						<td class="td">${q.code}</td>
						<td class="td"><a href="qna-detail?code=${q.code}">${q.title}</a></td>
						<td class="td">${q.member_id}</td>
						<td class="td"><fmt:formatDate pattern="yyyy-MM-dd" value="${q.regDate}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="reg">
			<a href="qna-reg"><img alt="글쓰기" src="${ctx}/resource/images/write.png"></a>
		</div>
		
		<section class="search-form">
				<form action="qna" method="get">
					<fieldset>
						 <select class="search-select" name="t">
							<option value="none">분류선택</option>
		
							<c:if test="${param.t=='title'}">
								<option value="title" selected="selected">제목</option>
							</c:if>
							<c:if test="${param.t!='title'}">
								<option value="title">제목</option>
							</c:if>
		
							<c:if test="${param.t=='content'}">
								<option value="content" selected="selected">내용</option>
							</c:if>
							<c:if test="${param.t!='content'}">
								<option value="content">내용</option>
							</c:if>
		
							<c:if test="${param.t=='member_id'}">
								<option value="member_id" selected="selected">작성자</option>
							</c:if>
							<c:if test="${param.t!='member_id'}">
								<option value="member_id">작성자</option>
							</c:if>
						</select> 
						<input type="text" name="q" placeholder="검색어" value="${param.q}" /> <!-- header와   request에있는 애들 뽑아올수있음.    request.getParamter("q") -->
						<input type="submit" value="검색" /> 
					</fieldset>
				</form>
			</section>




		<c:if test="${empty param.p }">
			<c:set var="p" value="1" />
			<!-- param.p empty -> 1page  -->
		</c:if>
		<c:if test="${not empty param.p }">
			<c:set var="p" value="${param.p}" />
		</c:if>
		<c:set var="start" value="${p-(p-1)%5}" />
		<c:set var="end"
			value="${fn:substringBefore((count%10==0?count/10:count/10+1),'.')}" />


	<%-- <c:if test="${empty param.p}">
				<c:set var="page" value="1" />
			</c:if>
			<c:if test="${not empty param.p}">
				<c:set var="page" value="${param.p}" />
			</c:if>
		
			<c:set var="start" value="${page-(page-1)%5}" />
			<c:set var="end"
				value="${fn:substringBefore((count%10==0?count/10:count/10+1),'.')}" /> --%>

		<div class="page">
			<!-- 페이징 -->
			<!-- 페이지가 1페이지일 때는 이전페이지 눌러도 전페이지 안가게 해주기 다음페이지가 없을 경우 다음페이지 하지 않게 설정 -->
			<ul>
				<li><a href="qna?p=${(start==1)?1:start-1}&t=${param.t}&q=${param.q}">이전</a></li>
				<c:forEach var="i" begin="0" end="4">
					<!-- p는 페이지..?!  -->
					<c:if test="${start+i <=end }">
						<c:if test="${param.p==start+i}">
							<li><a href="qna?p=${start+i}&t=${param.t}&q=${param.q}"
								class="strong">${start+i}</a></li>
							<!--현재 페이지와 같은 녀석은 이런아이  -->
						</c:if>
						<c:if test="${param.p!=start+i}">
							<li><a href="qna?p=${start+i}&t=${param.t}&q=${param.q}">${start+i}</a></li>
							<!-- 같지 않은 녀석은 이 아이  -->
						</c:if>
					</c:if>
				</c:forEach>
				<li><a href="qna?p=${start+5}">다음</a></li>
				<li><a>${p}/${end}pages</a></li>
			</ul>
			
			<%-- <ul>
				<li><a
					href="qna?p=${(start==1)?1:start-1}&q=${param.q}&t=${param.t}"><<</a>
				</li>
				<li><a
					href="qna?p=${(page==1)?1:page-1}&q=${param.q}&t=${param.t}"><</a></li>
				<!-- 변수 n 을 1~5 5번 반복 시킨다 -->
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${start+i <= end}">
						<li><a href="qna?p=${start+i}&q=${param.q}&t=${param.t}"
							<c:if test="${page == start+i}">class="strong"</c:if>>${start+i}</a></li>
					</c:if>
	
				</c:forEach>
	
				<li><a
					href="qna?p=${(page==end)?end:page+1}&q=${param.q}&t=${param.t}">></a>
				</li>
				<li><a
					href="qna?p=${(start+5>end)?end:start+5}&q=${param.q}&t=${param.t}">>></a>
				</li>
	
			</ul> --%>
		</div>




	</div>
</main>
