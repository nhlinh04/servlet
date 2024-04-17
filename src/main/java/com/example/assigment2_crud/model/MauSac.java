package com.example.assigment2_crud.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Entity
@Table(name = "mau_sac")
public class MauSac extends BaseEntity{

    @Column(name = "ma_mau")
    private String maMau;

    @Column(name = "ten_mau")
    private String tenMau;

    @OneToMany(mappedBy = "mauSac", fetch = FetchType.EAGER)
    private List<SanPhamChiTiet> sanPhamChiTiets;

}
