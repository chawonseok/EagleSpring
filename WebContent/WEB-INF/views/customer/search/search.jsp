<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
	

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