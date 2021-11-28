<%-- 
    Document   : checkOut
    Created on : Sep 4, 2021, 11:54:21 PM
    Author     : Long Pham
--%>

<%@page import="longpt.product.ProductDTO"%>
<%@page import="longpt.cart.CartOBJ"%>
<%@page import="longpt.order.OrderDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            OrderDTO order = (OrderDTO) session.getAttribute("ORDER");
        %>
        <h1>Your Bill</h1>
        Bill ID: <%= order.getOderID()%><br/>
        Address Customer: <%= order.getAddress()%><br/>
        Phone Customer: <%= order.getPhone()%><br/>
        <%
            CartOBJ cart = (CartOBJ) session.getAttribute("CART");
            if (cart != null) {
                int count = 1;
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
                    for (ProductDTO pro : cart.getCart().values()) {
                        total += pro.getPrice() * pro.getQuantity();
                        fmt = String.format("%.2f", total);
                %>
                <tr>
                    <td><%= count++%></td>
                    <td><%= pro.getProductName()%></td>
                    <td><%= pro.getQuantity()%></td>
                    <td><%= pro.getPrice()%></td>
                    <td><%= pro.getQuantity() * pro.getPrice()%></td>
                </tr>
                <%
                        }
                    
                %>

            </tbody>
        </table>
        <b>Total: <%= fmt%></b><br/>
        <%
            }
            session.setAttribute("CART", null);
        %>
        <a href="SearchServlet">Shopping Again!</a>
    </body>
</html>
