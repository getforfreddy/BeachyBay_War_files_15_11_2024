<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Password Hashing and Validation</title>
  <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <h2 class="text-center">Password Hashing and Validation</h2>
        <hr>
        <form method="post">
          <div class="mb-3">
            <label for="password" class="form-label">Enter Password:</label>
            <input type="password" class="form-control" id="password" name="password" required>
          </div>
          <div class="mb-3">
            <label for="verifyPassword" class="form-label">Re-enter Password for Validation:</label>
            <input type="password" class="form-control" id="verifyPassword" name="verifyPassword" required>
          </div>
          <button type="submit" class="btn btn-primary">Hash and Validate Password</button>
        </form>
        <hr>

        <%
          // Get the password inputs from the form submission
          String password = request.getParameter("password");
          String verifyPassword = request.getParameter("verifyPassword");

          if (password != null && !password.isEmpty() && verifyPassword != null && !verifyPassword.isEmpty()) {
            // Generate a salt and hash the password
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            // Display the plain password and the hashed password
            out.println("<div class='alert alert-info'>Plain Password: " + password + "</div>");
            out.println("<div class='alert alert-success'>Hashed Password: " + hashedPassword + "</div>");

            // Check if the entered passwords match by comparing the second password with the hashed one
            if (BCrypt.checkpw(verifyPassword, hashedPassword)) {
              out.println("<div class='alert alert-success'>Passwords match!</div>");
            } else {
              out.println("<div class='alert alert-danger'>Passwords do not match.</div>");
            }
          } else {
            out.println("<div class='alert alert-danger'>Please enter both passwords.</div>");
          }
        %>
      </div>
    </div>
  </div>
</body>
</html>
