/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hien.dev;

import java.io.IOException;
import hien.dev.data.dao.ProductDao;
import hien.dev.data.dao.DatabaseDao;
import hien.dev.data.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;


/**
 *
 * @author Admin
 */
public class SearchServlet  extends BaseServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException,IOException{
      String keyword = request.getParameter("keyword");
      ProductDao productDao = DatabaseDao.getInstance().getProductDao();
      List<Product> productList = productDao.findByName(keyword);
     
      request.setAttribute("productList", productList);
      request.setAttribute("keyword", keyword);
      request.getRequestDispatcher("search.jsp").include(request, response);
  }
   @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException,IOException{
  }
}
