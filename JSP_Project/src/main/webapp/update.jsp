<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<%@ include file="data_connection.jsp" %>
	<section>
	<h2>회원 정보 수정</h2>
	<%
		String idx = request.getParameter("u_idx");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select * from user where u_idx=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, idx);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String u_idx = rs.getString("u_idx");
			String u_id = rs.getString("u_id");
			String u_password = rs.getString("u_pw");
			String u_name = rs.getString("u_name");
			String u_tel = rs.getString("u_tel");
			String[] tel = u_tel.split("-");
			String u_age = rs.getString("u_age");
	%>
		<form action="update_process.jsp" name="user" method="post">
			<table>
					<tr>
						<th><label for="id">아이디</label></th>
						<input type="hidden" name="u_idx" value="<%=u_idx%>">
						<td><input type="text" name="edit_id" value="<%=u_id%>" id="id"></td>
					</tr>
					<tr>
						<th><label for="password">비밀번호</label></th>
						<td><input type="password" name="edit_password" id="password" value="<%=u_password %>"></td>
					</tr>
					<tr>
						<th><label for="name">이름</label></th>
						<td><input type="text" name="edit_name" id="name" value="<%=u_name %>"></td>
					</tr>
					<tr>
						<th><label>핸드폰번호</label></th>
						<td><input type="text" maxlength="4" size="4" name="edit_tel1" value="<%=tel[0] %>"> -
					   <input type="text" maxlength="4" size="4" name="edit_tel2" value="<%=tel[1] %>"> -
					   <input type="text" maxlength="4" size="4" name="edit_tel3" value="<%=tel[2] %>">
						</td>
					</tr>
					<tr>
						<th><label for="age">나이</label></th>
						<td><input type="text" name="edit_age" id="age" value="<%=u_age %>"></p></td>
					</tr>
					
			</table>
			
			<p class="btnWrap"><input type="submit" value="수정완료"></p>
		</form>
	<%
		}
	%>
	</section>
</body>
</html>