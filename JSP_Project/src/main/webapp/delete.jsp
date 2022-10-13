<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제</title>
<link rel="stylesheet" type="text/css" href="css/style.css"> 
</head>
<body>
<%@ include file="data_connection.jsp" %>

<%
	String idx = request.getParameter("u_idx");
	System.out.println(idx);
	
	PreparedStatement pstmt = null;
	
	String query = "delete from user where u_idx=?";
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, idx);
	pstmt.executeUpdate();
%>
	<h2>삭제 완료</h2>
<script>
setTimeout(function () {
	window.location.href = "list.jsp";
})
</script>
</body>
</html>