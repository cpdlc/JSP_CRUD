<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<link rel="stylesheet" type="text/css" href="css/style.css"> 
</head>
<body>
<!-- db연결 파일 -->
<%@ include file="data_connection.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");	//Encoding utf-8로 설정
	
	//signup에서 input name값 가져오기
	String id = request.getParameter("id");	
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-" +request.getParameter("tel3");
	String age = request.getParameter("age");
	
	PreparedStatement pstmt = null;
	
	try{
		//해당 jsp파일에서 사용할 Query문
		String sql = "insert into user(u_id,u_pw,u_name,u_tel,u_age) values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
					//위에 인덱스 번호
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, tel);
		pstmt.setString(5, age);
		pstmt.executeUpdate();
		
	}catch(Exception e){
		System.out.println("Exception : "+e.getMessage());
	}finally{
		if(pstmt!=null){
			pstmt.close();
		}
		if(conn!=null){
			conn.close();
		}
	}
	
%>

<section>
	<h2>회원정보 DB 전송 성공</h2>
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