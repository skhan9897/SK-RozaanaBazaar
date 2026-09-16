package com.skrozana.controller.admin;

import com.skrozana.dao.ProductDAO;
import com.skrozana.model.Product;
import com.skrozana.util.ImageGenerationService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/auto-populate-images")
public class ImageAutoPopulateServlet extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productDAO.getAllProducts(0, 5000);
        int updatedCount = 0;
        
        for (Product product : products) {
            if (product.getImage() == null || product.getImage().isEmpty() || product.getImage().contains("placeholder")) {
                ImageGenerationService.autoAssignImages(product);
                productDAO.updateProduct(product);
                updatedCount++;
            }
        }
        
        response.setContentType("text/plain");
        response.getWriter().write("Successfully populated images for " + updatedCount + " products.");
    }
}
