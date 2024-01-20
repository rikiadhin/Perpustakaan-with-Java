<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="database.*"%>
	<%
	PinjamBukuModel pinjambukuModel = new PinjamBukuModel();
	if (request.getParameter("updatePinjam") != null) { 
		String idpinjam = request.getParameter("idpinjam"); 
		String tanggalKembali = request.getParameter("tanggalKembali");
		pinjambukuModel.setReturnDatekByIdPinjam(tanggalKembali, idpinjam);

		out.print("<script>alert('Loan data updated successfully');location.href='../gallery.jsp'</script>");
	} else {
		out.print("<script>location.href='./editPinjam.jsp'</script>");
	}
	%>
</body>
</html>