<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <a href="User.jsp" class="navbar-brand h2 text-color-danger"><img alt="logo" src="images/logo2.png" style="height: 60px;width: 180px"></a>
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
                        <a class="nav-link active" href="Userhome.jsp" aria-current="page">Home & Kitchen<span
                                class="visually-hidden">(current)</span></a>
                    </li>
                    <li class="nav-item px-3">
                        <a class="nav-link" href="#">Products</a>
                    </li>
                    <li class="nav-item px-3">
                        <a class="nav-link" href="Profile.jsp?username=<%= session.getAttribute("uname") %>"><i class="fa-solid fa-user"></i> <%= session.getAttribute("uname") %></a>
                    </li>
                    <li class="nav-item px-3">
                        <a class="nav-link" href="Cart.jsp?uname=<%= session.getAttribute("uname") %>,upwd=<%= session.getAttribute("password") %>"><i class="fa-sharp fa-solid fa-cart-plus"></i> Cart</a>
                    </li>
                    <li class="nav-item px-3">
                        <a class="nav-link" href="Login.jsp">Login</a>
                    </li>
                </ul>

            </div>
        </nav>

    </header>
    <%
    String uname = (String) session.getAttribute("uname");
    String upwd = (String) session.getAttribute("upwd");
    %>
    <main>
    
    	<section class="cart"  style="margin-top: 8%">
    	<div class="container">
    	<div class="h2 text-center mb-5"><h1><%= session.getAttribute("uname") %> Cart</h1></div>
        <%
            Connection con = null;
            PreparedStatement ptst = null;
            ResultSet res = null;

            String url = "jdbc:mysql://localhost:3306/firstweb";
            String username = "root";
            String password = "gokul";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, username, password);
            } catch (Exception e) {
                e.printStackTrace();
            }

            
            String query = "SELECT imagefilename, iname FROM CART WHERE username = ? AND password = ?";
            String imagefilename = null;
            String iname = null;
            String path = null;

            try {
                ptst = con.prepareStatement(query);
                ptst.setString(1, uname);
                ptst.setString(2, upwd);
                res = ptst.executeQuery();

                while (res.next()) {
                    imagefilename = res.getString(1);
                    iname = res.getString(2);
                    path = "images/" + imagefilename;
        %>
                    <div class="card mb-3 m-auto bg-light" style="max-width: 800px;">
                        <div class="row g-0 p-3">
                            <div class="col-md-4">
                                <img src="<%= path %>" class="img-fluid rounded-start m-auto" alt="Card title" style="width:300px;height:250px;" />
                            </div>
                            <div class="col-md-8">
                                <div class="card-body mt-4">
                                    <h5 class="card-title"><%= iname %></h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                </div>
                                <div class="card-footer mt-5 d-flex align-items-center justify-content-around">
                                    <a href="" class="btn btn-success">Buy</a>
                                    <form action="Remove" method="post">
    								<input type="hidden" name="uname" value="<%=  uname  %>">
    								<input type="hidden" name="upwd" value="<%=  upwd  %>">
    								<input type="hidden" name="path" value="<%= imagefilename %>">
    								<button type="submit" class="btn btn-warning">Remove</button>
					  			 </form>
                                 </div>
                            </div>
                        </div>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (res != null) try { res.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (ptst != null) try { ptst.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </div>
</section>

    
    </main>
    
    
    
   <!-- Footer Section -->
    <footer class="bg-dark text-light py-4" style="margin-top: 5%">
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