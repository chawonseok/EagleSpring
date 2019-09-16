<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<%-- <div class="detail-container">
   <ul>
      <li><a href="${s.address}"></a></li>
      <li class="detail-head">검색어 :</li>
      <li class="detail-body">${query}</li>
   </ul>
   <p class="detail-head">관련 검색어 :</p>
   <p class="detail-body">
      <c:forEach var="s" items="${list}">${s.name} / </c:forEach>
   </p>
</div> --%>

   
   <p style="font-size:20px;line-height:20px;">
         맴버관리페이지      
   </p>
   
   <div class="site-head">
      <ul>
         <li>이름</li>
         <li>카테고리</li>
         <li>주소</li>
         <li>추천</li>
         <li>즐찾</li>
      </ul>
   </div>
   <div class="site-con">
      <c:forEach var="s" items="${list}">
      <ul class="site-body">
         <li>
            <a href="${ctx}/admin/review?code=${s.code}">
                    ${s.name} 
                 </a>
             </li>
             
         <%-- <li>${s.comment}</li> --%>
         <li>${s.category}</li>
         
         <li><a href="http://${s.address}">${s.address}</a></li>
         <li>${s.good}</li>
         <li>${s.bookcount}</li>
         <li><a href="site-del?code=${s.code}">X</a></li>
      </ul>
      </c:forEach>
   </div>
<%-- <c:forEach var="s" items="${list}">
   <div class="list-container">
      <div class="list-content-title">
         <a class="site-nick" href="${ctx}/admin/review?code=${s.code}">
            ${s.name} </a>
      </div>
      <div class="list-content-review">
         <ul>
            <li>평가</li>
            <li class="list-content-review-li">${s.comment}</li>
         </ul>
      </div>
      <div class="list-content-address"><a>${s.address}</a></div>
      <div class="list-content-bookmark">
         <ul>
            <li>추천</li>
            <li class="list-content-bookmark-li">${s.good}</li>
            <li>즐겨찾기</li>
            <li class="list-content-bookmark-li">${s.good}${s.category}</li>
            <li><a href="site-del?code=${s.code}">X</a></li>
         </ul>
      </div>

   </div>
</c:forEach> --%>