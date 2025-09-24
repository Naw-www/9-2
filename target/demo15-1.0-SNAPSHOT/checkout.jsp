<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="includes/header.html" %>
<link rel="stylesheet" href="css/main.css" type="text/css">

<h2>Checkout Complete</h2>

<%
    com.example.demo15.model.Cart cart =
            (com.example.demo15.model.Cart) request.getAttribute("cart");
    if (cart != null && cart.getItems().size() > 0) {
%>
<h3>Order Summary</h3>
<table>
    <tr>
        <th>Quantity</th>
        <th>Description</th>
        <th>Price</th>
        <th>Amount</th>
    </tr>
    <%
        for (com.example.demo15.model.CartItem item : cart.getItems()) {
    %>
    <tr>
        <td><%= item.getQuantity() %></td>
        <td><%= item.getProduct().getDescription() %></td>
        <td>$<%= String.format("%.2f", item.getProduct().getPrice()) %></td>
        <td>$<%= String.format("%.2f", item.getTotal()) %></td>
    </tr>
    <%
        }
    %>
    <tr>
        <td colspan="3" style="text-align:right;"><b>Total:</b></td>
        <td><b>$<%= String.format("%.2f", cart.getTotal()) %></b></td>
    </tr>
</table>

<h3>Choose Payment Method</h3>
<form action="confirmPayment" method="post" style="margin-top:20px;">
    <select name="paymentMethod" required>
        <option value="credit">Credit Card</option>
        <option value="paypal">PayPal</option>
        <option value="cod">Cash on Delivery</option>
    </select><br><br>

    <input type="submit" value="Confirm Payment">
</form>

<form action="loadProducts" method="get" style="margin-top:10px;">
    <input type="submit" value="Back to Shopping">
</form>
<%
} else {
%>
<p>Your cart is empty.</p>
<form action="loadProducts" method="get" style="margin-top:20px;">
    <input type="submit" value="Back to Shopping">
</form>
<%
    }
%>

<%@ include file="includes/footer.jsp" %>
