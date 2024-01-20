<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
		body {
			overflow: hidden; /* Menyembunyikan scrolling */ 
		}
		
		.btn-color {
			background-color: #0e1c36;
			color: #fff;
		}
		
		.profile-image-pic {
			height: 200px;
			width: 200px;
			object-fit: cover;
		}
		
		.cardbody-color {
			background-color: #ebf2fa; /* Atur margin bawah sesuai kebutuhan */
		}
		
		a {
			text-decoration: none;
		}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h2 class="text-center text-dark ">Login Form</h2>
				<div class="text-center  text-dark">Made with bootstrap</div>
				<div class="card">
					<form action="./loginAction.jsp" method="post"
						class="card-body cardbody-color">
						<div class="text-center">
							<img
								src="https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295397__340.png"
								class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3"
								width="200px" alt="profile">
						</div>
						<div class="mb-3">
							<input type="text" type="text" name="email"
								class="form-control" id="Email" aria-describedby="emailHelp"
								placeholder="Email">
						</div>
						<div class="mb-3">
							<input type="password" class="form-control" name="password"
								placeholder="Password">
						</div>
						<div class="text-center">
							<button type="submit" name="tombol"
								class="btn btn-color px-5 mb-5 w-100">Login</button>
						</div>
						<div id="emailHelp" class="form-text text-center  text-dark">
							Not Registered? <a href="#" class="text-dark fw-bold"> Create
								an Account</a>
						</div>
					</form>

				</div>

			</div>

		</div>
	</div>

	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
