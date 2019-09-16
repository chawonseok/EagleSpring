<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eagle</title>
<!-- 브라우져가 요청(주소창에서 나오는 위치에 맞추어서 디렉토리 결정) -->
<link href="${ctx}/resource/customer/css/notice/layout.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/resource/customer/css/notice/<tiles:getAsString name="css" />" 
	  type="text/css" rel="stylesheet" />
<script src="${ctx}/resource/js/modernizr-custom.js"></script>
</head>

<body>
	<div id="top">
		<tiles:insertAttribute name="visual" />
		<tiles:insertAttribute name="header" />	
	</div>	
	<div id="body">
		<div class="content-container clearfix">
			<tiles:insertAttribute name="subheader" />
			<tiles:insertAttribute name="main" />
		</div>
	</div>
	<tiles:insertAttribute name="footer" />

</body>
</html>