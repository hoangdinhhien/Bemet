/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hien.dev;

import hien.dev.data.dao.DatabaseDao;
import hien.dev.data.dao.ProductDao;
import hien.dev.data.model.OrderItem;
import hien.dev.data.model.Product;
import hien.dev.util.Constants;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        Product product = productDao.find(productId);
        List<Product> newsProductList = productDao.news(Constants.NUMBER_LIMIT);
        List<Product> hotProductList = productDao.hot(Constants.NUMBER_LIMIT);
        request.setAttribute("cartCount", getCartCount(request));

        request.setAttribute("product", product);
        request.setAttribute("newsProductList", newsProductList);
        request.setAttribute("hotProductList", hotProductList);
        request.getRequestDispatcher("product.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private int getCartCount(HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");

        if (cart == null) {
            return 0;
        }

        return cart.size();
    }
}
