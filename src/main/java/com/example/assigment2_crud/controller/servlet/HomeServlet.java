package com.example.assigment2_crud.controller.servlet;

import com.example.assigment2_crud.model.HoaDon;
import com.example.assigment2_crud.model.SanPham;
import com.example.assigment2_crud.repository.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({
        "/",
        "/home",
        "/about",
        "/admin"
})
public class HomeServlet extends HttpServlet {

    private SanPhamRepository sanPhamRepository = new SanPhamRepository();
    private HoaDonRepository hoaDonRepository = new HoaDonRepository();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        if(uri.contains("about")){
            req.setAttribute("page", "about.jsp");
        } else if(uri.contains("admin")){
            List<HoaDon> list = hoaDonRepository.findAll();

            req.setAttribute("listHoaDon", list);

            req.setAttribute("page", "admin/hoaDon.jsp");
        }else {
            req.setAttribute("page", "home.jsp");
        }


        List<SanPham> listSPActive =  sanPhamRepository.findByStatus("Active");
        req.setAttribute("listSPActive", listSPActive.subList(0,4));
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

}
