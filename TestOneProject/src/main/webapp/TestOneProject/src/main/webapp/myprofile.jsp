<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - EazyDeals</title>
    
    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background-color: #FBFFE4;
            font-family: 'Poppins', sans-serif;
            color: black;
        }
        .navbar {
            background: linear-gradient(90deg, #3D8D7A, #A3D1C6);
            padding: 10px;
        }
        .navbar-brand, .nav-link, .dropdown-item {
            color: black !important;
        }
        .sidebar {
            background-color: #B3D8A8;
            height: 100vh;
            padding: 20px;
            border-radius: 10px;
        }
        .sidebar a {
            display: block;
            padding: 10px;
            color: black;
            text-decoration: none;
            border-radius: 5px;
        }
        .sidebar a.active, .sidebar a:hover {
            background-color: #3D8D7A;
            color: white;
        }
        .profile-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #3D8D7A;
            border: none;
            color: black;
        }
        .btn-primary:hover {
            background-color: #A3D1C6;
            color: black;
        }
        .btn-secondary {
            background-color: #B3D8A8;
            color: black;
            border: none;
        }
        .btn-secondary:hover {
            background-color: #A3D1C6;
        }
        input, select {
            background-color: #FBFFE4 !important;
            border: 1px solid #A3D1C6;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<%@ include file="navbar.jsp" %>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 p-3">
            <div class="sidebar">
                <div class="text-center">
                    <img src="img/user-avatar.png" class="rounded-circle mb-2" width="80" alt="User Avatar">
                    <h5>Hello, <strong>User</strong></h5>
                </div>
                <a href="#" class="active"><i class="fa fa-user"></i> Profile Information</a>
                <a href="#"><i class="fa fa-heart"></i> My Wishlist</a>
                <a href="#"><i class="fa fa-box"></i> My Orders</a>
                <a href="#"><i class="fa fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>

        <!-- Profile Information -->
        <div class="col-md-9 p-3">
            <div class="profile-container">
                <h3>Personal Information</h3>
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Your Name</label>
                            <input type="text" class="form-control" placeholder="Enter your name">
                        </div>
                        <div class="col-md-6">
                            <label>Email</label>
                            <input type="email" class="form-control" placeholder="Enter your email">
                        </div>
                        <div class="col-md-6 mt-3">
                            <label>Mobile Number</label>
                            <input type="text" class="form-control" placeholder="Enter your mobile number">
                        </div>
                        <div class="col-md-6 mt-3">
                            <label>Gender</label><br>
                            <input type="radio" name="gender"> Male
                            <input type="radio" name="gender"> Female
                        </div>
                        <div class="col-md-12 mt-3">
                            <label>Address</label>
                            <input type="text" class="form-control" placeholder="Enter your address">
                        </div>
                        <div class="col-md-6 mt-3">
                            <label>City</label>
                            <input type="text" class="form-control" placeholder="Enter your city">
                        </div>
                        <div class="col-md-6 mt-3">
                            <label>Pincode</label>
                            <input type="text" class="form-control" placeholder="Enter your pincode">
                        </div>
                        <div class="col-md-6 mt-3">
                            <label>State</label>
                            <input type="text" class="form-control" placeholder="Enter your state">
                        </div>
                        <div class="col-md-6 mt-3">
                            <label>Select State</label>
                            <select class="form-control">
                                <option>--Select State--</option>
                                <option>Andhra Pradesh</option>
                            <option>Arunachal Pradesh</option>
                            <option>Assam</option>
                            <option>Bihar</option>
                            <option>Chhattisgarh</option>
                            <option>Goa</option>
                            <option>Gujarat</option>
                            <option>Haryana</option>
                            <option>Himachal Pradesh</option>
                            <option>Jharkhand</option>
                            <option>Karnataka</option>
                            <option>Kerala</option>
                            <option>Madhya Pradesh</option>
                            <option>Maharashtra</option>
                            <option>Manipur</option>
                            <option>Meghalaya</option>
                            <option>Mizoram</option>
                            <option>Nagaland</option>
                            <option>Odisha</option>
                            <option>Punjab</option>
                            <option>Rajasthan</option>
                            <option>Sikkim</option>
                            <option>Tamil Nadu</option>
                            <option>Telangana</option>
                            <option>Tripura</option>
                            <option>Uttar Pradesh</option>
                            <option>Uttarakhand</option>
                            <option>West Bengal</option>
                            <option>Andaman and Nicobar Islands</option>
                            <option>Chandigarh</option>
                            <option>Dadra and Nagar Haveli</option>
                            <option>Daman and Diu</option>
                            <option>Delhi</option>
                            <option>Lakshadweep</option>
                            <option>Puducherry</option>
                            </select>
                        </div>
                    </div>
                    <div class="mt-4 text-end">
                        <button type="submit" class="btn btn-primary">Update</button>
                        <button type="reset" class="btn btn-secondary">Reset</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="footer.jsp" %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
