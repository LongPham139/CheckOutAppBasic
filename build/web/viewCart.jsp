<%-- 
    Document   : viewCart
    Created on : Sep 4, 2021, 1:06:43 AM
    Author     : Long Pham
--%>

<%@page import="longpt.product.ProductDTO"%>
<%@page import="longpt.cart.CartOBJ"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Your Cart!</h1>
        <%
            CartOBJ list = (CartOBJ) session.getAttribute("CART");
            if (list != null) {
                int count = 1;
                if (list.getCart().values().isEmpty()) {
        %> 
        <a href="SearchServlet"> Add more</a>
        <%
        } else {
        %>        
        <table border="1">
            <thead>
                <tr>
                    <th>No </th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>                                
                </tr>
            </thead>
            <tbody>
                <%
                    float total = 0;
                    String fmt = "";
                    for (ProductDTO pro : list.getCart().values()) {
                        total += pro.getPrice() * pro.getQuantity();
                        fmt = String.format("%.2f", total);
                %>
            <form action="DispatchServlet" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td><%= pro.getProductName()%></td>
                    <td>
                        <input type="text" name="txtQuan" value="<%= pro.getQuantity()%>" />
                    </td>
                    <td><%= String.format("%.2f", pro.getPrice()) %></td>
                    <td><%= String.format("%.2f", pro.getQuantity() * pro.getPrice()) %></td>
                    <td>
                        <input type="hidden" name="txtProID" value="<%= pro.getProductID()%>" />
                        <input type="submit" value="Edit" name="btnAction" />
                    </td>
                    <td>
                        <input type="submit" value="Remove" name="btnAction" />
                        <input type="hidden" name="txtProID" value="<%= pro.getProductID()%>" />
                    </td>
                </tr>
            </form>
            <%
                }
            %>

        </tbody>
    </table>
    <b>Total: <%= fmt%></b>
    <%
        session.setAttribute("TOTAL", total);
        %>
    <form action="DispatchServlet" method="POST">
        <input type="submit" value="Check Out" name="btnAction" />        
        <input type="hidden" name="txtTotal" value="<%= fmt%>" />
    </form>

    <%
            }
        }
    %>
</body>
</html>
