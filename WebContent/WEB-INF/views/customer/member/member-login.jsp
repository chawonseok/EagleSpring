<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main  class="main">
<div  class="notice">
<c:if test="${not empty msg}">
<div style="color:red;">
${msg}
</div>
</c:if>
	<form action="member-login" method="post">

		<fieldset>
			<legend>로그인 필드</legend>
			<table  class="table">
				<tbody>
					<tr class="tr">
						
						<td class="td"><input type="text" name="id" placeholder="이메일 주소" />
						
						</td>
					</tr>
					<tr class="tr">
						
						<td class="td"><input type="password" name="pwd" placeholder="비밀번호"/>
						
						</td>

					</tr>
				</tbody>
			</table>
			<div>
			<a href="member-findPwd">비밀번호 찾기</a>
			</div>
		</fieldset>
		<input type="submit"  value="로그인" /> <input type="reset" value="취소" />
	</form>

</div>
</main>