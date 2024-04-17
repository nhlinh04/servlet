package com.example.assigment2_crud.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import java.util.List;


@Data
@Entity
@Table(name = "san_pham")
public class SanPham extends BaseEntity{

    @Column(name = "ma_san_pham")
    private String maSanPham;

    @Column(name = "ten_san_pham")
    private String tenSanPham;

    @ManyToOne
    @JoinColumn(name = "id_danh_muc")
    private DanhMuc danhMuc;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.EAGER)
    private List<SanPhamChiTiet> sanPhamChiTiets;
}
