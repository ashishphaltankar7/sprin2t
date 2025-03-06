<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Wishlist - EazyDeals</title>
    
    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #3D8D7A, #A3D1C6, #FBFFE4);
            font-family: 'Poppins', sans-serif;
            color: black;
        }
        .navbar { background-color: #3D8D7A; }
        .navbar-brand, .nav-link { color: black !important; }
        .wishlist-container {
            margin-top: 30px;
            background: #FBFFE4;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .wishlist-item {
            display: flex;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid #A3D1C6;
        }
        .wishlist-item img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 5px;
            cursor: pointer;
        }
        .wishlist-item a {
            text-decoration: none;
            font-weight: 600;
            color: black;
            margin-left: 15px;
            cursor: pointer;
        }
        .wishlist-item a:hover {
            color: #3D8D7A;
        }
        .wishlist-buttons {
            margin-left: auto;
            display: flex;
            gap: 10px;
        }
        .btn-remove {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        .btn-add {
            background-color: #3D8D7A;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<%@ include file="navbar.jsp" %>

<!-- Wishlist Section -->
<div class="container wishlist-container">
    <h3 class="text-center">My Wishlist</h3>
    <div id="wishlist-items">

        <!-- Wishlist Item 1 -->
        <div class="wishlist-item">
            <a href="product-details.jsp?id=1">
                <img src="img/product1.jpg" alt="Men Printed Casual Jacket">
            </a>
            <a href="product-details.jsp?id=1">Men Printed Casual Jacket</a>
            <span class="ms-3">₹860</span>
            <div class="wishlist-buttons">
                <button class="btn-add">Add to Cart</button>
                <button class="btn-remove">Remove</button>
            </div>
        </div>

        <!-- Wishlist Item 2 -->
        <div class="wishlist-item">
            <a href="product-details.jsp?id=2">
                <img src="img/product2.jpg" alt="Samsung Galaxy S23 5G">
            </a>
            <a href="product-details.jsp?id=2">Samsung Galaxy S23 5G</a>
            <span class="ms-3">₹66,400</span>
            <div class="wishlist-buttons">
                <button class="btn-add">Add to Cart</button>
                <button class="btn-remove">Remove</button>
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
