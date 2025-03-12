<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - User Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #B3D8A8, #A3D1C6, #3D8D7A);
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
        .table-container {
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
        .btn-remove {
            background: #e74c3c;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn-remove:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>

    <!-- 🌟 Navigation Bar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand">🏠 EazyDeals</a>
            <div class="ms-auto">
                <a class="btn btn-danger" href="logout.jsp">🚪 Logout</a>
            </div>
        </div>
    </nav>

    <!-- 📋 User Management Table -->
    <div class="container table-container">
        <h2 class="text-center">👥 User Management</h2>
        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone No.</th>
                    <th>City</th>
                    <th>Address</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="userTable">
                <c:choose>
                    <c:when test="${not empty userList}">
                        <c:forEach var="user" items="${userList}">
                            <tr id="row-${user.email}">
                                <td>${user.fullName}</td>
                                <td>${user.email}</td>
                                <td>${user.phone}</td>
                                <td>${user.city}</td>
                                <td>${user.address}</td>
                                <td>
                                    <button class="btn-remove" onclick="deleteUser('${user.email}')">Remove</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="6" class="text-center">No Users Found</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS & jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript for Delete (AJAX to Backend) -->
    <script>
        function deleteUser(email) {
            if (confirm("Are you sure you want to remove this user?")) {
                $.ajax({
                    url: "DeleteUserServlet",  // Servlet URL (update as needed)
                    type: "POST",
                    data: { email: email },
                    success: function(response) {
                        if (response.trim() === "success") {
                            location.reload();  // Reload page after deletion
                        } else {
                            alert("Failed to delete user. Please try again.");
                        }
                    },
                    error: function() {
                        alert("Error deleting user. Please check your backend.");
                    }
                });
            }
        }
    </script>

</body>
</html>
