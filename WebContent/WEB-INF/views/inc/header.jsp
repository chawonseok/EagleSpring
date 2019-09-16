<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
Kakao.init('da73a6537cd23ba690961e02bf0be78a');

function kakaologout() {
   Kakao.Auth.logout(function() {
      setTimeout(function() {
         location.href="${ctx}/j_spring_security_logout"
      }, 1000);
   });
}

</script>
<link rel="shortcut icon" href="${ctx}/resource/image/favicon.ico"/>

<!--------------------------------------<header>------------------------------------>

<div id="header">
   <div id="header-logo">
      <h1 class="hidden">로고</h1>
      <a href="${ctx}/customer/search"> <img
         src="${ctx}/resource/images/eagle-logo.png" />
      </a>
   </div>
   <nav id="member-menu">
      <h1 class="hidden">회원메뉴</h1>
      <ul>
         <c:if test="${empty pageContext.request.userPrincipal}">
            <li><a href="${ctx}/joinus/login">로그인</a></li>
            <li><a href="${ctx}/joinus/join">회원가입</a></li>
         </c:if>
         <c:if test="${not empty pageContext.request.userPrincipal}">
            <li><a href="${ctx}/joinus/edit?id=${pageContext.request.userPrincipal.name}">${pageContext.request.userPrincipal.name}</a><a>님 반갑습니다</a></li>
            <li><a href="javascript:void(0)" onclick="kakaologout()" >로그아웃</a></li>
         </c:if>
      </ul>
   </nav>

   <div class="table-container">
      <h2 class="hidden">메뉴</h2>
      <table class="menu-table">
         <tbody>
            <tr>
               <td><a href="${ctx}/customer/notice">공지사항</a></td>
               <td><a href="${ctx}/customer/qna">문의 게시판</a></td>
               <td><a href="${ctx}/customer/bookmark">즐겨찾기</a></td>
            </tr>
         </tbody>
      </table>
   </div>
</div>
