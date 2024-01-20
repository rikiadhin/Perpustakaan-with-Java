<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Redirect...</title>
</head>
<body>
	<%@ page import="database.Siswa, database.SiswaModel"%>
	<%@ page import="java.security.MessageDigest"%>

	<%
	String email = request.getParameter("email");
	MessageDigest mDigest = MessageDigest.getInstance("SHA1");
	byte[] result = mDigest.digest(request.getParameter("password").getBytes());

	StringBuffer sb = new StringBuffer();
	for (int i = 0; i < result.length; i++) {
		sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
	}

	String password = sb.toString();
	SiswaModel siswaModel = new SiswaModel();
	Siswa siswa = new Siswa();
	siswa = siswaModel.getDataByEmail(email);

	if (!email.equals(siswa.getEmail())) {
		out.print("<script>alert('Username not registered');location.href='./login.jsp';</script>");
		
	} else if (!password.equals(siswa.getPassword())) {
		out.print("<script>alert('Password is incorrect');location.href='./login.jsp';</script>");
		
	} else { 
		
		if(siswa.getRole() == "siswa"){
			
		}else{
			session.setAttribute("namaDepan", siswa.getNamaDepan());
			session.setAttribute("namaBelakang", siswa.getNamaBelakang());
			session.setAttribute("email", siswa.getEmail());
			out.print("<script>alert('Login successfully');location.href='../home.jsp';</script>");
		}
	}
	%>





</body>
</html>