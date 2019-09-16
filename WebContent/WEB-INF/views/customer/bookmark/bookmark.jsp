<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>

		<div class="content-container clearfix">
			<h1 class="hidden">바디 영역</h1>
			<form action="bookmark-del" method="post">
				<h2 class="hidden">즐겨찾기 목록</h2>
				<div id="bmark-title">
					<p>즐겨찾기</p>
				</div>
				
				<c:forEach var="l" items="${list}">
				<div class="list-container">
					<!-- <div class="site-photo">
						<img src="test.png"/>					
					</div> -->	
					
					<div class="site-detail">
						<a class="site-nick" href="${ctx}/customer/review?code=${l.site_code}">
							${l.name}
						</a>
					</div>

					<ul class="admin-review">
						<li class="type-l">카테고리</li>
						<li class="type-s color-g">${l.category}</li>
					</ul>

					<p class="site-address">
						<a href="http://${l.address}">${l.address}</a>
					</p>
					
					<ul class="site-up">
						<li class="type-s color-b">추천</li>
						<li class="type-s color-g">${l.good}</li>
						<li class="type-s color-b">즐겨찾기</li>
						<li class="type-s color-g">${l.bookcount}</li>
					</ul>
					
					<div class="bmark-del">
						<a href="bookmark-del?code=${l.site_code}">
							<img src="${ctx}/resource/images/bmark-del.png"/>
						</a>
					</div>
					
				
				</div>
				</c:forEach>
			</form>
		</div>
