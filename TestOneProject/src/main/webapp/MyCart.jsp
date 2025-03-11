<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, jakarta.servlet.http.*" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Cart</title>

    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #FBFFE4, #A3D1C6);
            font-family: 'Poppins', sans-serif;
        }
        .container {
            margin-top: 30px;
        }
        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px;
            border-bottom: 1px solid #ddd;
            background: white;
            border-radius: 10px;
            margin-bottom: 15px;
        }
        .cart-item img {
            width: 80px;
            height: 80px;
            border-radius: 8px;
            object-fit: cover;
        }
        .cart-actions {
            display: flex;
            align-items: center;
        }
        .quantity-btn {
            background: #3D8D7A;
            color: white;
            border: none;
            padding: 5px 10px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 5px;
        }
        .delete-btn {
            background: #DC3545;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        .checkout-btn {
            background: #3D8D7A;
            color: white;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
            font-size: 18px;
            text-decoration: none;
            margin-top: 20px;
            display: block;
            width: 100%;
        }
        .footer {
            margin-top: 50px;
            background-color: #3D8D7A;
            color: white;
            text-align: center;
            padding: 10px 0;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">🛒 My Cart</h2>

    <div id="cartItems">
        <!-- Dummy Products -->
        <div class="cart-item">
            <img src="https://via.placeholder.com/80" alt="Smartphone">
            <div>
                <h5>Smartphone</h5>
                <p>Price: $<span id="price_0">599.99</span></p>
            </div>
            <div class="cart-actions">
                <button class="quantity-btn" onclick="updateCartQuantity(0, -1)">-</button>
                <span id="cart_quantity_0">1</span>
                <button class="quantity-btn" onclick="updateCartQuantity(0, 1)">+</button>
            </div>
            <button class="delete-btn" onclick="removeCartItem(0)">🗑 Remove</button>
        </div>

        <div class="cart-item">
            <img src="https://via.placeholder.com/80" alt="Laptop">
            <div>
                <h5>Laptop</h5>
                <p>Price: $<span id="price_1">999.99</span></p>
            </div>
            <div class="cart-actions">
                <button class="quantity-btn" onclick="updateCartQuantity(1, -1)">-</button>
                <span id="cart_quantity_1">1</span>
                <button class="quantity-btn" onclick="updateCartQuantity(1, 1)">+</button>
            </div>
            <button class="delete-btn" onclick="removeCartItem(1)">🗑 Remove</button>
        </div>

        <div class="cart-item">
            <img src="https://via.placeholder.com/80" alt="Headphones">
            <div>
                <h5>Wireless Headphones</h5>
                <p>Price: $<span id="price_2">199.99</span></p>
            </div>
            <div class="cart-actions">
                <button class="quantity-btn" onclick="updateCartQuantity(2, -1)">-</button>
                <span id="cart_quantity_2">1</span>
                <button class="quantity-btn" onclick="updateCartQuantity(2, 1)">+</button>
            </div>
            <button class="delete-btn" onclick="removeCartItem(2)">🗑 Remove</button>
        </div>

        <h4 class="text-end">Total: $<span id="totalPrice">0</span></h4>
        <a href="checkout.jsp" class="checkout-btn">Proceed to Checkout</a>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <p>&copy; 2024 EazyDeals. All rights reserved.</p>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function updateCartQuantity(index, change) {
        let quantityElement = document.getElementById("cart_quantity_" + index);
        let priceElement = document.getElementById("price_" + index);
        let totalElement = document.getElementById("totalPrice");
        
        let currentQuantity = parseInt(quantityElement.innerText);
        let price = parseFloat(priceElement.innerText);
        let total = parseFloat(totalElement.innerText);

        if (currentQuantity + change < 1) {
            alert("Quantity cannot be less than 1.");
            return;
        }

        quantityElement.innerText = currentQuantity + change;
        totalElement.innerText = (total + (price * change)).toFixed(2);
    }

    function removeCartItem(index) {
        if (confirm("Are you sure you want to remove this item?")) {
            let cartItems = document.getElementById("cartItems");
            cartItems.children[index].remove();
            updateTotal();
        }
    }

    function updateTotal() {
        let total = 0;
        let prices = document.querySelectorAll('[id^="price_"]');
        let quantities = document.querySelectorAll('[id^="cart_quantity_"]');
        
        for (let i = 0; i < prices.length; i++) {
            total += parseFloat(prices[i].innerText) * parseInt(quantities[i].innerText);
        }
        
        document.getElementById("totalPrice").innerText = total.toFixed(2);
    }

    window.onload = updateTotal;
</script>

</body>
</html>
