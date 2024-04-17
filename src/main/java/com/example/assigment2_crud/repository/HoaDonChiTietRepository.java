package com.example.assigment2_crud.repository;

import com.example.assigment2_crud.model.HoaDonChiTiet;

public class HoaDonChiTietRepository extends BaseRepository<HoaDonChiTiet,Integer> {
    @Override
    protected Class<HoaDonChiTiet> getClassType() {
        return HoaDonChiTiet.class;
    }
}
