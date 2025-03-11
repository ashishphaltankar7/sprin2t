<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, jakarta.servlet.http.*" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>

    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background: #FBFFE4;
            color: black !important;
        }

        .container {
            margin-top: 30px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .table {
            border: 2px solid #A3D1C6;
        }

        .table th, .table td {
            vertical-align: middle;
            text-align: center;
            background: #B3D8A8;
            color: black !important;
        }

        h2, h4, label, th, td, input, textarea, button, select, p, span, div, a {
            color: black !important;
        }

        .form-control {
            border: 1px solid #A3D1C6;
            background: #FBFFE4;
        }

        .btn-success {
            background: #3D8D7A;
            border: none;
            color: white !important;
            width: 100%;
            font-size: 18px;
            padding: 10px;
            border-radius: 5px;
        }

        .btn-success:hover {
            background: #2E6E5E;
        }

        /* Navbar Styling */
        .navbar {
            background: #B3D8A8 !important;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .navbar .navbar-brand, .navbar-nav .nav-link {
            color: #3D8D7A !important;
            font-weight: bold;
        }

        .navbar .navbar-nav .nav-link:hover {
            color: #2E6E5E !important;
        }

        /* Order Confirmation Pop-up */
        #orderPopup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            color: black !important;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            z-index: 1000;
            font-size: 20px;
            font-weight: bold;
            width: 300px;
        }

        #orderPopup button {
            margin-top: 15px;
            background: #3D8D7A;
            border: none;
            padding: 8px 15px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        #orderPopup button:hover {
            background: #2E6E5E;
        }

        /* Overlay Background */
        #overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
            z-index: 999;
        }
    </style>
</head>
<body>

<!-- Order Confirmation Pop-up -->
<div id="overlay"></div>
<div id="orderPopup">
    🎉 Order Confirmed!  
    <br> Your order has been placed successfully.
    <br>
    <button onclick="closePopup()">OK</button>
</div>

<div class="container">
    <h2>Checkout</h2>

    <div class="row">
        <!-- Order Summary -->
        <div class="col-md-6">
            <h4 class="text-center">Your selected items</h4>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="cartItems">
                    <!-- Cart Items will be dynamically added here -->
                </tbody>
            </table>
            <h4 class="text-end">Total Price: $<span id="totalPrice">0.00</span></h4>
        </div>

        <!-- User Details -->
        <div class="col-md-6">
            <h4 class="text-center">Your details for order</h4>
            <form id="checkoutForm">
                <div class="mb-2">
                    <label>Email address</label>
                    <input type="email" class="form-control" id="email" required>
                </div>
                <div class="mb-2">
                    <label>Your name</label>
                    <input type="text" class="form-control" id="name" required>
                </div>
                <div class="mb-2">
                    <label>Shipping Address</label>
                    <textarea class="form-control" id="address" required></textarea>
                </div>
                <div class="row">
                    <div class="col-md-4 mb-2">
                        <label>State</label>
                        <input type="text" class="form-control" id="state" required>
                    </div>
                    <div class="col-md-4 mb-2">
                        <label>City</label>
                        <input type="text" class="form-control" id="city" required>
                    </div>
                    <div class="col-md-4 mb-2">
                        <label>Pincode</label>
                        <input type="text" class="form-control" id="pincode" required>
                    </div>
                </div>
                <div class="mb-2">
                    <label>Contact Number</label>
                    <input type="tel" class="form-control" id="contact" required>
                </div>
                <div class="mb-2">
                    <label>Payment Method</label>
                    <input type="text" class="form-control" value="Cash on Delivery" readonly disabled>
                </div>
                <button type="button" class="btn btn-success" onclick="placeOrder()">Order now</button>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    let cartItems = [
        { name: "MacBook Air", price: 999, quantity: 1 },
        { name: "Samsung Galaxy S21", price: 799, quantity: 1 },
        { name: "Nike Sneakers", price: 120, quantity: 1 }
    ];

    function loadCart() {
        let cartTable = document.getElementById("cartItems");
        let total = 0;
        cartTable.innerHTML = "";
        cartItems.forEach((item, index) => {
            let totalPrice = item.price * item.quantity;
            total += totalPrice;
            cartTable.innerHTML += `
                <tr>
                    <td>${item.name}</td>
                    <td>$${item.price}</td>
                    <td>${item.quantity}</td>
                    <td>$${totalPrice}</td>
                    <td><button class="remove-btn" onclick="removeItem(${index})">Remove</button></td>
                </tr>`;
        });
        document.getElementById("totalPrice").innerText = total.toFixed(2);
    }

    function placeOrder() {
        document.getElementById("overlay").style.display = "block";
        document.getElementById("orderPopup").style.display = "block";
    }

    function closePopup() {
        document.getElementById("overlay").style.display = "none";
        document.getElementById("orderPopup").style.display = "none";
    }

    window.onload = loadCart;
</script>

</body>
</html>
