<%@page import="org.apache.catalina.valves.rewrite.InternalRewriteMap.UpperCase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!doctype html>
<html lang="en">

<head>
    <title>TradCraft Home</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

        * {
            font-family: "Poppins", sans-serif;
            font-weight: 400;
            font-style: normal;
        }

        body {

            background-color: #F2F1F1;
        }

        .navbar {
            background-color: #000000;
        }

        .navbar img {}

        .navbar a {
            color: #8DCDC1;
        }

        .card {
            background: none;
            border: none;
        }

        /* Hero section */

        .hero {
            height: 100%;
            width: 100%;
            margin-top: 9%;
            padding-bottom: 3%;
        }

        .hero .card h1 {
            color: #C03552;
            font-size: 70px;
        }

        .hero .card p {
            font-size: 40px;
        }

        .hero .card .button {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .hero .card .icon {
            font-size: 20px;
        }

        .hero .card .carousel-inner .carousel-item img {
            width: 400px;
            height: 400px;
        }

        .carousel ol {
            list-style: none;
        }

        /* Hero section end */

        /* Prodeuct  */

        .category {
            height: 100%;
            width: 100%;
            margin-top: 9%;
            padding-bottom: 3%;
        }

        .category img {
            width: 250px;
            height: 250px;
        }

        .category .card {
            background-color: #DDC0B2;
        }

        .category .card .card-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        /* Prodeuct  End */

        /* Home & Kitchen */

        .homeproduct {
            height: 100%;
            width: 100%;
            margin-top: 9%;
            padding-bottom: 4%;
        }

        .homeproduct img {
            width: 250px;
            height: 250px;
        }

        .homeproduct .card {
            background-color: #DDC0B2;
        }

        .homeproduct .card .card-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        /* Home & Kitchen End */
    </style>
</head>

<body>

	<%if(session.getAttribute("uname") == null){
		response.sendRedirect("Relogin.jsp");
	 }%>
    <header>
        <!-- place navbar here -->
        <nav class="navbar p-3 navbar-expand-md navbar-dark fixed-top">
            <a href="Admin.jsp" class="navbar-brand h2 text-color-danger"><img alt="logo" src="images/logo2.png" style="height: 60px;width: 180px"></a>
            <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse"
                data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <form class="d-flex my-2 my-lg-0 ms-auto">
                    <input class="form-control me-sm-2" type="text" placeholder="Search" />
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">
                        Search
                    </button>
                </form>
                <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                    <li class="nav-item px-3">
                        <a class="nav-link active" href="Home.jsp" aria-current="page">Home & Kitchen<span
                                class="visually-hidden">(current)</span></a>
                    </li>
                    <li class="nav-item px-3">
                        <a class="nav-link" href="#">Product</a>
                    </li>
                    <li class="nav-item px-3">
                        <a class="nav-link" href="Adminprofile.jsp?uname= <%= session.getAttribute("uname") %>"><i class="fa-solid fa-user"></i> <%= session.getAttribute("uname") %></a>
                    </li>
                    <li class="nav-item px-3">
                        <a class="nav-link" href="Login.jsp">Login</a>
                    </li>
                </ul>

            </div>
        </nav>

    </header>
    <main>

        <section class="hero">
            <div class="container">
                <div class="card mb-3">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card-body">
                                <h1 class="card-title">TradCraft</h1>
                                <p class="card-text">
                                    Lowest Prices
                                </p>
                                <p class="card-text">
                                    Best Quality Shopping
                                </p>
                                <div class="button pt-3">
                                    <p class="icon">
                                        <i class="fa-solid fa-truck"></i> Free Delivery
                                    </p>
                                    <p class="icon">
                                        <i class="fa-solid fa-sack-dollar"></i> Cash On Delivery
                                    </p>
                                    <p class="icon">
                                        <i class="fa-solid fa-right-left"></i> Easy Returns
                                    </p>
                                </div>
                                <button class="btn btn-danger mt-2">Buy now</button>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card-body">
                                <div id="carouselId" class="carousel slide shadow" data-bs-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-bs-target="#carouselId" data-bs-slide-to="0" class="active"
                                            aria-current="true" aria-label="First slide"></li>
                                        <li data-bs-target="#carouselId" data-bs-slide-to="1" aria-label="Second slide">
                                        </li>
                                        <li data-bs-target="#carouselId" data-bs-slide-to="2" aria-label="Third slide">
                                        </li>
                                    </ol>
                                    <div class="carousel-inner" role="listbox">
                                        <div class="carousel-item active">
                                            <img src="images/flight-tickets.png" class="w-100 d-block"
                                                alt="First slide" />
                                        </div>
                                        <div class="carousel-item">
                                            <img src="images/clothes-offer.jpg" class="w-100 d-block"
                                                alt="Second slide" />
                                        </div>
                                        <div class="carousel-item">
                                            <img src="images/cars-offer.jpeg" class="w-100 d-block"
                                                alt="Third slide" />
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselId"
                                        data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselId"
                                        data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
	
		<section class="upload p-3 mb-3">
			 <div class="container mt-2">
      		 <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header text-center bg-danger text-white">
                        <h3>Upload Product</h3>
                    </div>
                    <div class="card-body">
                        <form action="UploadServlet" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="iname" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="iname" name="iname" placeholder="Upload Products" required>
                            </div>
                            <div class="mb-3">
                                <label for="category" class="form-label">Product Category</label>
                                <input type="text" class="form-control" id="category" name="category" placeholder="" required>
                            </div>
                            <div class="mb-3">
                                <label for="file" class="form-label">Choose Image</label>
                                <input class="form-control" type="file" id="file" name="file" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-danger">Upload</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
		</section>
		
		<section class="category">
    <div class="container">
        <h2>Products For You</h2>
        <div class="row g-4">
            <% 
            Connection con = null;
            PreparedStatement ptst = null;
            ResultSet res = null;

            String url = "jdbc:mysql://localhost:3306/firstweb";
            String user = "root";
            String password = "gokul";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, password);

                String query = "SELECT imagefilename, iname FROM IMG";
                ptst = con.prepareStatement(query);
                res = ptst.executeQuery();
                String imagefilename = null;
                String iname = null;
                String path = null;
                while (res.next()) {
                	imagefilename = res.getString(1);
                	iname = res.getString(2);
                    path = "images/" + imagefilename;
            %>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="card h-100 shadow p-2">
                    <img class="card-img-top m-auto" src="<%= path %>" alt="<%= imagefilename %>">
                    <div class="card-body">
                        <h4 class="card-title"><%= iname %></h4>
                        <p class="card-text">$40.00</p>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-around">
                    		<button class="btn btn-success">Edit</button>
                    <form action="Deleteimg" method="post">
    						<input type="hidden" name="path" value="<%= imagefilename %>">
    						<input type="hidden" name="iname" value="<%= iname %>">
    						<button type="submit" class="btn btn-danger">Delete</button>
					 </form>
                    </div>
                </div>
            </div>
            <% 
                }
            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                if (res != null) try { res.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (ptst != null) try { ptst.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            %>  
        </div>
    </div>
</section>

		
		
    </main>

    <!-- Footer Section -->
    <footer class="bg-dark text-light py-4">
        <div class="container">
            <div class="row">
                <!-- Company Info -->
                <div class="col-md-4 mb-3 p-3">
                    <p>Your go-to destination for timeless and classic craftsmanship. Explore our curated collection of
                        traditional goods and heritage items.</p>
                </div>

                <!-- Quick Links -->
                <div class="col-md-4 mb-3 p-3">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-light text-decoration-none">Home & Kitchen</a></li>
                        <li><a href="#" class="text-light text-decoration-none">Clothes</a></li>
                        <li><a href="#" class="text-light text-decoration-none">Watches</a></li>
                        <li><a href="#" class="text-light text-decoration-none">Cosmetics</a></li>
                    </ul>
                </div>

                <!-- Contact Info -->
                <div class="col-md-4 mb-3 p-3">
                    <h5>Contact Us</h5>
                    <ul class="list-unstyled">
                        <li><i class="bi bi-telephone"></i> +733 941 5279</li>
                        <li><i class="bi bi-envelope"></i> info@tradcraft.com</li>
                        <li><i class="bi bi-geo-alt"></i> 0931 APJ St, New City</li>
                    </ul>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col text-center">
                    <p class="mb-0">© 2024 TradCraft. All rights reserved.</p>
                    <div class="social-icons mt-2">
                        <a href="#" class="text-light me-2"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="text-light me-2"><i class="bi bi-twitter"></i></a>
                        <a href="#" class="text-light me-2"><i class="bi bi-instagram"></i></a>
                        <a href="#" class="text-light"><i class="bi bi-linkedin"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">


    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
</body>

</html>