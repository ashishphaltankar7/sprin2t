<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details | EazyWay Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background-color: #FBFFE4;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #3D8D7A;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .order-container {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background: #B3D8A8;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }
        .order-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }
        .order-table th {
            background: #3D8D7A;
            color: white;
            padding: 10px;
        }
        .order-table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .status {
            font-weight: bold;
            color: #3D8D7A;
        }
        .search-bar {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #A3D1C6;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#"> Shop</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="order-container">
        <h2 class="text-center">Order Details</h2>
        <input type="text" class="search-bar" placeholder="Search your orders...">
        <table class="order-table mt-3">
            <thead>
                <tr>
                    <th>Picture</th>
                    <th>Product Name</th>
                    <th>Order ID</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><img src="redmi.jpg" width="50"></td>
                    <td>REDMI Pad 6</td>
                    <td>T20230501055718</td>
                    <td>1</td>
                    <td>18,999.00</td>
                    <td class="status">ORDER PLACED</td>
                </tr>
                <tr>
                    <td><img src="iphone.jpg" width="50"></td>
                    <td>APPLE iPhone 13 Pro</td>
                    <td>T20230520083929</td>
                    <td>1</td>
                    <td>125,999.00</td>
                    <td class="status">ORDER SHIPPED</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
