<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="javax.servlet.http.HttpSession"%>
	<%@ page import="java.io.*,java.util.*"%>

	<%
	
		// Menghancurkan sesi
		session.invalidate();
		out.print("<script>location.href='../index.jsp';</script>");
	
	%>

</body>
</html>