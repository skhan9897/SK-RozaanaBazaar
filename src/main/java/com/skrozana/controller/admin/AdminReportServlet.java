package com.skrozana.controller.admin;

import com.skrozana.dao.OrderDAO;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/AdminReportServlet")
public class AdminReportServlet extends HttpServlet {
    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        Map<String, Integer> stateData = orderDAO.getOrdersByState();
        request.setAttribute("stateData", stateData);

        request.getRequestDispatcher("/admin/reports/reports.jsp").forward(request, response);
    }
}
