<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>

    <div id="search-category">
       <div class="category">
          <a href="${ctx}/customer/search-detail?query=Assignment">#Assignment</a>
       </div>
       <div class="category">
          <a href="${ctx}/customer/search-detail?query=Fashion">#Fashion</a>       
       </div>
       <div class="category">
          <a href="${ctx}/customer/search-detail?query=Travel">#Travel</a>
       </div>
       <div class="category">
          <a href="${ctx}/customer/search-detail?query=image">#Image</a>
       </div>
    </div>
    <div class="filter">
		<ul>
			<li class="detail-head">검색어 : <a class="detail-body">${query}</a></li>
		</ul>
	</div>

<div class="detail-container">
	
	<%-- <p class="detail-head">관련 검색어 :</p>
            <p class="detail-body"> <c:forEach var="s" items="${list}">${s.name} / </c:forEach></p> --%>
</div>


<c:forEach var="s" items="${list}">
	<div class="list-container">
		<div class="list-content-title">
			<a class="site-nick" href="${ctx}/customer/review?code=${s.code}">
				${s.name} </a>
		</div>
		 <div class="list-content-review">
         <ul>
            <li>카테고리</li>
            <li class="list-content-review-li">${s.search}</li>
         </ul>
      </div>
      <div class="list-content-address"><a href="https://${s.address}">${s.address}</a></div>
      <div class="list-content-bookmark">
         <ul>
            <li>추천</li>
            <li class="list-content-bookmark-li">${s.good}</li>
            <li>즐겨찾기</li>
            <li class="list-content-bookmark-li">${s.good}<%-- ${s.category} --%></li>
         </ul>
      </div>

	</div>
</c:forEach>

