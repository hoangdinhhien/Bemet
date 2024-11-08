/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hien.dev;

import java.io.IOException;
import hien.dev.data.dao.DatabaseDao;
import hien.dev.data.dao.UserDao;
import hien.dev.data.md5.MD5Hashing;
import hien.dev.data.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class LoginServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            response.sendRedirect("HomeServlet");
        } else {
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession();
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    UserDao userDao = DatabaseDao.getInstance().getUserDao();
    String encryptedPassword = MD5Hashing.encryptMD5(password);
    User user = userDao.find(email, encryptedPassword);

    if (user == null) {
        session.setAttribute("error", "Sai email hoặc mật khẩu.");
        response.sendRedirect("LoginServlet");
    } else {
        session.setAttribute("user", user);
        response.sendRedirect("HomeServlet");
    }
}

}
