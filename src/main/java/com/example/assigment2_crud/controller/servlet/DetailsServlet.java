package com.example.assigment2_crud.controller.servlet;

import com.example.assigment2_crud.model.MauSac;
import com.example.assigment2_crud.model.SanPham;
import com.example.assigment2_crud.model.SanPhamChiTiet;
import com.example.assigment2_crud.model.Size;
import com.example.assigment2_crud.repository.SanPhamChiTietRepository;
import com.example.assigment2_crud.repository.SanPhamRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet({"/product/details"})
public class DetailsServlet extends HttpServlet {

    private SanPhamRepository sanPhamRepository = new SanPhamRepository();
    private SanPhamChiTietRepository sanPhamChiTietRepository = new SanPhamChiTietRepository();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("page", "detailsProduct.jsp");
        System.out.println(req.getRequestURI());
        Integer id = req.getParameter("id") != null?Integer.parseInt(req.getParameter("id")):null;
        System.out.println(id);
        if(id == null ){
            resp.sendRedirect("/product");
            return;
        }
        SanPham sanPham = sanPhamRepository.findById(id);
        List<SanPhamChiTiet> listSPCT = sanPhamChiTietRepository.findByIdSanPham(sanPham.getId());

        Set<Size> listSize = new HashSet<>();
        Set<MauSac> listColor = new HashSet<>();
        listSPCT.forEach(i -> {
            listSize.add(i.getSize());
            listColor.add(i.getMauSac());
        });

        req.setAttribute("listSize", listSize);
        req.setAttribute("listColor", listColor);

        req.setAttribute("listSPCT", listSPCT);
        req.setAttribute("sanPham", sanPham);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
