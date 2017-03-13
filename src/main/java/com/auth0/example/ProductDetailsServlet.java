package com.auth0.example;

import edu.sjsu.cohort6.cloudservices.dao.Products;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by shruteegangras on 5/12/16.
 */
public class ProductDetailsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Products product = Products.getById("S10_1678");
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write(product.toString());
        response.getWriter().flush();
        response.getWriter().close();
    }
}
