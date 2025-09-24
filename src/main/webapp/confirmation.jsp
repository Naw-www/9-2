<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="includes/header.html" %>
<link rel="stylesheet" href="css/main.css" type="text/css">

<h2>Payment Successful</h2>
<p>Thank you for your purchase! Your payment has been confirmed.</p>

<%
    String paymentMethod = (String) request.getAttribute("paymentMethod");
    if (paymentMethod != null) {
        String methodName = "";
        if ("credit".equals(paymentMethod)) methodName = "Credit Card";
        else if ("paypal".equals(paymentMethod)) methodName = "PayPal";
        else if ("cod".equals(paymentMethod)) methodName = "Cash on Delivery";
%>
<p><b>Payment Method: </b><%= methodName %></p>
<%
    }
%>

<form action="loadProducts" method="get" style="margin-top:20px;">
    <input type="submit" value="Back to Shopping">
</form>

<%@ include file="includes/footer.jsp" %>
