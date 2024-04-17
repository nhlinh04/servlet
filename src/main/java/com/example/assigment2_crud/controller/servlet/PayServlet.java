package com.example.assigment2_crud.controller.servlet;

import com.example.assigment2_crud.model.HoaDon;
import com.example.assigment2_crud.model.HoaDonChiTiet;
import com.example.assigment2_crud.model.KhachHang;
import com.example.assigment2_crud.model.SanPhamChiTiet;
import com.example.assigment2_crud.model.resp.CartResp;
import com.example.assigment2_crud.model.resp.HoaDonChiTietResp;
import com.example.assigment2_crud.repository.HoaDonChiTietRepository;
import com.example.assigment2_crud.repository.HoaDonRepository;
import com.example.assigment2_crud.repository.KhachHangRepository;
import com.example.assigment2_crud.repository.SanPhamChiTietRepository;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet({
        "/product/pay",
        "/product/pay/success"
})
public class PayServlet extends HttpServlet {

    private KhachHangRepository khachHangRepository = new KhachHangRepository();
    private HoaDonRepository hoaDonRepository = new HoaDonRepository();
    private HoaDonChiTietRepository hoaDonChiTietRepository = new HoaDonChiTietRepository();
    private SanPhamChiTietRepository sanPhamChiTietRepository = new SanPhamChiTietRepository();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<KhachHang> listKhachHang = khachHangRepository.findAll();
        String uri = req.getRequestURI();
        System.out.println(uri);

        if(uri.contains("success")){
            System.out.println("chuyển");
            req.getRequestDispatcher("/views/web/paySuccess.jsp").forward(req, resp);
            return;
        }
        req.setAttribute("listKhachHang", listKhachHang);

        req.getRequestDispatcher("/views/web/pay.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        ObjectNode responseNode = objectMapper.createObjectNode();

        HoaDon hoaDon = null;
        KhachHang khachHang = null;
        HoaDonChiTiet hoaDonChiTiet = null;
        SanPhamChiTiet sanPhamChiTiet = null;
        HoaDonChiTietResp hoaDonChiTietResp = objectMapper.readValue(req.getInputStream(),
                new TypeReference<HoaDonChiTietResp>() {});

        try {
            if(hoaDonChiTietResp.getNameCustomer().trim().isEmpty() ||
                    hoaDonChiTietResp.getAddress().trim().isEmpty() ){
                System.err.println("Dữ liệu không hợp lệ!!!");
                return;
            }

            for(KhachHang item : khachHangRepository.findAll()){
                if(item.getSoDienThoai().trim().equals(hoaDonChiTietResp.getNumberPhone().trim())){
                    khachHang = khachHangRepository.findById(item.getId());
                    break;
                }
            }

            if(khachHang == null) {
                khachHang = new KhachHang();
                khachHang.setHoTen(hoaDonChiTietResp.getNameCustomer());
                khachHang.setSoDienThoai(hoaDonChiTietResp.getNumberPhone());
                khachHang.setDiaChi(hoaDonChiTietResp.getAddress());
                khachHang.setTrangThai("Active");
                khachHangRepository.save(khachHang);
            }

            if(khachHang != null){
                hoaDon = new HoaDon();
                hoaDon.setKhachHang(khachHangRepository.findById(khachHang.getId()));
                hoaDon.setTrangThai("Processing");
                hoaDon.setDiaChi(hoaDonChiTietResp.getAddress());
                hoaDon.setSoDienThoai(hoaDonChiTietResp.getNumberPhone());
                hoaDonRepository.save(hoaDon);
            }

            if(hoaDon != null){
                for(CartResp i : hoaDonChiTietResp.getCartItems()){
                    hoaDonChiTiet = new HoaDonChiTiet();
                    sanPhamChiTiet = sanPhamChiTietRepository.findByCart(i.getIdSanPham(),i.getIdMau(),i.getIdSize());
                    hoaDonChiTiet.setHoaDon(hoaDon);
                    hoaDonChiTiet.setSanPhamChiTiet(sanPhamChiTiet);
                    hoaDonChiTiet.setSoLuongMua(i.getSoLuong());
                    hoaDonChiTiet.setGiaBan(i.getGiaBan());
                    hoaDonChiTiet.setTongTien(i.getGiaBan().multiply(BigDecimal.valueOf(i.getSoLuong())));
                    hoaDonChiTiet.setTrangThai("Processing");
                    hoaDonChiTietRepository.save(hoaDonChiTiet);


                    sanPhamChiTiet.setSoLuongTon(sanPhamChiTiet.getSoLuongTon() - i.getSoLuong());
                    sanPhamChiTietRepository.save(sanPhamChiTiet);
                }
            }
            responseNode.put("url", "/product/pay/success");
        } catch (Exception e){
            e.printStackTrace();
            responseNode.put("url", "/product/pay/fail");
        }

        resp.setContentType("application/json");
        resp.getWriter().write(responseNode.toString());

    }
}
