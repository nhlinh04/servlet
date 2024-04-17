package com.example.assigment2_crud.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Entity
@Table(name = "hoa_don")
public class HoaDon extends BaseEntity{

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_khach_hang")
    private KhachHang khachHang;

    @Column(name = "dia_chi")
    private String diaChi;

    @Column(name = "so_dien_thoai", length = 20)
    private String soDienThoai;

    @OneToMany(mappedBy = "hoaDon", fetch = FetchType.EAGER)
    private List<HoaDonChiTiet> hoaDonChiTiets;


}
