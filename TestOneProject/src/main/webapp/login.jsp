<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>? Login | EazyDeals Shop</title>
    
    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #B3D8A8, #A3D1C6, #3D8D7A);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            animation: fadeBg 4s infinite alternate ease-in-out;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.15);
            padding: 35px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            max-width: 420px;
            width: 100%;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        .form-control {
            border-radius: 10px;
            padding-left: 45px;
            border: 1px solid rgba(255, 255, 255, 0.4);
            background: rgba(255, 255, 255, 0.2);
            color: white;
        }

        .form-control:focus {
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
            border-color: rgba(255, 255, 255, 0.8);
        }

        .input-group-text {
            background: none;
            border: none;
            color: white;
            font-size: 1.2em;
        }

        .error-message {
            color: red;
            font-size: 0.9em;
            text-align: left;
            margin-top: 5px;
            display: none;
        }

        .btn-custom {
            border-radius: 12px;
            font-weight: bold;
            transition: 0.3s ease-in-out;
            opacity: 0.6;
            cursor: not-allowed;
        }

        .btn-custom.enabled {
            opacity: 1;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2 class="mb-3">👋 Welcome Back!</h2>
        <form action="dashboard.jsp" method="post">
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter Email" required>
            </div>
            <div id="emailError" class="error-message">Please enter a valid email address.</div>

            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            </div>

            <div class="d-flex justify-content-between mb-3">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Remember Me</label>
                </div>
                <a href="forgotpwd.jsp" class="forgot-password">Forgot Password?</a>
            </div>

            <button type="submit" class="btn btn-primary w-100 btn-custom" id="loginBtn" disabled>Login</button>
        </form>

        <p class="mt-3">Don't have an account? <a href="signup.jsp" class="register-link">Sign Up</a></p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript for Live Validation -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let usernameInput = document.getElementById("username");
            let passwordInput = document.getElementById("password");
            let emailError = document.getElementById("emailError");
            let loginBtn = document.getElementById("loginBtn");

            function isValidEmail(email) {
                let emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                return emailRegex.test(email);
            }

            function validateFields() {
                let email = usernameInput.value.trim();
                let password = passwordInput.value.trim();

                if (email === "") {
                    emailError.style.display = "none";
                } else if (!isValidEmail(email)) {
                    emailError.style.display = "block";
                } else {
                    emailError.style.display = "none";
                }

                if (isValidEmail(email) && password !== "") {
                    loginBtn.removeAttribute("disabled");
                    loginBtn.classList.add("enabled");
                } else {
                    loginBtn.setAttribute("disabled", "true");
                    loginBtn.classList.remove("enabled");
                }
            }

            usernameInput.addEventListener("input", validateFields);
            passwordInput.addEventListener("input", validateFields);
        });
    </script>

</body>
</html>
