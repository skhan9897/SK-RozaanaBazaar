package com.skrozana.controller;

import com.skrozana.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/diagnostics")
public class DiagnosticServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("seed".equals(action)) {
            try {
                com.skrozana.util.DatabaseSeeder.main(null);
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("diagnostics");
            return;
        }

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head><title>Diagnostics</title></head><body><h1>SKRozanaBazaar Diagnostics</h1>");
        out.println("<a href='diagnostics?action=seed' style='display:inline-block; padding:10px 20px; background:#007bff; color:white; text-decoration:none; border-radius:5px;'>FORCE SEED DATABASE</a><br><br>");

        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null) {
                out.println("<p style='color:green'>Database Connection: <b>SUCCESS</b></p>");
                
                DatabaseMetaData md = conn.getMetaData();
                out.println("<p>Database: " + md.getDatabaseProductName() + " " + md.getDatabaseProductVersion() + "</p>");

                out.println("<h3>Tables in Database:</h3><ul>");
                try (ResultSet rsTables = md.getTables(null, null, "%", new String[] {"TABLE"})) {
                    while (rsTables.next()) {
                        out.println("<li>" + rsTables.getString(3) + "</li>");
                    }
                }
                out.println("</ul>");

                try (Statement stmt = conn.createStatement()) {
                    try (ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM products")) {
                        if (rs.next()) out.println("<p>Product Count: <b>" + rs.getInt(1) + "</b></p>");
                    }
                    try (ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM categories")) {
                        if (rs.next()) out.println("<p>Category Count: <b>" + rs.getInt(1) + "</b></p>");
                    }

                    try (ResultSet rs = stmt.executeQuery("SELECT * FROM products LIMIT 10")) {
                        out.println("<h3>Latest Products:</h3><table border='1'><tr><th>ID</th><th>Name</th><th>Status</th></tr>");
                        while (rs.next()) {
                            out.println("<tr><td>" + rs.getInt("id") + "</td><td>" + rs.getString("product_name") + "</td><td>" + rs.getString("status") + "</td></tr>");
                        }
                        out.println("</table>");
                    }
                }
            } else {
                out.println("<p style='color:red'>Database Connection: <b>FAILED (null)</b></p>");
            }
        } catch (Exception e) {
            out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
            out.println("<pre>");
            e.printStackTrace(out);
            out.println("</pre>");
        }
        
        out.println("<br><hr><a href='index'>Go to Home Page</a>");
        out.println("</body></html>");
    }
}
