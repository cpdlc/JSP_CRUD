<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세</title>
<link rel="stylesheet" type="text/css" href="css/style.css"> 
</head>
<body>
<%@ include file="data_connection.jsp" %>
	
	<section>
		<h2>회원 상세정보</h2>
		<table>
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
				String u_name = rs.getString("u_name");
				String u_tel = rs.getString("u_tel");
				String u_age = rs.getString("u_age");
		%>
		<tr>
			<th>회원 번호</th>
			<td><%=u_idx %></td>
		</tr>
		<tr>
			<th>회원 아이디</th>
			<td><%=u_id %></td>
		</tr>
		<tr>
			<th>회원 이름</th>
			<td><%=u_name %></td>
		</tr>
		<tr>
			<th>회원 전화번호</th>
			<td><%=u_tel %></td>
		</tr>
		<tr>
			<th>회원 나이</th>
			<td><%=u_age %></td>
		</tr>
	</table>

		<p class="btnWrap"><a href="update.jsp?u_idx=<%=u_idx %>">수정</a></p>
		<p class="btnWrap"><a href="delete.jsp?u_idx=<%=u_idx %>">삭제</a></p>
		
		
		<%
			}
		%>
	</section>
</body>
</html>