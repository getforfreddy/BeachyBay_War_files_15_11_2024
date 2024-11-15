<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/logins/login-12/assets/css/login-12.css">
  <meta charset="UTF-8">
  <title>Registration</title>
  <script>
    function validateForm() {
      const email = document.getElementById("email").value.trim();
      const password = document.getElementById("password").value.trim();
      const confirmPassword = document.getElementById("con-password").value.trim();
      
      // Check if any fields are blank
      if (!email || !password || !confirmPassword) {
        alert("All fields are required.");
        return false;
      }

      // Regex patterns
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,12}$/;

      // Validation checks
      if (!emailRegex.test(email)) {
        alert("Please enter a valid email address.");
        return false;
      }
      if (!passwordRegex.test(password)) {
        alert("Password must be at least 8 characters long, include at least one uppercase letter, one lowercase letter, one digit, and one special character.");
        return false;
      }
      if (password !== confirmPassword) {
        alert("Passwords do not match.");
        return false;
      }
      return true;
    }
  </script>
</head>
<body>
  <!-- Login 12 - Bootstrap Brain Component -->
  <section class="py-3 py-md-5 py-xl-8">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="mb-5">
            <h2 class="display-5 fw-bold text-center">Registration</h2>
          </div>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-12 col-lg-10 col-xl-8">
          <div class="row gy-5 justify-content-center">
            <div class="col-12 col-lg-5">
              <form onsubmit="return validateForm()" action="registrationAction.jsp" method="post">
                <div class="row gy-3 overflow-hidden">
                  <!-- Email Field -->
                  <div class="col-12">
                    <div class="form-floating mb-3">
                      <input type="email" class="form-control border-0 border-bottom rounded-0" name="email" id="email" placeholder="name@example.com">
                      <label for="email" class="form-label">Email</label>
                    </div>
                  </div>

                  <!-- Password Field with Eye Toggle -->
                  <div class="col-12">
                    <div class="form-floating mb-3">
                      <input type="password" class="form-control border-0 border-bottom rounded-0" name="password" id="password" placeholder="Password">
                      <label for="password" class="form-label">Password</label>
                    </div>
                  </div>

                  <!-- Confirm Password Field with Eye Toggle -->
                  <div class="col-12">
                    <div class="form-floating mb-3">
                      <input type="password" class="form-control border-0 border-bottom rounded-0" name="password" id="con-password" placeholder="Confirm Password">
                      <label for="con-password" class="form-label">Re-Password</label>
                    </div>
                  </div>

                  <!-- Submit Button -->
                  <div class="col-12">
                    <div class="d-grid">
                      <button class="btn btn-lg btn-dark rounded-0 fs-6" type="submit">Register</button>
                    </div>
                  </div>
                </div>
              </form>
              <br><br>
               <div class="text-center">
          <button class="btn btn-lg btn-dark rounded-0 fs-6" onclick="window.location.href='signIn.jsp'">Go to Login</button>
        </div>
            </div>  
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
</html>