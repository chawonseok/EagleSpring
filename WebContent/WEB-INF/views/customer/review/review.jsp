<%@page import="com.web.model.ReviewModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security"
   uri="http://www.springframework.org/security/tags"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<!--  "여기에 되돌아갈 파일링크하시면됩니다" -->
<div id="review">
   <div id="head">
   	 <a href="https://${site.address}">${site.name}</a>
      
      <a href="search-detail?query=${query}">뒤로가기</a>
   </div>

   <div class="img"><img width="480px;" height="400px;" src="${site.src}">
      <div>
         <p id="good">추천  ${site.good} 즐찾  ${site.bookcount}</p>
         <form action="site-up">
            <c:if test="${empty pageContext.request.userPrincipal}">
               <a href="../joinus/login">추천(로그인)</a>
            </c:if>
            <c:if test="${!empty pageContext.request.userPrincipal}">
               <!-- <a>추천</a> -->
               <c:if test="${er eq 'up'}">
                  <a href="site-up?code=${site.code}">추천하기</a>
               </c:if>
               <c:if test="${er eq 'down'}">
                  <a href="site-up?code=${site.code}">추천지우기</a>
               </c:if>
            </c:if>
         </form>
      </div>
   </div>
   <div class="admin">
      <h2>사용법</h2>
      <div>
         <!-- 사이트 사용법 (content) 오는곳 -->
         ${s.content}
      </div>
      <h2>평가</h2>
      <div>${a.comment}</div>



      <form action="bookmark-reg" method="post">
         <input type="hidden" name="code" value="${s_code}" /> <input
            type="submit" name="btn" value="즐겨찾기" />
      </form>

   </div>

   <div>
      <div class="hitreview">
         <h1>사용자리뷰</h1>
         <c:forEach var="n" items="${hituserreview}">

            <ul>
               <li>${n.member_id}</li>
               <li><fmt:formatDate pattern="yyyy.MM.dd hh:mm"
                     value="${n.regdate}" /></li>
               <li><form action="review" method="post">
                     <input type="hidden" name="delcode" value="${n.code}" /> <input
                        type="hidden" name="s_code" value="${s_code}" /> <input
                        type="hidden" name="ID" value="${n.member_id}" /> <input
                        type="hidden" name="query" value="${query}" /> <input
                        type="submit" name="btn" value="del" />
                  </form></li>
               <li>${n.content}</li>

            </ul>

         </c:forEach>

         <div id="note-form">
            <form action="review" method="post">
               <fieldset>
                  <legend></legend>

                  <textarea name="content">${n.content}</textarea>
                  <input type="hidden" name="s_code" value="${s_code}" /> <input
                     type="submit" name="btn" value="coment" />
               </fieldset>
            </form>
         </div>
      </div>

      <div class="review">
         <c:forEach var="n" items="${userreview}">

            <ul>
               <li>${n.member_id}</li>
               <li><fmt:formatDate pattern="yyyy.MM.dd hh:mm"
                     value="${n.regdate}" /></li>
               <li><form action="review" method="post">
                     <input type="hidden" name="delcode" value="${n.code}" /> <input
                        type="hidden" name="s_code" value="${s_code}" /> <input
                        type="hidden" name="ID" value="${n.member_id}" /><input
                        type="hidden" name="query" value="${query}" /> <input
                        type="submit" name="btn" value="del" />
                  </form></li>
               <li>${n.content}</li>



            </ul>

         </c:forEach>

         <!--  <input type="hidden" name="q" value="1"/>  -->
         <c:if test="${empty param.p }">
            <c:set var="page" value="1" />
         </c:if>

         <c:if test="${not empty param.p }">
            <c:set var="page" value="${param.p }" />
         </c:if>
         <c:set var="start" value="${page-(page-1)%5}" />


		<c:set var="end"
			value="${fn:substringBefore(((count)%8==0?(count)/8:(count)/8+1),'.')}" />



			<div class="sort">

            <div>${page}/${end}page</div>
            <div>
               <%-- <a href="review?p=${(start>=1)?1:start-5}&code=${s_code}">&lt;&lt;
                  </a> --%>
               <a href="review?p=${(start>=1)?1:start-1}&code=${s_code}">이전 </a>


               <c:forEach var="i" begin="0" end="4">
                  <c:if test="${start+i<=end}">
                     <c:if test="${page == start+i}">
                        <a href="review?p= ${start+i}&code=${s_code} " class="strong">${start+i}</a>
                     </c:if>

                     <c:if test="${page != start+i }">
                        <a href="review?p=${start+i}&code=${s_code}">${start+i}</a>
                     </c:if>
                  </c:if>
               </c:forEach>


               <a href="review?p=${(end==page)?end:start+1}&code=${s_code}">
                  다음</a>
                  
               <%-- <a
                     href="review?p=${((end-page)<5)?strat:start+5}&code=${s_code}">
                     &gt;&gt;</a> --%>

            </div>
         </div>
      </div>
   </div>
</div>