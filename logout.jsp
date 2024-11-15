<%-- 	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    HttpSession httpsession = request.getSession(false); 
    if (httpsession == null || httpsession.getAttribute("user") == null) {
        response.sendRedirect("signIn.jsp"); 
        return;
    }
%>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Secure Page</title>
</head>
<body>
<%
    // Check if the session exists and if the user is logged in
    HttpSession httpsession = request.getSession(false); 
    if (httpsession == null || httpsession.getAttribute("user") == null) {
        // Redirect to the sign-in page if not authenticated
        response.sendRedirect("signIn.jsp"); 
        return;
    }
%>

<!-- Protected content goes here -->
<h1>Welcome to the protected page!</h1>

</body>
</html>
