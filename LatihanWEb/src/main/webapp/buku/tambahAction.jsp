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
	BukuModel bukuModel = new BukuModel();
	if (request.getParameter("tambah") != null) { 
		String idkategori = request.getParameter("idkategori");  
		String judul = request.getParameter("judul"); 
		String pengarang = request.getParameter("pengarang"); 
		String penerbit = request.getParameter("penerbit"); 
		String tahunterbit = request.getParameter("tahunterbit"); 
		String jumlahhal = request.getParameter("jumlahhal"); 
		bukuModel.addDataBuku(idkategori, judul, pengarang, penerbit, tahunterbit, jumlahhal);

		out.print("<script>alert('Loan data updated successfully');location.href='../team.jsp'</script>");
	} else {
		out.print("<script>location.href='./editPinjam.jsp'</script>");
	}
	%>
</body>
</html>