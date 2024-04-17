package com.example.assigment2_crud.controller.servlet;

import com.example.assigment2_crud.repository.SanPhamChiTietRepository;
import com.example.assigment2_crud.repository.SanPhamRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet({
        "/product/cart"
})
public class CartServlet extends HttpServlet {

    private SanPhamRepository sanPhamRepository = new SanPhamRepository();
    private SanPhamChiTietRepository sanPhamChiTietRepository = new SanPhamChiTietRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("page", "cart.jsp");

        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }
}


