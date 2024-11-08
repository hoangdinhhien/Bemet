/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hien.dev;

import java.io.IOException;
import hien.dev.data.dao.DatabaseDao;
import hien.dev.data.dao.UserDao;
import hien.dev.data.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class RegisterServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        User user = userDao.find(email);

        boolean hasError = false;
        if (user != null) {
            session.setAttribute("error", "Email da ton tai");
            hasError = true;
        }
        if (!password.equals(confirmPassword)) {
            request.setAttribute("confirmPasswordError", "Mat khau khong khop.");
            hasError = true;
        }
        if (hasError) {
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {

            user = new User(email, password, "user");
            userDao.insert(user);

            response.sendRedirect("LoginServlet");
        }
    }
}
