<%@ tag language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<div>${p}/${end}pages</div>
<div>
	<%-- <div><a href = "notice?p=${(p==1)?1:p-1}">이전</a></div> 한칸씩 이동 --%>

	<div>
		<a href="notice?p=${(start==1)?1:start-1}&t=${param.t}&q=${param.q}">이전</a>
	</div>
	<ul>
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
	</ul>
	<div>
		<a href="notice?p=${start+5}">다음</a>
	</div>
</div>
