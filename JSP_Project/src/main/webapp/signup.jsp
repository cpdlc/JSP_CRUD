<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="css/style.css"> 
</head>
<body>
	<section>
	<h2> 회원가입 </h2>
		<form action="signup_complete.jsp" name="user" method="post">
			<table>
					<tr>
						<th><label for="id">아이디</label></th>
						<td><input type="text" name="id" id="id"></td>
					</tr>
					<tr>
						<th><label for="password">비밀번호</label></th>
						<td><input type="password" name="password" id="password"></td>
					</tr>
					<tr>
						<th><label for="name">이름</label></th>
						<td><input type="text" name="name" id="name"></td>
					</tr>
					<tr>
						<th><label>핸드폰번호</label></th>
						<td><input type="text" maxlength="4" size="4" name="tel1"> -
					   <input type="text" maxlength="4" size="4" name="tel2"> -
					   <input type="text" maxlength="4" size="4" name="tel3">
						</td>
					</tr>
					<tr>
						<th><label for="age">나이</label></th>
						<td><input type="text" name="age" id="age"></td>
					</tr>
					
			</table>
			<p class="subBtn"><input type="submit" value="회원가입">
			<input type="reset" value="다시입력">
			</p>
		</form>	
	</section>
</body>
</html>