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
	PinjamBukuModel pinjambukuModel = new PinjamBukuModel();
	if(request.getParameter("pinjam") != null){
		String idAnggota = request.getParameter("idAnggota");
		String idBuku = request.getParameter("idBuku");
		String tanggalPinjam = request.getParameter("tanggalPinjam");
		String tanggalKembali = request.getParameter("tanggalKembali");
		pinjambukuModel.addDataPinjamBuku(idAnggota, idBuku, tanggalPinjam, tanggalKembali);

		out.print("<script>alert('The book was successfully borrowed');location.href='../gallery.jsp'</script>");
	}else{
		out.print("<script>location.href='./pinjamBuku.jsp'</script>");
	}
	
	%>
</body>
</html>