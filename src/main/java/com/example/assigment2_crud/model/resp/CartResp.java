package com.example.assigment2_crud.model.resp;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CartResp {
    private int idSanPham;
    private int idMau;
    private int idSize;
    private BigDecimal giaBan;
    private int soLuong;
}
