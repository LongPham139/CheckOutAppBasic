<%-- 
    Document   : login
    Created on : Sep 6, 2021, 10:28:50 AM
    Author     : Long Pham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login Now!</h1>
        <form action="DispatchServlet" method="POST">
            User ID: <input type="text" name="txtUser" value="" /><br/>
            Password: <input type="password" name="txtPassword" value="" /><br/>
            <input type="submit" value="Login" name="btnAction" />
        </form>
    </body>
</html>
