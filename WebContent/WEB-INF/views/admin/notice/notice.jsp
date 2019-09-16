<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<main class="main">


	<div class="notice">
		<table class="table">
		
			<thead>
				<tr class="tr">
					<td class="td">번호</td>
					<td class="td">제목</td>
					<td class="td">작성자</td>
					<td class="td">작성일</td>
					<td class="td">조회수</td>
				</tr>
			</thead>
		
			<tbody>
				<c:forEach var="n" items="${list}">
					<tr class="tr">
						<td class="td">${n.code}</td>
						<td class="td"><a href="notice-detail?code=${n.code}"> ${n.title}</a></td>
						<td class="td">${n.member_id}</td>
						<td class="td"><fmt:formatDate pattern="yyyy-MM-dd" value="${n.regDate}" /></td>
						<td class="td">${n.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="reg">
			<a href="notice-reg"><img alt="글쓰기"></a>
		</div>
		
		<section class="search-form">
			<form action="notice" method="get">
				<!-- 누가 처리하게 할래?, 검색해서 목록을 달라고 하는거니까 get. 검색은 무조건 get이야 -->
				<fieldset>
					<select class="search-select" name="t">
						<!-- 콤보박스 넣을꺼야 야호 , t는 type-->
						<option class="option" value="NONE">분류선택</option>
			
						<c:if test="${param.t=='TITLE'}">
							<option class="option" value="TITLE" selected="selected">제목</option>
						</c:if>
						<c:if test="${param.t!='TITLE'}">
							<!--ELSE가 없으므로 != 표시해준다  -->
							<option class="option" value="TITLE">제목</option>
						</c:if>
			
			
						<c:if test="${param.t=='MEMBER_ID'}">
							<option class="option" value="MEMBER_ID" selected="selected">작성자</option>
						</c:if>
						<c:if test="${param.t!='MEMBER_ID'}">
							<!--ELSE가 없으므로 != 표시해준다  -->
							<option class="option" value="MEMBER_ID">작성자</option>
						</c:if>
			
						<option class="option" value="CONTENT"
							<c:if test =" ${param.t=='CONTENT'}"> selected="selected" </c:if>>내용</option>
						<!--이건 한 줄로 조건을 걸어버린것  -->
			
						<!-- <option value="TITLE" selected="selected"> selected를 그렇게 하면 기본적으로
			               제목이 나오게 해버리겠다는 의미이다 -->
			
						<!-- selected 제목 내용 작성자에 다 넣었는데 분류 조건에 맞게 검색이 되도록 만들기 위함이다  -->
					</select> <label class="hidden">검색어</label> <input name="q" placeholder="검색어" value="${param.q}" />
					<!-- q는 query -->
					<input type="submit" value="검색" />
				</fieldset>
			</form>
		</section>
		
		<c:if test="${empty param.p }">
			<c:set var="p" value="1" />
			<!-- param.p empty -> 1page  -->
		</c:if> <c:if test="${not empty param.p }">
			<c:set var="p" value="${param.p}" />
		</c:if> <c:set var="start" value="${p-(p-1)%5}" /> <c:set var="end"
			value="${fn:substringBefore((count%10==0?count/10:count/10+1),'.')}" />
					
		<div class="page">
			<ul>
				<li><a href="notice?p=${(start==1)?1:start-1}&t=${param.t}&q=${param.q}">이전</a></li>
				<c:forEach var="i" begin="0" end="4">
					<!-- p는 페이지..?!  -->
					<c:if test="${start+i <=end }">
						<c:if test="${param.p==start+i}">
							<li><a href="notice?p=${start+i}&t=${param.t}&q=${param.q}"
								class="strong">${start+i}</a></li>
							<!--현재 페이지와 같은 녀석은 이런아이  -->
						</c:if>
						<c:if test="${param.p!=start+i}">
							<li><a href="notice?p=${start+i}&t=${param.t}&q=${param.q}">${start+i}</a></li>
							<!-- 같지 않은 녀석은 이 아이  -->
						</c:if>
					</c:if>
				</c:forEach>
				<li><a href="notice?p=${start+5}">다음</a></li>
				<li><a>${p}/${end}pages</a></li>
			</ul>
		</div>
		
		
	
	</div>
	
	
	
</main>
