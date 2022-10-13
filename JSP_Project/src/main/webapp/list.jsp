<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<body>
<%@ include file="data_connection.jsp" %>
	<section>
		<h2>회원 목록</h2>
		<table>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>핸드폰번호</th>
				<th>나이</th>
			</tr>
				<%
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String query = "select * from user";
					pstmt = conn.prepareStatement(query);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						String u_idx = rs.getString("u_idx");
						String u_id = rs.getString("u_id");
						String u_name = rs.getString("u_name");
						String u_tel = rs.getString("u_tel");
						String u_age = rs.getString("u_age");
					
				%>
				<tr>
					<td><a href="detail.jsp?u_idx=<%=u_idx%>"><%=u_idx %></a></td>
					<td><%=u_id %></td>
					<td><%=u_name %></td>
					<td><%=u_tel %></td>
					<td><%=u_age %></td>
				<tr>
				<%
					}
					rs.close();
					pstmt.close();
					conn.close();
				%>
		</table>
	</section>
</body>
</html>