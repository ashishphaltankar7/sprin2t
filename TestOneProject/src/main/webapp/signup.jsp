<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up | Eazy Shop</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #B3D8A8, #A3D1C6, #3D8D7A);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .signup-container {
            background: rgba(255, 255, 255, 0.3);
            padding: 30px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            max-width: 450px;
            width: 100%;
            text-align: center;
        }

        .form-control {
            border-radius: 10px;
        }

        .error-message {
            color: red;
            font-size: 0.9em;
            display: none;
            text-align: left;
            margin-top: 5px;
        }

        .quote {
            font-size: 1.2em;
            font-weight: bold;
            margin-bottom: 20px;
            font-style: italic;
            color: #444;
        }
    </style>
</head>
<body>

    <div class="signup-container"><
       
        <h2 class="mb-3">Sign Up</h2>
        <form method="post" id="signupForm">
            <div class="mb-3">
                <input type="text" class="form-control" id="name" name="name" placeholder="Full Name">
                <span class="error-message" id="nameError">Full name must be 3-50 characters.</span>
            </div>

            <div class="mb-3">
                <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                <span class="error-message" id="emailError">Enter a valid email.</span>
            </div>

            <div class="mb-3">
                <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number">
                <span class="error-message" id="phoneError">Enter a valid 10-digit phone number.</span>
            </div>

            <div class="mb-3">
                <input type="text" class="form-control" id="address" name="address" placeholder="Address">
                <span class="error-message" id="addressError">Address cannot be empty.</span>
            </div>

            <div class="mb-3">
                <input type="text" class="form-control" id="pincode" name="pincode" placeholder="Pincode">
                <span class="error-message" id="pincodeError">Enter a valid 6-digit pincode.</span>
            </div>

            <div class="mb-3">
                <select class="form-control" id="state" name="state">
                    <option value="" disabled selected>Select State</option>
                    <option>Andhra Pradesh</option>
                    <option>Delhi</option>
                    <option>Karnataka</option>
                    <option>Maharashtra</option>
                    <option>Tamil Nadu</option>
                    <option>Uttar Pradesh</option>
                    <option>West Bengal</option>
                </select>
                <span class="error-message" id="stateError">Select a state.</span>
            </div>

            <div class="mb-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                <span class="error-message" id="passwordError">Password must have at least 8 characters, an uppercase letter, a number, and a special character.</span>
            </div>

            <div class="mb-3">
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password">
                <span class="error-message" id="confirmPasswordError">Passwords do not match.</span>
            </div>

            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
        </form>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const form = document.getElementById("signupForm");

            function validateField(input, regex, errorMessageId) {
                let errorSpan = document.getElementById(errorMessageId);
                if (regex.test(input.value.trim())) {
                    errorSpan.style.display = "none";
                } else {
                    errorSpan.style.display = "block";
                }
            }

            function validatePasswordMatch() {
                let password = document.getElementById("password").value.trim();
                let confirmPassword = document.getElementById("confirmPassword").value.trim();
                let errorSpan = document.getElementById("confirmPasswordError");

                if (password !== confirmPassword || confirmPassword === "") {
                    errorSpan.style.display = "block";
                } else {
                    errorSpan.style.display = "none";
                }
            }

            document.getElementById("name").addEventListener("input", function () {
                validateField(this, /^[A-Za-z ]{3,50}$/, "nameError");
            });

            document.getElementById("email").addEventListener("input", function () {
                validateField(this, /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/, "emailError");
            });

            document.getElementById("phone").addEventListener("input", function () {
                validateField(this, /^[6-9]\d{9}$/, "phoneError");
            });

            document.getElementById("pincode").addEventListener("input", function () {
                validateField(this, /^\d{6}$/, "pincodeError");
            });

            document.getElementById("password").addEventListener("input", function () {
                validateField(this, /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/, "passwordError");
            });

            document.getElementById("confirmPassword").addEventListener("input", validatePasswordMatch);

            document.getElementById("state").addEventListener("change", function () {
                let errorSpan = document.getElementById("stateError");
                if (this.value !== "") {
                    errorSpan.style.display = "none";
                } else {
                    errorSpan.style.display = "block";
                }
            });

            form.addEventListener("submit", function (event) {
                let errorMessages = document.querySelectorAll(".error-message");
                let hasError = Array.from(errorMessages).some(msg => msg.style.display === "block");

                if (hasError) {
                    event.preventDefault();
                }
            });
        });
    </script>

</body>
</html>
