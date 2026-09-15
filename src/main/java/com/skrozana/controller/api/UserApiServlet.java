package com.skrozana.controller.api;

import com.google.gson.Gson;
import com.skrozana.dao.UserDAO;
import com.skrozana.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/user")
public class UserApiServlet extends HttpServlet {
    private UserDAO userDAO;
    private Gson gson;

    @Override
    public void init() {
        userDAO = new UserDAO();
        gson = new Gson();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");
        Map<String, Object> resultMap = new HashMap<>();

        if ("login".equals(action)) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            User user = userDAO.loginUser(email, password);
            if (user != null) {
                resultMap.put("status", "success");
                resultMap.put("user", user);
            } else {
                resultMap.put("status", "error");
                resultMap.put("message", "Invalid credentials");
            }
        } else if ("register".equals(action)) {
            User user = new User();
            user.setName(request.getParameter("name"));
            user.setEmail(request.getParameter("email"));
            user.setMobile(request.getParameter("mobile"));
            user.setPassword(request.getParameter("password"));
            user.setAddress(request.getParameter("address"));
            user.setCity(request.getParameter("city"));
            user.setState(request.getParameter("state"));
            user.setPincode(request.getParameter("pincode"));

            if (userDAO.registerUser(user)) {
                resultMap.put("status", "success");
                resultMap.put("message", "Registration successful");
            } else {
                resultMap.put("status", "error");
                resultMap.put("message", "Registration failed");
            }
        }

        out.print(gson.toJson(resultMap));
        out.flush();
    }
}
