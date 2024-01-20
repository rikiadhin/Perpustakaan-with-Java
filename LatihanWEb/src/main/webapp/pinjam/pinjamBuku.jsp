
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Form Peminjaman Buku</title>
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
	<%@ page import="database.Buku, database.BukuModel"%>
	<%@ page import="database.Siswa, database.SiswaModel"%>
	<%
	String idbuku = request.getParameter("id");
	String userEmail = (String) session.getAttribute("email");

	BukuModel bukuModel = new BukuModel();
	SiswaModel siswaModel = new SiswaModel();
	Siswa siswa = new Siswa();
	siswa = siswaModel.getDataByEmail(userEmail);
	Buku buku = new Buku();
	buku = bukuModel.getDataByIdBuku(idbuku);
	%>
	<div class="row">

		<div class="container">
			<div class="book-details">
				<h2>Detail Buku</h2>
				<p>
					<strong>Id Buku :</strong>
					<%
					out.print(idbuku);
					%>
				</p>
				<p>
					<strong>Judul :</strong>
					<%
					out.print(buku.getJudul());
					%>
				</p>
				<p>
					<strong>Kategori :</strong>
					<%
					out.print(buku.getNamaKategori());
					%>
				</p>
				<p>
					<strong>Pengarang :</strong>
					<%
					out.print(buku.getPengarang());
					%>
				</p>
				<p>
					<strong>Penerbit :</strong>
					<%
					out.print(buku.getPenerbit());
					%>
				</p>
				<p>
					<strong>Tahun Terbit :</strong>
					<%
					out.print(buku.getTahunTerbit());
					%>
				</p>
				<p>
					<strong>Jumlah Halaman :</strong>
					<%
					out.print(buku.getHalaman());
					%>
				</p>
				<!-- Tambahkan detail buku lainnya sesuai kebutuhan -->
			</div>
			<form action="./pinjamAction.jsp" method="post">
				<h2>Form Peminjaman Buku</h2>

				<input type="hidden" id="idBuku" name="idBuku"
					value="<%out.print(idbuku);%>" required> <label
					for="jumlah">ID Anggota :</label> <input type="text" id="idAnggota"
					name="idAnggota" required> <label for="tanggalPinjam">Tanggal
					Pinjam :</label> <input type="date" id="tanggalPinjam" name="tanggalPinjam"
					required> <label for="tanggalKembali">Tanggal
					Kembali :</label> <input type="date" id="tanggalKembali"
					name="tanggalKembali" required>

				<button type="submit" name="pinjam">Pinjam Buku</button>
			</form>
		</div>
		<div class="button-container" id="kembaliButton">
			<a href="../team.jsp"><button type="button">Kembali</button></a>
		</div>

	</div>
</body>
</html>