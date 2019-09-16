<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

	<div id="visual">
		<div id="main-text">
			<a href="site-reg"><p>사이트 추가</p></a>
		</div>
		
		<div id="search-form">
			<form action="search-detail" method="get">
				<input class="query-text"  name="query" type="text" value="${param.query}" style="width:300px;"/>
				<input class="hidden" type="submit" value="검색" />
			</form>
		</div>
		
	</div>
