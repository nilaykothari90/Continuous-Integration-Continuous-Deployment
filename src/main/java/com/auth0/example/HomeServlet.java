package com.auth0.example;

import com.auth0.Auth0User;
import edu.sjsu.cohort6.cloudservices.dao.BaseDAO;
import edu.sjsu.cohort6.cloudservices.dao.Products;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Auth0User user = Auth0User.get(request);
        if (user != null) {
            request.setAttribute("user", user);
        }
        List<Products> productsList = Products.getAll();
        request.setAttribute("products",productsList);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}
