<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<main>
<h2>회원가입</h2>
<c:if test="${not empty errorMsg}">
<div style="color:red; font-family:a드림고딕5">
${errorMsg}
</div>
</c:if>
<form action="join" method="post">
	<fieldset>
		<legend>회원정보</legend>
		<table>
			<tbody>
				<tr>
					<th><label>아이디</label></th>
					<td><input name="mid" value="${mid}"/> <input type="submit" name="btn"
						value="중복확인" /><span style="color:green; font-family:a드림고딕5">${duplicatedResult}</span></td>
				</tr>
				<tr>
					<th><label>비밀번호</label></th>
					<td><input name="pwd" type="password" /></td>
				</tr>
				<tr>
					<th><label>비밀번호 확인</label></th>
					<td><input name="ppwd" type="password"/></td>
				</tr>
				<tr>
					<th><label>이름</label></th>
					<td><input name="name" value="${name}"/></td>
				</tr>
				<tr>
					<th><label>닉네임</label></th>
					<td><input name="nickName" value="${nickName}" /></td>
				</tr>
				<tr>
					<th><label>성별</label></th>
					<td><select name="gender">
							<option>선택</option>
							<option>남자</option>
							<option>여자</option>
					</select></td>
				</tr>
				<tr>
					<th><label>생년월일</label></th>
					<td><input name="yy" />년<input name="mm" />월<input name="dd" />일
						<input name="sun" type="radio" />양력 <input name="moon" type="radio" />음력
					</td>
				</tr>
				<tr>
					<th><label>핸드폰번호</label></th>
					<td><input name="phone" value="${phone}"/></td>
				</tr>
				<tr>
					<th><label>이메일</label></th>
					<td><input name="email" value="${email}" /></td>
				</tr>
				<tr>
					<td><input type="submit" name="btn" value="확인" /></td>
				</tr>

			</tbody>
		</table>
	</fieldset>
</form>
</main>