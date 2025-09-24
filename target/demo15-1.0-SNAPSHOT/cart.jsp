<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="includes/header.html" %>
<link rel="stylesheet" href="css/main.css" type="text/css">

<h2>Your cart</h2>
<table>
    <tr>
        <th>Quantity</th>
        <th>Description</th>
        <th>Price</th>
        <th>Amount</th>
        <th></th>
    </tr>
    <%
        com.example.demo15.model.Cart cart =
                (com.example.demo15.model.Cart) session.getAttribute("cart");
        if (cart != null) {
            for (com.example.demo15.model.CartItem item : cart.getItems()) {
    %>
    <tr>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="code" value="<%= item.getProduct().getCode() %>">
                <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="0">
                <input type="submit" value="Update">
            </form>
        </td>
        <td><%= item.getProduct().getDescription() %></td>
        <td>$<%= String.format("%.2f", item.getProduct().getPrice()) %></td>
        <td>$<%= String.format("%.2f", item.getTotal()) %></td>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="code" value="<%= item.getProduct().getCode() %>">
                <input type="hidden" name="quantity" value="0">
                <input type="submit" value="Remove Item">
            </form>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>

<p><b>Total: </b> $<%= cart != null ? String.format("%.2f", cart.getTotal()) : "0.00" %></p>

<form action="loadProducts" method="get">
    <input type="submit" value="Continue Shopping">
</form>
<form action="checkout" method="post">
    <input type="submit" value="Checkout">
</form>

<%@ include file="includes/footer.jsp" %>
