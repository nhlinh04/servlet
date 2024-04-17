package com.example.assigment2_crud.model.resp;

import lombok.Data;

import java.util.List;

@Data
public class HoaDonChiTietResp {
    private String nameCustomer;
    private String numberPhone;
    private String address;
    private List<CartResp> cartItems;
}
