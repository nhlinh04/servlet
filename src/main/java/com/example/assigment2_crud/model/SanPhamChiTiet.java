package com.example.assigment2_crud.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

@Data
@Entity
@Table(name = "ctsp")
public class SanPhamChiTiet extends BaseEntity{

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_mau_sac")
    private MauSac mauSac;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_size")
    private Size size;

    @Column(name = "gia_ban", precision = 18, scale = 2)
    private BigDecimal giaBan;

    @Column(name = "so_luong_ton")
    private int soLuongTon;

    @OneToMany(mappedBy = "sanPhamChiTiet", fetch = FetchType.EAGER)
    private List<HoaDonChiTiet> hoaDonChiTiets;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_sp")
    private SanPham sanPham;
}
