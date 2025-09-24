package com.example.demo15.servlet;

import com.example.demo15.model.Cart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        request.setAttribute("cart", cart);

        String url = "/checkout.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
