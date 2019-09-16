<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자페이지</title>
<link href="${ctx}/resource/css/layout.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/resource/admin/css/site/<tiles:getAsString name="css" />" type="text/css" rel="stylesheet" />
<script src="${ctx}/resource/js/modernizr-custom.js"></script>
</head>
<body>
	<!-- site-detail bookmark review용 레이아웃 -->
	<div id="top">
		<tiles:insertAttribute name="visual" />
		<tiles:insertAttribute name="header" />	
	</div>
	<div id="body">
		<div class="content-container clearfix">
			<tiles:insertAttribute name="main" />
		</div>
	</div>
	<!-- --------------------------------------footer------------------------------------ -->
	<tiles:insertAttribute name="footer" />
</body>
</html>