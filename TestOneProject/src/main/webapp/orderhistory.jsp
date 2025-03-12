<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History | EazyWay Shop</title>
    
    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        /* 🌟 Global Styles */
        body {
            background: linear-gradient(135deg, #B3D8A8, #A3D1C6, #3D8D7A);
            font-family: Arial, sans-serif;
        }

        /* 🔹 Navbar Styling */
        .navbar {
            background: #2B5D50;
            padding: 15px;
        }
        .navbar-brand {
            color: white;
            font-size: 22px;
            font-weight: bold;
        }
        .nav-link {
            color: white;
            font-weight: 500;
            transition: 0.3s;
        }
        .nav-link:hover {
            color: #FAD02E;
        }

        /* 📦 Order Table */
        .order-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            margin-top: 30px;
        }

        .table th {
            background: #2B5D50;
            color: white;
            text-align: center;
        }

        .table td {
            text-align: center;
        }

        .status {
            font-weight: bold;
            color: blue;
        }

        /* 🛒 Responsive Design */
        @media (max-width: 768px) {
            .navbar-brand {
                font-size: 18px;
            }
            .table {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

    <!-- 🌟 Navigation Bar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">EazyWay Shop</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">🏠 Home</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 📦 Order History Section -->
    <div class="container order-container">
        <h2 class="text-center">📦 Your Order History</h2>
        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    <th>Order ID</th> <!-- New Column for Order ID -->
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Status</th>
                    <th>Order Date</th> <!-- New Column for Date -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>#1001</td> <!-- Example Order ID -->
                    <td>Redmi Pad 6</td>
                    <td>1</td>
                    <td>₹18,999</td>
                    <td class="status">Order Placed</td>
                    <td>2025-03-10</td>
                </tr>
                <tr>
                    <td>#1002</td>
                    <td>Apple iPhone 13 (512 GB)</td>
                    <td>1</td>
                    <td>₹1,25,999</td>
                    <td class="status">Order Placed</td>
                    <td>2025-03-09</td>
                </tr>
                <tr>
                    <td>#1003</td>
                    <td>ASUS Vivobook 15</td>
                    <td>1</td>
                    <td>₹50,999</td>
                    <td class="status">Order Placed</td>
                    <td>2025-03-08</td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
