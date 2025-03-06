<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - EazyDeals</title>

    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #3D8D7A, #A3D1C6, #FBFFE4);
            font-family: 'Poppins', sans-serif;
            color: black;
        }
        .container {
            text-align: center;
            margin-top: 50px;
        }
        .dashboard-card {
            background: #FBFFE4;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
        }
        .dashboard-icon {
            font-size: 50px;
            color: #3D8D7A;
        }
        .nav-bar {
            background: linear-gradient(135deg, #3D8D7A, #A3D1C6);
            padding: 10px;
        }
        .nav-link {
            color: white !important;
            margin-right: 15px;
        }
        .admin-welcome {
            font-size: 22px;
            font-weight: bold;
        }
        /* Footer Styling */
        .footer {
            background: linear-gradient(135deg, #3D8D7A, #A3D1C6);
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 30px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="nav-bar d-flex justify-content-between p-3">
    <span class="text-white fs-4">EazyDeals</span>
    <div>
       
        <a href="addProduct.jsp" class="nav-link d-inline">+Add Product</a>
        <a href="#" class="nav-link d-inline">Admin Dashboard</a>
        <a href="logout.jsp" class="nav-link d-inline">Logout</a>
    </div>
</nav>

<!-- Admin Welcome Section -->
<div class="container">
    <img src="img/admin.png" alt="Admin Profile" width="150" class="mb-3">
    <h2 class="admin-welcome">Welcome "Admin"</h2>

    <div class="row mt-4">
        <div class="col-md-4">
            <a href="category.jsp" class="text-decoration-none">
                <div class="dashboard-card">
                    <i class="fa fa-list dashboard-icon"></i>
                    <h5 class="mt-3">Category</h5>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="products.jsp" class="text-decoration-none">
                <div class="dashboard-card">
                    <i class="fa fa-box dashboard-icon"></i>
                    <h5 class="mt-3">Products</h5>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="orders.jsp" class="text-decoration-none">
                <div class="dashboard-card">
                    <i class="fa fa-shopping-cart dashboard-icon"></i>
                    <h5 class="mt-3">Order</h5>
                </div>
            </a>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-4 offset-md-2">
            <a href="users.jsp" class="text-decoration-none">
                <div class="dashboard-card">
                    <i class="fa fa-users dashboard-icon"></i>
                    <h5 class="mt-3">Users</h5>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="adminManagement.jsp" class="text-decoration-none">
                <div class="dashboard-card">
                    <i class="fa fa-user-shield dashboard-icon"></i>
                    <h5 class="mt-3">Admin</h5>
                </div>
            </a>
        </div>
    </div>
</div>

<!-- Footer Section -->
<footer class="footer">
    <p>© 2025 EazyDeals | All Rights Reserved.</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
