package com.example.assigment2_crud.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Entity
@Table(name = "danh_muc")
public class DanhMuc extends BaseEntity{

    @Column(name = "ma_danh_muc")
    private String maDanhMuc;

    @Column(name = "ten_danh_muc")
    private String tenDanhMuc;

    @OneToMany(mappedBy = "danhMuc", fetch = FetchType.EAGER)
    private List<SanPham> sanPhams;
}
