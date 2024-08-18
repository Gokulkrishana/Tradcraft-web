<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!doctype html>
<html lang="en">

<head>
    <title>TradCraft Login</title>
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
   	
/* SignUp  */
@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

*{
    font-family: "Poppins", sans-serif;
    font-weight: 400;
    font-style: normal;
}
body{
    
    background-color: #F2F1F1;
}
.navbar{
    background-color: #000000;
}
.navbar img{

}
.navbar a{
    color: #8DCDC1;
}
.card{
    background: none;
    border: none;
}
/* Hero section */

.hero{
    height: 100%;
    width: 100%;
    margin-top: 9%;
    padding-bottom: 3%;
}

.hero .card h1{
    color: #C03552;
    font-size: 70px;
}
.hero .card p{
    font-size: 40px;
}
.hero .card .button{
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.hero .card .icon{
    font-size: 20px;
}
.hero .card .carousel-inner .carousel-item img{
    width: 400px;
    height: 400px;
}
.carousel ol {
   list-style: none;
}
/* Hero section end */
.signup{
    height: 100%;
    width: 100%;
    margin-top: 9%;
    padding-bottom: 4%;
}

.signup table a{
    text-decoration: none;
    color: #F2F1F1;
    background-color: #C03552;
    padding: 9px 20px;
    border-radius: 5px;
}

/* SignUp  End */
   </style>
</head>

<body>
	
	<%if(session.getAttribute("uname") == null){
		response.sendRedirect("Relogin.jsp");
	}
	%>

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
                        <a class="nav-link" href="Home.jsp" aria-current="page">Home & Kitchen<span
                                class="visually-hidden">(current)</span></a>
                    </li>
                    <li class="nav-item px-3">
                        <a class="nav-link" href="#">Products</a>
                    </li>
                    <li class="nav-item px-3">
                        <a class="nav-link" href="Profile.jsp?username=<%= session.getAttribute("uname") %>"><i class="fa-solid fa-user"></i> <%= session.getAttribute("uname") %></a>
                    </li>
                    <li class="nav-item px-3">
                        <a class="nav-link" href="Login.jsp">Login</a>
                    </li>
                </ul>

            </div>
        </nav>

    </header>


 
    <main>
    <% 
			String name = (String) session.getAttribute("uname");
		%>

        <section class="signup">
            <div class="container">
              <% 
                        	Connection con = null;
                        	PreparedStatement ptst = null;
                        	ResultSet res = null;
                        	
                        	String url = "jdbc:mysql://localhost:3306/firstweb";
                        	String user = "root";
                        	String password = "gokul";
                        	
                        	String uname = null;
                        	String email = null;
                        	String address = null;
                        	String city = null;
                        	int pnumber = 0;
                        	int upassword = 0;
                        	try{
                        		Class.forName("com.mysql.cj.jdbc.Driver");
                            	con = DriverManager.getConnection(url, user, password);
                        	}catch(Exception e){
                        		e.printStackTrace();
                        	}
                      		
                        	String query ="SELECT uname,email,address,city,phonenumber,password FROM REGISTER WHERE uname = ?";
                        	
                        	try{
                        		ptst = con.prepareStatement(query);
                        		ptst.setString(1, name);
                        		res = ptst.executeQuery();
                        		res.next();
                        		uname = res.getString(1);
                        		email = res.getString(2);
                        		address = res.getString(3);
                        		city = res.getString(4);
                        		pnumber = res.getInt(5);
                        		upassword = res.getInt(6);
                        	}catch(Exception e){
                        		e.printStackTrace();
                        	}
                        %>
                        
                <form action="Edituserprofile?usern=<%= name %>" method="post">
                  
                    <table class="m-auto">
                        <h2 class="text-center">Edit Profile</h2>
                        <tr>
                            <td>
                                <div class="mb-3">
                                    <label for="uname" class="form-label">User Name</label>
                                    <input type="text" class="form-control" name="uname" id="uname" aria-describedby="helpId"
                                        placeholder="<%= name %>" required />
                                </div>
                            </td>
                            <td>
                                <div class="mb-3">
                                    <label for="e-mail" class="form-label">Email</label>
                                    <input type="email" class="form-control" name="mail" id="e-mail"
                                        aria-describedby="helpId" placeholder="<%= email %>" required/>
                                </div>
                            </td>
                        </tr>
                        <br>
                        <tr>
                            <td>
                                <div class="mb-3">
                                    <label for="uname" class="form-label">Address</label>
                                    <input type="text" class="form-control" name="address" id="address" aria-describedby="helpId"
                                        placeholder="<%= address %>" required/>
                                </div>
                            </td>
                            <td>
                                <div class="mb-3">
                                    <label for="city" class="form-label">City</label>
                                    <input type="text" class="form-control" name="city" id="city"
                                        aria-describedby="helpId" placeholder="<%= city %>" required/>
                                </div>
                            </td>
                        </tr>
                        <br>
                        <tr>
                            <td colspan="2">
                                <div class="mb-3">
                                    <label for="pnumber" class="form-label">Phone Number</label>
                                    <input type="number" class="form-control" name="pnumber" id="pnumber"
                                        aria-describedby="helpId" placeholder="<%= pnumber %>"  required/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="mb-3">
                                    <label for="Password" class="form-label">Password</label>
                                    <input type="number" class="form-control" name="password" id="Password"
                                        aria-describedby="helpId" placeholder="<%= upassword %>" required />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <button type="submit" class="btn btn-danger">Save</button>
                            </td>
                        </tr>
                    </table>
                </form>
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
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>

</body>

</html>