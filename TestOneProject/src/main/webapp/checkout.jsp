<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, javax.servlet.http.*" %>
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
            background: #F8F9FA;
            color: black !important;
        }
        .container {
            margin-top: 30px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2, h4, label, th, td {
            color: black !important;
        }
        .table th, .table td {
            vertical-align: middle;
            text-align: center;
        }
        .remove-btn {
            background: #D72638;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
        }
        .btn-success {
            background: #28A745;
            border: none;
            color: white;
            width: 100%;
            font-size: 18px;
            padding: 10px;
            border-radius: 5px;
        }
        .btn-success:hover {
            background: #218838;
        }
        #orderSuccess {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: black;
            color: white;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
            z-index: 1000;
            font-size: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div id="orderSuccess">🎉 Order placed successfully! Downloading receipt...</div>

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
                    <input type="email" class="form-control" id="email" value="" required>
                </div>
                <div class="mb-2">
                    <label>Your name</label>
                    <input type="text" class="form-control" id="name" value="" required>
                </div>
                <div class="mb-2">
                    <label>Shipping Address</label>
                    <textarea class="form-control" id="address" required></textarea>
                </div>
                <div class="row">
                    <div class="col-md-4 mb-2">
                        <label>State</label>
                        <input type="text" class="form-control" id="state" value="" required>
                    </div>
                    <div class="col-md-4 mb-2">
                        <label>City</label>
                        <input type="text" class="form-control" id="city" value="" required>
                    </div>
                    <div class="col-md-4 mb-2">
                        <label>Pincode</label>
                        <input type="text" class="form-control" id="pincode" value="" required>
                    </div>
                </div>
                <div class="mb-2">
                    <label>Contact Number</label>
                    <input type="tel" class="form-control" id="contact" value="" required>
                </div>
                <div class="mb-2">
                    <label>Payment Method</label>
                    <input type="text" class="form-control" value="Cash on Delivery" readonly>
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

    function removeItem(index) {
        cartItems.splice(index, 1);
        loadCart();
    }

    function placeOrder() {
        document.getElementById("orderSuccess").style.display = "block";
        setTimeout(() => {
            generateReceipt();
            document.getElementById("orderSuccess").style.display = "none";
        }, 2000);
    }

    function generateReceipt() {
        let userDetails = `
            Name: ${document.getElementById("name").value}
            Email: ${document.getElementById("email").value}
            Address: ${document.getElementById("address").value}, ${document.getElementById("city").value}, ${document.getElementById("state").value}, ${document.getElementById("pincode").value}
            Contact: ${document.getElementById("contact").value}
            Payment: Cash on Delivery
        `;

        let productDetails = "Products Ordered:\n" + cartItems.map(item => `${item.name} - $${item.price} x ${item.quantity} = $${item.price * item.quantity}`).join("\n");

        let receiptContent = `Order Receipt\n\n${userDetails}\n\n${productDetails}\n\nTotal: $${document.getElementById("totalPrice").innerText}`;
        let blob = new Blob([receiptContent], { type: "text/plain" });
        let link = document.createElement("a");
        link.href = URL.createObjectURL(blob);
        link.download = "OrderReceipt.txt";
        link.click();
    }

    window.onload = loadCart;
</script>

</body>
</html>
