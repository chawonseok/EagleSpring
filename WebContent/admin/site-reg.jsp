<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<main class="main">
	
	
		<div class="notice">
			<form action="site-reg" method="post" enctype="multipart/form-data">
				<table class="table" border=1>
					<tr class="tr">
						<td class="td">제목</td>
						<td class="td" colspan="3">
						<input type="text" name="title" value="${s.name}" />
						</td>
					</tr>
					<tr class="tr">
						<td class="td">작성자</td>
						<td class="td" colspan="3"></td>
					</tr>
					<tr class="tr">
						<td class="td">사이트 주소</td>
						<td class="td" colspan="3">
						<input type="text" name="name" value="${s.address}" />
						</td>
					</tr>			
					<tr class="tr">
						<td class="td">카테고리</td>
						<td class="td" colspan="3">
						<input type="text" name="title" value="${s.category}" />
						</td>
					</tr>
					<tr class="tr">
						<td class="td">검색키워드</td>
						<td class="td" colspan="3">
						 <input type="checkbox" name="c1" value="1">ppt
						 <input type="checkbox" name="c1" value="2">design
						 <input type="checkbox" name="c1" value="3">fashion
						 <input type="checkbox" name="c1" value="4">living
						 <input type="checkbox" name="c1" value="5">help
						</td>
					</tr>		
					<tr class="tr">
						<td class="td" colspan="4"><textarea name="content" rows="20" cols="60">${n.content}사용법을 입력해주세요</textarea>
						</td>
					</tr>
					<tr class="tr">
						<td class="td">장점</td>
						<td class="td" colspan="4">
						<input type="text" name="title" value="${s.search}" />
						</td>
					</tr>
					<tr class="tr">
						<td class="td">단점</td>
						<td class="td" colspan="4">
						<input type="text" name="title" value="${s.search}" />
						</td>
					</tr>
		
				</table>
				<div>
					<input type="submit" value="등록" /> <a href="notice">취소</a>
				</div>
			</form>
		</div>
	</main>