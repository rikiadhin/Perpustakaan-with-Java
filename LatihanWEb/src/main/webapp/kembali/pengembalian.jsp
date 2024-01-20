
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Form Pengembalian Buku</title>
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
	String idkembali = request.getParameter("idpengembalian");
	String userEmail = (String) session.getAttribute("email");

	PengembalianModel pengembalianModel = new PengembalianModel();
	Pengembalian pengembalian = new Pengembalian();
	pengembalian = pengembalianModel.getDataByIdKembali(idkembali);
	 
	%>
	<div class="row">
		<div class="container">
			<div class="book-details">
				<h2>Detail Buku</h2>
				<p>
					<strong>Id Peminjaman :</strong>
					<%
					out.print(pengembalian.getIdPeminjaman());
					%>
				</p>
				<p>
					<strong>Id Anggota :</strong>
					<%
					out.print(pengembalian.getIdAnggota());
					%>
				</p>
				<p>
					<strong>Nama :</strong>
					<%
					out.print( pengembalian.getNamaDepan()  +" "+  pengembalian.getNamaBelakang() );
					%>
				</p>
				<p>
					<strong>ID Buku :</strong>
					<%
					out.print(pengembalian.getIdBuku());
					%>
				</p>
				<p>
					<strong>Judul Buku :</strong>
					<%
					out.print(pengembalian.getJudul());
					%>
				</p>
				<p>
					<strong>Kategori :</strong>
					<%
					out.print(pengembalian.getKategori());
					%>
				</p> 
				<br>
				<br> 
				<p>
					<strong>Tanggal Kembali :</strong>
					<%
					out.print(pengembalian.getTanggalKembali());
					%>
				</p> 
				<!-- Tambahkan detail buku lainnya sesuai kebutuhan -->
			</div>
			<form action="./pengembalianAction.jsp" method="post">
				<h2>Form Peminjaman Buku</h2>

					<input type="hidden" id="idkembali" name="idkembali" value="<%out.print(pengembalian.getIdPengembalian());%>" required> 
					<input type="hidden" id="idpinjam" name="idpinjam" value="<%out.print(pengembalian.getIdPeminjaman());%>" required> 
					 
					<label for="tgldikembalikan">Tanggal Dikembalikan :</label> 
					<input type="datetime-local" id="tgldikembalikan" name="tgldikembalikan" required> 
					<label for="kondisi">Kondisi :</label> 
					<input type="text" id="kondisi" name="kondisi" required> 
					<label for="denda">Denda :</label> 
					<input type="number" id="denda" name="denda" step="2000" required>

				<button type="submit" name="pengembalian">Pinjam Buku</button>
			</form>
		</div>
		<div class="button-container" id="kembaliButton">
			<a href="../team.jsp"><button type="button">Kembali</button></a>
		</div>

	</div>
</body>
</html>