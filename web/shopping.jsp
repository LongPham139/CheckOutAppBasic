<%-- 
    Document   : shopping
    Created on : Sep 3, 2021, 11:14:06 PM
    Author     : Long Pham
--%>

<%@page import="longpt.cart.CartOBJ"%>
<%@page import="longpt.product.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="longpt.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome to Shopping!</h1>
        <%
            String searchValue = request.getParameter("txtSearch");
            if (searchValue == null) {
                searchValue = "";
            }
        %>
        <form action="DispatchServlet" method="POST">
            <input type="text" name="txtSearch" value="<%= searchValue%>" /> <input type="submit" value="Search" name="btnAction" />
        </form>
        <%
            List<ProductDTO> list = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
            int count = 1;
            if (list != null && list.size() > 0) {

        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th></th>                                              
                </tr>
            </thead>
            <tbody>
                <%                    for (ProductDTO pro : list) {
                        int quan = 1;
                %>
            <form action="DispatchServlet" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td><%= pro.getProductName()%></td>
                    <td><%= pro.getPrice()%></td>
                    <td>
                        <input type="number" name="txtQuantity" value="<%= quan%>" min="1"/>
                    </td>
                    <td>
                        <input type="hidden" name="txtProID" value="<%= pro.getProductID()%>" />
                        <input type="submit" value="Add To Cart" name="btnAction"/>
                        <input type="hidden" name="txtSearch" value="<%= searchValue%>" />
                    </td>

                </tr>
            </form>


            <%
                }%>

            <%

            %>
        </tbody>
    </table>

    <%            } else {
    %>
    <h2>Nothing to show!!!</h2>
    <%        }
        CartOBJ cart = (CartOBJ) session.getAttribute("CART");
        if (cart != null && cart.getCart().size() > 0) {
    %>
    <a href="viewCart.jsp">View Your Cart</a>
    <%
        }
    %>

</body>
</html>
