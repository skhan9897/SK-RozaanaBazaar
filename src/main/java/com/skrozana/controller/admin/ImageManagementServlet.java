package com.skrozana.controller.admin;

import com.skrozana.dao.ProductDAO;
import com.skrozana.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/image-management")
public class ImageManagementServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, Object>> imageList = new ArrayList<>();
        int total = 0, generated = 0, pending = 0, failed = 0;

        String sql = "SELECT p.id, p.product_name, c.category_name, p.image, s.status, s.error_message " +
                     "FROM products p " +
                     "LEFT JOIN categories c ON p.category_id = c.id " +
                     "LEFT JOIN product_image_status s ON p.id = s.product_id " +
                     "ORDER BY p.id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                total++;
                Map<String, Object> item = new HashMap<>();
                item.put("productId", rs.getInt("id"));
                item.put("productName", rs.getString("product_name"));
                item.put("categoryName", rs.getString("category_name"));
                item.put("imagePath", rs.getString("image"));
                
                String status = rs.getString("status");
                item.put("status", status != null ? status : "MISSING");
                item.put("error", rs.getString("error_message"));
                
                if ("GENERATED".equals(status)) generated++;
                else if ("PENDING".equals(status) || "GENERATING".equals(status)) pending++;
                else if ("FAILED".equals(status)) failed++;
                
                imageList.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("imageList", imageList);
        request.setAttribute("totalProducts", total);
        request.setAttribute("generatedCount", generated);
        request.setAttribute("pendingCount", pending);
        request.setAttribute("failedCount", failed);

        request.getRequestDispatcher("/admin/products/image-management.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String productIdStr = request.getParameter("productId");

        if ("regenerate".equals(action) && productIdStr != null) {
            int productId = Integer.parseInt(productIdStr);
            String sql = "INSERT INTO product_image_status (product_id, status) VALUES (?, 'PENDING') " +
                         "ON DUPLICATE KEY UPDATE status = 'PENDING', error_message = NULL";
            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, productId);
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("image-management");
    }
}
