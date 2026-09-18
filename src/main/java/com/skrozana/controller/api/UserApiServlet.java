package com.skrozana.controller.api;

import com.google.gson.Gson;
import com.skrozana.dao.PersistentSessionDAO;
import com.skrozana.dao.UserDAO;
import com.skrozana.model.User;
import com.skrozana.util.TokenService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/user")
public class UserApiServlet extends HttpServlet {
    private UserDAO userDAO;
    private PersistentSessionDAO sessionDAO;
    private Gson gson;

    @Override
    public void init() {
        userDAO = new UserDAO();
        sessionDAO = new PersistentSessionDAO();
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

                // Issue persistent token for Android
                String selector = UUID.randomUUID().toString();
                String rawToken = TokenService.generateRandomToken();
                sessionDAO.saveSession(user.getId(), "CUSTOMER", selector, rawToken, "Android App", 90); // 90 days for App
                resultMap.put("persistentToken", selector + ":" + rawToken);
            } else {
                resultMap.put("status", "error");
                resultMap.put("message", "Invalid credentials");
            }
        } else if ("validateToken".equals(action)) {
            String token = request.getParameter("token");
            if (token != null && token.contains(":")) {
                String[] parts = token.split(":");
                Integer userId = sessionDAO.validateSession(parts[0], parts[1]);
                if (userId != null) {
                    User user = userDAO.getUserById(userId);
                    if (user != null && "active".equals(user.getStatus())) {
                        resultMap.put("status", "success");
                        resultMap.put("user", user);
                        
                        // Rotate Token
                        String newRawToken = TokenService.generateRandomToken();
                        sessionDAO.rotateToken(parts[0], newRawToken);
                        resultMap.put("persistentToken", parts[0] + ":" + newRawToken);
                    } else {
                        resultMap.put("status", "error");
                        resultMap.put("message", "User not found or inactive");
                    }
                } else {
                    resultMap.put("status", "error");
                    resultMap.put("message", "Invalid or expired token");
                }
            } else {
                resultMap.put("status", "error");
                resultMap.put("message", "Missing token");
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
