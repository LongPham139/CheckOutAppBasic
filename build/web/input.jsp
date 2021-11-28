<%-- 
    Document   : input
    Created on : Sep 6, 2021, 10:46:52 AM
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
        <form action="DispatchServlet" method="POST">
            Address: <input type="text" name="txtAddress" value="" /><br/>
            Phone Number: <input type="text" name="txtPhone" value="" /><br/>
            <input type="submit" value="Save" name="btnAction" />
        </form>
    </body>
</html>
