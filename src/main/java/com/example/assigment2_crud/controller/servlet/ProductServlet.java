package com.example.assigment2_crud.controller.servlet;

import com.example.assigment2_crud.model.SanPham;
import com.example.assigment2_crud.repository.SanPhamRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet({
        "/product"
})
public class ProductServlet extends HttpServlet {

    private SanPhamRepository sanPhamRepository = new SanPhamRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("page", "product.jsp");
        List<SanPham> listSanPham = sanPhamRepository.findByStatus("Active");
        String uri = req.getRequestURI();

        pagination(listSanPham, req, resp);

        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }


    public void pagination(List<SanPham> list, HttpServletRequest req, HttpServletResponse resp){
        List<SanPham> products = list;

        // phân trang
        int pageNumber = 1; //  trang hiện tại
        int pageSize = 12; // số lượng sản phẩm trên mỗi trang
        int totalProducts = products.size(); //tổng sản phẩm hiện có
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize); // tổng số trang để chứa sản phẩm

        String pageParam = req.getParameter("page"); // lấy ra trang hiện tại
        if (pageParam != null && !pageParam.isEmpty()) {
            pageNumber = Integer.parseInt(pageParam); // check và gán cho số trang
        }
        if (pageNumber < 1) {
            pageNumber = 1;
        } else if (pageNumber > totalPages) {
            // nếu số trang hiện tại lớn hơn tổng số trang để chứa sản phẩm thì
            // gán trang hiện tại bằng tổng trang , tức là trang cuối cùng
            pageNumber = totalPages;
        }

        int startIndex = (pageNumber - 1) * pageSize; // vị trí bắt đầu lấy ra sản phẩm để in lên trang
        int endIndex = Math.min(startIndex + pageSize, totalProducts);
        // vị trí cuối cùng, nếu startIndex + pageSize vượt quá phần tử trong mảng
        // thì lấy số lượng phẩn tử trong mảng làm điểm cuối cùng

        List<SanPham> currentPageProducts = products.subList(startIndex, endIndex);
        // lấy ra list sản phẩm và dùng sublist để lấy ra 12 sản phẩm bằng start và end

        // gửi lên server và in ra thôi
        req.setAttribute("currentPageProducts", currentPageProducts);
        req.setAttribute("pageNumber", pageNumber);
        req.setAttribute("totalPages", totalPages);
    }
}
