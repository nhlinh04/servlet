package com.example.assigment2_crud.repository;

import com.example.assigment2_crud.model.HoaDon;

public class HoaDonRepository extends BaseRepository<HoaDon, Integer> {

    @Override
    protected Class<HoaDon> getClassType() {
        return HoaDon.class;
    }
}
