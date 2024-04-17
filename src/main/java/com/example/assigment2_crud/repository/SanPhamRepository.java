package com.example.assigment2_crud.repository;

import com.example.assigment2_crud.model.SanPham;

public class SanPhamRepository extends BaseRepository<SanPham, Integer> {
    @Override
    protected Class<SanPham> getClassType() {
        return SanPham.class;
    }
}
