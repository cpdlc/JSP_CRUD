<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 값 넘겨받기</title>
<link rel="stylesheet" type="text/css" href="css/style.css"> 
</head>
<body>
<%@ include file="data_connection.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String idx = request.getParameter("u_idx");
	String id = request.getParameter("edit_id");
	String password = request.getParameter("edit_password");
	String name = request.getParameter("edit_name");
	String tel1 = request.getParameter("edit_tel1");
	String tel2 = request.getParameter("edit_tel2");
	String tel3 = request.getParameter("edit_tel3");
	String tel = tel1 + "-" + tel2 + "-" + tel3;
	String age = request.getParameter("edit_age");
	
	PreparedStatement pstmt = null;
	
	try {
		String sql = "UPDATE user SET u_id=?, u_pw=?, u_name=?, u_tel=?, u_age=? where u_idx=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, tel);
		pstmt.setString(5, age);
		pstmt.setString(6, idx);
		pstmt.executeUpdate();
%>
<%
	} catch(SQLException ex) {
		System.out.println("SQLException : " + ex.getMessage());
	} finally {
		if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
	}
%>
<section>
	<h2>회원정보 DB 수정 완료</h2>
	<table>
			<tr>
				<th><label>아이디 : </label></th>
				<td><%=id %></td>
			</tr>
			<tr>
				<th><label>비밀번호 : </label></th>
				<td><%=password %></td>
			</tr>
			<tr>
				<th><label>이름 : </label></th>
				<td><%=name %></td>
			</tr>
			<tr>
				<th><label>핸드폰번호 : </label></th>
				<td><%=tel %></td>
			</tr>
			<tr>
				<th><label>나이 : </label></th>
				<td><%=age %></td>
			</tr>
	</table>
	<p class="btnWrap"><a href="list.jsp">회원정보리스트 보기</a></p>
</section>
</body>
</html>