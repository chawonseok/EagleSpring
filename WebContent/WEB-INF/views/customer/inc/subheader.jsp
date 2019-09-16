<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!--------------------------------------<subheader>------------------------------------>
<div class="sub-header">
		<h2 class="hidden">메뉴</h2>
		<table id="sub-menu-table" class="sub-menu-table">
			<tbody>
				<tr>
					<td><a href="service">서비스 소개</a></td>
					<td><a href="notice">공지사항</a></td>
					<td><a href="qna">문의 게시판</a></td>
					<td><a href="programmer">개발자 소개</a></td>
				</tr>
			</tbody>
		</table>
</div>
