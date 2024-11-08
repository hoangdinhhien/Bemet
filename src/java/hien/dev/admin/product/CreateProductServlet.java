package hien.dev.admin.product;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import hien.dev.admin.BaseAdminServlet;
import hien.dev.data.dao.CategoryDao;
import hien.dev.data.dao.DatabaseDao;
import hien.dev.data.dao.ProductDao;
import hien.dev.data.model.Category;
import hien.dev.data.model.Product;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.util.List;


@MultipartConfig
public class CreateProductServlet extends BaseAdminServlet {
   private static final String UPLOAD_DIR = "assets/img/product";


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categoryList = categoryDao.findAll();

        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("admin/product/create.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        
        Part filePart = request.getPart("thumbnail"); 
        String fileName = filePart.getSubmittedFileName();

        String uploadPath = "C:\\Users\\DELL\\Documents\\NetBeansProjects\\Bemet\\web" + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
       
        File file = new File(uploadPath + File.separator + uniqueFileName);
        try (InputStream inputStream = filePart.getInputStream()) {
            Files.copy(inputStream, file.toPath());
        } catch (IOException e) {
            e.printStackTrace();
            response.getWriter().println("Đã xảy ra lỗi khi tải lên file: " + e.getMessage());
            return;
        }

        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        Product product = new Product(name, description, fileName, price, quantity, categoryId);
        productDao.insert(product);
        response.sendRedirect("IndexProductServlet"); 
    }
}
