package com.example.assigment2_crud.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Entity
@Table(name = "size")
public class Size extends BaseEntity{

    @Column(name = "ma_size")
    private String maSize;

    @Column(name = "ten_size")
    private String tenSize;

    @OneToMany(mappedBy = "size", fetch = FetchType.EAGER)
    private List<SanPhamChiTiet> sanPhamChiTiets;
}
