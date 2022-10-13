<%@ page import="java.sql.*" %>

<%
	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/my_project";
	String user ="root";
	String pwd="1234";
	
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, pwd);
%>