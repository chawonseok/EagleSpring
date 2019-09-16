<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<main class="main">
<div class="notice">
<form action="member-findPwd" method="post">

		<fieldset>
			<legend>비밀번호 찾기</legend>
			<table class="table">
				<tbody>
					<tr class="tr">
						<td class="td">가입된 이메일주소로 임시 비밀번호를 발급해드립니다</td>
						<td class="td"><input type="text" name="id" palceholder="이메일 주소" />
						
						</td>
					</tr>

				</tbody>
			</table>
		</fieldset>
		<input type="submit"  value="확인" /> <input type="reset" value="취소" />
	</form>
</div>
</main>