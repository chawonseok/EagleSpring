<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<script>
	$("#rolling").rolling(490,290,{autoscroll:1, delay:1400});
</script> 

<div id="visual">
	<div id="main-text">
		<p>나에게 정말 필요한 사이트를 검색해보세요</p>
	</div>

	<div id="search-form">
		<form action="search-detail" method="get">

			<input class="query-text" name="query" type="text"
				value="${param.query}" style="width: 300px;" /> <input
				class="hidden" type="submit" value="검색" />
		</form>
	</div>
</div>
<%-- <div>
	<div id="rolling">
  <ul>
   <li class="sp01"><img src="${ctx}/resource/images/1.png"></li>
   <li class="sp02"><img src="${ctx}/resource/images/2.png"></li>
   <li class="sp03"><img src="${ctx}/resource/images/3.png"></li>
  </ul>
	</div>
<ul class="pages"></ul>
</div> --%>




