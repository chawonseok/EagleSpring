<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

    <div id="search-category">
    	<div class="category">
    		<a href="${ctx}/admin/search/search-detail?query=">SITE</a>
    	</div>
    	<div class="category">
    		<a href="${ctx}/admin/notice/notice">NOTICE</a>    	
    	</div>
    	<div class="category">
    		<a href="${ctx}/admin/qna/qna"> Q&A </a>
    	</div>
    	<div class="category">
    		<a href="${ctx}/admin/member/member">MEMBER</a>
    	</div>
    </div>