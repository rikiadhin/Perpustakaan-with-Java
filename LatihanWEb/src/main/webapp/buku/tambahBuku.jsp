
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Form Tambah Buku</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	display: flex;
	justify-content: space-between;
	width: 800px;
}

.book-details {
	background-color: #f0f0f0;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 250px;
}

form {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 300px;
}

h2 {
	text-align: center;
	color: #333;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
}

input {
	width: 100%;
	padding: 8px;
	margin-bottom: 16px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

button {
	background-color: #4caf50;
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
}

button:hover {
	background-color: #45a049;
}

.button-container {
	text-align: center;
	margin-top: 50px;
	padding: 10px;
}

/* Tambahkan styling untuk tombol */
#kembaliButton button {
	background-color: #4caf50;
	color: #fff;
	padding: 10px 2px;
	font-size: 18px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	text-decoration: none;
}

#kembaliButton button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<%@ page import="database.*"%>

	<%
	String idbuku = request.getParameter("id");
	String userEmail = (String) session.getAttribute("email");

	KategoriModel kategoriModel = new KategoriModel();
	Kategori kategori = new Kategori();
	int jumlah = kategoriModel.getAllData().size();
	int no = 1;
	%>
	
	<div class="row">
		<div class="container">
			<form action="./tambahAction.jsp" method="post">
				<h2>Form Peminjaman Buku</h2>

				 
					<label for="jumlah">Kategori :</label> 
					<select id="idkategori" name="idkategori"> 
					    <%
					    for (int i = 0; i < jumlah; i++) {
					    %>
					    <option name="idkategori" value="<%= kategoriModel.getAllData().get(i).getId() %>">
					        <%= kategoriModel.getAllData().get(i).getKategori() %>
					    </option>
					    <% } %>
					</select>

					<label for="judul">Judul :</label> 
					<input type="text" id="judul" name="judul" required> 
					<label for="pengarang">Pengarang :</label> 
					<input type="text" id="pengarang" name="pengarang" required>
					<label for="penerbit">Penerbit :</label> 
					<input type="text" id="penerbit" name="penerbit" required> 
					<label for="tahunterbit">Tahun Terbit :</label> 
					<input type="text" id="tahunterbit" name="tahunterbit" required>
					<label for="jumlahhal">Jumlah Halaman :</label> 
					<input type="number" id="jumlahhal" name="jumlahhal" required>

				<button type="submit" name="tambah">Pinjam Buku</button>
			</form>
		</div>
		<div class="button-container" id="kembaliButton">
			<a href="../team.jsp"><button type="button">Kembali</button></a>
		</div>

	</div>
	
</body>
</html>