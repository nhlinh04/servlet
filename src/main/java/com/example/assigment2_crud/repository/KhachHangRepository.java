package com.example.assigment2_crud.repository;

import com.example.assigment2_crud.model.KhachHang;

public class KhachHangRepository extends BaseRepository<KhachHang, Integer> {
    @Override
    protected Class<KhachHang> getClassType() {
        return KhachHang.class;
    }
}
