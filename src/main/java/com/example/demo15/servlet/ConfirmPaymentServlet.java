package com.example.demo15.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class ConfirmPaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String paymentMethod = request.getParameter("paymentMethod");
        request.setAttribute("paymentMethod", paymentMethod);

        String url = "/confirmation.jsp";
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}
