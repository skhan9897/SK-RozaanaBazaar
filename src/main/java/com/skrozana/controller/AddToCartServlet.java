package com.skrozana.controller;

import com.skrozana.dao.CartDAO;
import com.skrozana.dao.ProductDAO;
import com.skrozana.model.Cart;
import com.skrozana.model.Product;
import com.skrozana.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private CartDAO cartDAO;
    private ProductDAO productDAO;

    @Override
    public void init() {
        cartDAO = new CartDAO();
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("pid"));
        Product product = productDAO.getProductById(productId);

        if (product != null) {
            Cart cart = new Cart();
            cart.setUserId(user.getId());
            cart.setProductId(productId);
            cart.setQuantity(1);
            cart.setPrice(product.getFinalPrice());

            if (cartDAO.addToCart(cart)) {
                response.sendRedirect("CartServlet");
            } else {
                response.sendRedirect("index.jsp?error=failed_to_add");
            }
        } else {
            response.sendRedirect("index.jsp?error=invalid_product");
        }
    }
}
