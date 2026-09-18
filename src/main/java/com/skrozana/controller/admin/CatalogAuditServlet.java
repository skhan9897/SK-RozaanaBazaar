package com.skrozana.controller.admin;

import com.skrozana.util.CatalogAuditFixer;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/catalog-audit")
public class CatalogAuditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CatalogAuditFixer.fixAllProductMappings();
        response.setContentType("text/plain");
        response.getWriter().write("Catalog Audit and Mapping Fix Complete. Check server logs for details.");
    }
}
