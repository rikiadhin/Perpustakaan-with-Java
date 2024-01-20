<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>KidKinder - Book List</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="Free HTML Templates" name="keywords" />
<meta content="Free HTML Templates" name="description" />

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon" />

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Handlee&family=Nunito&display=swap"
	rel="stylesheet" />

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet" />

<!-- Flaticon Font -->
<link href="lib/flaticon/font/flaticon.css" rel="stylesheet" />

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet" />
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/style.css" rel="stylesheet" />
<style>
table {
	width: 90%;
	border-collapse: collapse;
	margin-top: 20px;
	margin-left: 50px;
}

th, td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

input[type="text"] {
	margin-left: 50px;
	width: 20%;
	padding: 8px;
	box-sizing: border-box;
	margin-bottom: 10px;
}
</style>

</head>

<body>
<%
	String userEmail = (String) session.getAttribute("email");
	String namaDepan = (String) session.getAttribute("namaDepan");
	String namaBelakang = (String) session.getAttribute("namaBelakang");
	  if(userEmail == null){
		  response.sendRedirect("login/login.jsp");
	  }
	%>
	<!-- Navbar Start -->
	<div class="container-fluid bg-light position-relative shadow">
		<nav
			class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0 px-lg-5">
			<a href="" class="navbar-brand font-weight-bold text-secondary"
				style="font-size: 50px"> <i class="flaticon-043-teddy-bear"></i>
				<span class="text-primary">KidKinder</span>
			</a>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-between"
				id="navbarCollapse">
				<div class="navbar-nav font-weight-bold mx-auto py-0">
					<a href="index.jsp" class="nav-item nav-link active">Home</a> <a
						href="class.jsp" class="nav-item nav-link">Kategori</a> <a
						href="team.jsp" class="nav-item nav-link">Data Buku</a> <a
						href="gallery.jsp" class="nav-item nav-link">Data Peminjaman</a> <a
						href="about.jsp" class="nav-item nav-link">Pengembalian</a> <a
						href="contact.jsp" class="nav-item nav-link">Contact</a>
				</div>
				<div class="nav-item dropdown">
					<a href="" class="btn btn-primary px-4 nav-link dropdown-toggle"
						data-toggle="dropdown">Hi, <%=namaDepan + " " + namaBelakang%>
						!
					</a>
					<div class="dropdown-menu rounded-5 mb-10">
						<a onclick="return confirm('Apakah anda yakin ingin keluar ?')"
							href="login/logoutAction.jsp" class="dropdown-item">Logout</a>
					</div>
				</div>

				<br>
			</div>
		</nav>
	</div>
	<!-- Navbar End -->

	<!-- Header Start -->
	<div class="container-fluid bg-primary mb-5">
		<div
			class="d-flex flex-column align-items-center justify-content-center"
			style="min-height: 400px">
			<h3 class="display-3 font-weight-bold text-white">Book List</h3>
			<div class="d-inline-flex text-white">
				<p class="m-0">
					<a class="text-white" href="">Home</a>
				</p>
				<p class="m-0 px-2">/</p>
				<p class="m-0">Book List</p>
			</div>
		</div>
	</div>
	<!-- Header End -->

	<!-- Book list Start -->
	<div>
		<input type="text" id="searchInput" onkeyup="searchTable()"
			placeholder="Search by ID">
			<a
					href="buku/tambahBuku.jsp">
						<button class="btn btn-primary px-4">Tambah Data</button>
				</a>
	</div>

	<table id="bookTable">
		<thead>
			<tr>
				<th>ID</th>
				<th>Kategori</th>
				<th>Judul</th>
				<th>Pengarang</th>
				<th>Penerbit</th>
				<th>Tahun Terbit</th>
				<th>Jumlah Halaman</th>
				<th>Action</th>
				<!-- Add more columns as needed -->
			</tr>
		</thead>
		<tbody>
			<%@ page import="database.Buku, database.BukuModel"%>
			<%
			BukuModel bukuModel = new BukuModel();
			int jumlah = bukuModel.getAllData().size();
			int no = 1;
			%>
			<!-- Populate the table with your book data -->
			<%
			for (int i = 0; i < jumlah; i++) {
			%>
			<tr>
				<td>
					<%
					out.print(bukuModel.getAllData().get(i).getIdBuku());
					%>
				</td>
				<td>
					<%
					out.print(bukuModel.getAllData().get(i).getNamaKategori());
					%>
				</td>
				<td>
					<%
					out.print(bukuModel.getAllData().get(i).getJudul());
					%>
				</td>
				<td>
					<%
					out.print(bukuModel.getAllData().get(i).getPengarang());
					%>
				</td>
				<td>
					<%
					out.print(bukuModel.getAllData().get(i).getPenerbit());
					%>
				</td>
				<td>
					<%
					out.print(bukuModel.getAllData().get(i).getTahunTerbit());
					%>
				</td>
				<td>
					<%
					out.print(bukuModel.getAllData().get(i).getHalaman());
					%>
				</td>
				<td><a
					href="pinjam/pinjamBuku.jsp?id=<%out.print(bukuModel.getAllData().get(i).getIdBuku());%>">
						<button class="btn btn-primary px-4">Pinjam</button>
				</a>
				<a onclick="return confirm('Apakah anda yakin ingin delete data ?')"
					href="buku/deleteBuku.jsp?idBuku=<%out.print(bukuModel.getAllData().get(i).getIdBuku());%>">
						<button class="btn btn-primary px-4">Delete</button>
				</a></td>
			</tr>

			<%
			}
			%>
			<!-- Add more rows as needed -->
		</tbody>
	</table>

	<script>
		function searchTable() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("searchInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("bookTable");
			tr = table.getElementsByTagName("tr");

			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[0]; // Index 0 corresponds to the ID column
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
	<!-- Book list End -->





	<!-- Testimonial Start -->
	<div class="container-fluid py-5">
		<div class="container p-0">
			<div class="text-center pb-2">
				<p class="section-title px-5">
					<span class="px-2">Testimonial</span>
				</p>
				<h1 class="mb-4">What Parents Say!</h1>
			</div>
			<div class="owl-carousel testimonial-carousel">
				<div class="testimonial-item px-3">
					<div class="bg-light shadow-sm rounded mb-4 p-4">
						<h3 class="fas fa-quote-left text-primary mr-3"></h3>
						Sed ea amet kasd elitr stet, stet rebum et ipsum est duo elitr
						eirmod clita lorem. Dolor tempor ipsum clita
					</div>
					<div class="d-flex align-items-center">
						<img class="rounded-circle" src="img/testimonial-1.jpg"
							style="width: 70px; height: 70px" alt="Image" />
						<div class="pl-3">
							<h5>Parent Name</h5>
							<i>Profession</i>
						</div>
					</div>
				</div>
				<div class="testimonial-item px-3">
					<div class="bg-light shadow-sm rounded mb-4 p-4">
						<h3 class="fas fa-quote-left text-primary mr-3"></h3>
						Sed ea amet kasd elitr stet, stet rebum et ipsum est duo elitr
						eirmod clita lorem. Dolor tempor ipsum clita
					</div>
					<div class="d-flex align-items-center">
						<img class="rounded-circle" src="img/testimonial-2.jpg"
							style="width: 70px; height: 70px" alt="Image" />
						<div class="pl-3">
							<h5>Parent Name</h5>
							<i>Profession</i>
						</div>
					</div>
				</div>
				<div class="testimonial-item px-3">
					<div class="bg-light shadow-sm rounded mb-4 p-4">
						<h3 class="fas fa-quote-left text-primary mr-3"></h3>
						Sed ea amet kasd elitr stet, stet rebum et ipsum est duo elitr
						eirmod clita lorem. Dolor tempor ipsum clita
					</div>
					<div class="d-flex align-items-center">
						<img class="rounded-circle" src="img/testimonial-3.jpg"
							style="width: 70px; height: 70px" alt="Image" />
						<div class="pl-3">
							<h5>Parent Name</h5>
							<i>Profession</i>
						</div>
					</div>
				</div>
				<div class="testimonial-item px-3">
					<div class="bg-light shadow-sm rounded mb-4 p-4">
						<h3 class="fas fa-quote-left text-primary mr-3"></h3>
						Sed ea amet kasd elitr stet, stet rebum et ipsum est duo elitr
						eirmod clita lorem. Dolor tempor ipsum clita
					</div>
					<div class="d-flex align-items-center">
						<img class="rounded-circle" src="img/testimonial-4.jpg"
							style="width: 70px; height: 70px" alt="Image" />
						<div class="pl-3">
							<h5>Parent Name</h5>
							<i>Profession</i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Testimonial End -->

	<!-- Footer Start -->
	<div
		class="container-fluid bg-secondary text-white mt-5 py-5 px-sm-3 px-md-5">
		<div class="row pt-5">
			<div class="col-lg-3 col-md-6 mb-5">
				<a href=""
					class="navbar-brand font-weight-bold text-primary m-0 mb-4 p-0"
					style="font-size: 40px; line-height: 40px"> <i
					class="flaticon-043-teddy-bear"></i> <span class="text-white">KidKinder</span>
				</a>
				<p>Labore dolor amet ipsum ea, erat sit ipsum duo eos. Volup
					amet ea dolor et magna dolor, elitr rebum duo est sed diam elitr.
					Stet elitr stet diam duo eos rebum ipsum diam ipsum elitr.</p>
				<div class="d-flex justify-content-start mt-4">
					<a
						class="btn btn-outline-primary rounded-circle text-center mr-2 px-0"
						style="width: 38px; height: 38px" href="#"><i
						class="fab fa-twitter"></i></a> <a
						class="btn btn-outline-primary rounded-circle text-center mr-2 px-0"
						style="width: 38px; height: 38px" href="#"><i
						class="fab fa-facebook-f"></i></a> <a
						class="btn btn-outline-primary rounded-circle text-center mr-2 px-0"
						style="width: 38px; height: 38px" href="#"><i
						class="fab fa-linkedin-in"></i></a> <a
						class="btn btn-outline-primary rounded-circle text-center mr-2 px-0"
						style="width: 38px; height: 38px" href="#"><i
						class="fab fa-instagram"></i></a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-5">
				<h3 class="text-primary mb-4">Get In Touch</h3>
				<div class="d-flex">
					<h4 class="fa fa-map-marker-alt text-primary"></h4>
					<div class="pl-3">
						<h5 class="text-white">Address</h5>
						<p>123 Street, New York, USA</p>
					</div>
				</div>
				<div class="d-flex">
					<h4 class="fa fa-envelope text-primary"></h4>
					<div class="pl-3">
						<h5 class="text-white">Email</h5>
						<p>info@example.com</p>
					</div>
				</div>
				<div class="d-flex">
					<h4 class="fa fa-phone-alt text-primary"></h4>
					<div class="pl-3">
						<h5 class="text-white">Phone</h5>
						<p>+012 345 67890</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-5">
				<h3 class="text-primary mb-4">Quick Links</h3>
				<div class="d-flex flex-column justify-content-start">
					<a class="text-white mb-2" href="#"><i
						class="fa fa-angle-right mr-2"></i>Home</a> <a class="text-white mb-2"
						href="#"><i class="fa fa-angle-right mr-2"></i>About Us</a> <a
						class="text-white mb-2" href="#"><i
						class="fa fa-angle-right mr-2"></i>Our Classes</a> <a
						class="text-white mb-2" href="#"><i
						class="fa fa-angle-right mr-2"></i>Our Teachers</a> <a
						class="text-white mb-2" href="#"><i
						class="fa fa-angle-right mr-2"></i>Our Blog</a> <a class="text-white"
						href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-5">
				<h3 class="text-primary mb-4">Newsletter</h3>
				<form action="">
					<div class="form-group">
						<input type="text" class="form-control border-0 py-4"
							placeholder="Your Name" required="required" />
					</div>
					<div class="form-group">
						<input type="email" class="form-control border-0 py-4"
							placeholder="Your Email" required="required" />
					</div>
					<div>
						<button class="btn btn-primary btn-block border-0 py-3"
							type="submit">Submit Now</button>
					</div>
				</form>
			</div>
		</div>
		<div class="container-fluid pt-5"
			style="border-top: 1px solid rgba(23, 162, 184, 0.2);">
			<p class="m-0 text-center text-white">
				&copy; <a class="text-primary font-weight-bold" href="#">Your
					Site Name</a>. All Rights Reserved.

				<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
				Designed by <a class="text-primary font-weight-bold"
					href="https://htmlcodex.com">HTML Codex</a> <br />Distributed By:
				<a href="https://themewagon.com" target="_blank">ThemeWagon</a>
			</p>
		</div>
	</div>
	<!-- Footer End -->

	<!-- Back to Top -->
	<a href="#" class="btn btn-primary p-3 back-to-top"><i
		class="fa fa-angle-double-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="mail/jqBootstrapValidation.min.js"></script>
	<script src="mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>