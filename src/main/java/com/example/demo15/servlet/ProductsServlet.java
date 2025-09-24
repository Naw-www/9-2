package com.example.demo15.servlet;

import com.example.demo15.model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class ProductsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> products = new ArrayList<>();
        products.add(new Product("p001", "86 (the band) - True Life Songs and Pictures", 14.95));
        products.add(new Product("p002", "Paddlefoot - The first CD", 12.95));
        products.add(new Product("p003", "Paddlefoot - The second CD", 14.95));
        products.add(new Product("p004", "Joe Rut - Genuine Wood Grained Finish", 14.95));

        HttpSession session = request.getSession();
        session.setAttribute("products", products);

        String url = "/index.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
