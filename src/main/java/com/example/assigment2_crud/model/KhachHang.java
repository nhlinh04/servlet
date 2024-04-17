package com.example.assigment2_crud.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Entity
@Table(name = "khach_hang")
public class KhachHang extends BaseEntity{

    @Column(name = "ho_ten")
    private String hoTen;

    @Column(name = "dia_chi")
    private String diaChi;

    @Column(name = "sdt", length = 20)
    private String soDienThoai;

    @OneToMany(mappedBy = "khachHang", fetch = FetchType.EAGER)
    private List<HoaDon> hoaDons;

}
