<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Wishlist - EazyDeals</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background: #2B5D50;
            padding: 15px;
        }
        .navbar-brand {
            color: white;
            font-size: 22px;
            font-weight: bold;
        }
        .wishlist-container {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }
        .wishlist-item {
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
        }
        .wishlist-item:last-child {
            border-bottom: none;
        }
        .btn-remove, .btn-add-to-cart {
            border: none;
            padding: 7px 12px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
            color: white;
        }
        .btn-remove {
            background: #e74c3c;
        }
        .btn-remove:hover {
            background: #c0392b;
        }
        .btn-add-to-cart {
            background: #3498db;
        }
        .btn-add-to-cart:hover {
            background: #217dbb;
        }
    </style>
</head>
<body>

    <!-- 🌟 Navigation Bar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand">🛒 EazyDeals</a>
            <div class="ms-auto">
                <a class="btn btn-danger" href="logout.jsp">🚪 Logout</a>
            </div>
        </div>
    </nav>

    <!-- 📝 Wishlist Section -->
    <div class="container wishlist-container">
        <h2 class="text-center">❤️ My Wishlist</h2>

        <div id="wishlistItems">
            <!-- Dummy Wishlist Items -->
            <div class="wishlist-item d-flex justify-content-between align-items-center" id="item-1">
                <div>
                    <h5>Samsung Galaxy M14 5G</h5>
                    <p>Price: ₹14,999</p>
                </div>
                <div>
                    <button class="btn-add-to-cart" onclick="addToCart(1)">
                        <i class="fa fa-cart-plus"></i> Add to Cart
                    </button>
                    <button class="btn-remove" onclick="removeFromWishlist(1)">
                        <i class="fa fa-trash"></i> Remove
                    </button>
                </div>
            </div>

            <div class="wishlist-item d-flex justify-content-between align-items-center" id="item-2">
                <div>
                    <h5>Boat Airdopes 141</h5>
                    <p>Price: ₹1,499</p>
                </div>
                <div>
                    <button class="btn-add-to-cart" onclick="addToCart(2)">
                        <i class="fa fa-cart-plus"></i> Add to Cart
                    </button>
                    <button class="btn-remove" onclick="removeFromWishlist(2)">
                        <i class="fa fa-trash"></i> Remove
                    </button>
                </div>
            </div>

            <div class="wishlist-item d-flex justify-content-between align-items-center" id="item-3">
                <div>
                    <h5>HP Pavilion Gaming Laptop</h5>
                    <p>Price: ₹62,999</p>
                </div>
                <div>
                    <button class="btn-add-to-cart" onclick="addToCart(3)">
                        <i class="fa fa-cart-plus"></i> Add to Cart
                    </button>
                    <button class="btn-remove" onclick="removeFromWishlist(3)">
                        <i class="fa fa-trash"></i> Remove
                    </button>
                </div>
            </div>

            <div class="wishlist-item d-flex justify-content-between align-items-center" id="item-4">
                <div>
                    <h5>Apple iPhone 15 Pro</h5>
                    <p>Price: ₹1,29,900</p>
                </div>
                <div>
                    <button class="btn-add-to-cart" onclick="addToCart(4)">
                        <i class="fa fa-cart-plus"></i> Add to Cart
                    </button>
                    <button class="btn-remove" onclick="removeFromWishlist(4)">
                        <i class="fa fa-trash"></i> Remove
                    </button>
                </div>
            </div>

            <div class="wishlist-item d-flex justify-content-between align-items-center" id="item-5">
                <div>
                    <h5>Noise ColorFit Pro 3 Smartwatch</h5>
                    <p>Price: ₹3,499</p>
                </div>
                <div>
                    <button class="btn-add-to-cart" onclick="addToCart(5)">
                        <i class="fa fa-cart-plus"></i> Add to Cart
                    </button>
                    <button class="btn-remove" onclick="removeFromWishlist(5)">
                        <i class="fa fa-trash"></i> Remove
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS & jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript for Wishlist Actions (AJAX) -->
    <script>
        function removeFromWishlist(itemId) {
            $.ajax({
                url: "RemoveFromWishlistServlet",
                type: "POST",
                data: { itemId: itemId },
                success: function(response) {
                    if (response.trim() === "success") {
                        location.reload();  // Reload page after removal
                    }
                }
            });
        }

        function addToCart(itemId) {
            $.ajax({
                url: "AddToCartServlet",
                type: "POST",
                data: { itemId: itemId },
                success: function(response) {
                    if (response.trim() === "success") {
                        alert("Item added to cart! 🛒");
                    }
                }
            });
        }
    </script>

</body>
</html>
