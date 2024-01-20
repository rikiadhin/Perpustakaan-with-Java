<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import = "database.*" %>
	<%
	BukuModel bukuModel = new BukuModel();

		String idBuku = request.getParameter("idBuku"); 
		bukuModel.deleteDataByIdBuku(idBuku); 
		out.print("<script>alert('The book was successfully borrowed');location.href='../team.jsp'</script>");

	
	%>
</body>
</html>