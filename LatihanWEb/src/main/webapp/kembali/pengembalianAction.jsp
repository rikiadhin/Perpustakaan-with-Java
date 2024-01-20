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
	PengembalianModel pengembalianModel = new PengembalianModel();
	if (request.getParameter("pengembalian") != null) {
		String idkembali = request.getParameter("idkembali");
		String idpinjam = request.getParameter("idpinjam");
		String tgldikembalikan = request.getParameter("tgldikembalikan");
		String kondisi = request.getParameter("kondisi");
		String denda = request.getParameter("denda"); 
		pengembalianModel.setDataByIdPengembalian(idkembali, idpinjam, tgldikembalikan, kondisi, denda);

		out.print("<script>alert('Loan data updated successfully');location.href='../gallery.jsp'</script>");
	} else {
		out.print("<script>location.href='./editPinjam.jsp'</script>");
	}
	%>
</body>
</html>