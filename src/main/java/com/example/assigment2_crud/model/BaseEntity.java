package com.example.assigment2_crud.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@MappedSuperclass
public class BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "trang_thai", length = 50)
    private String trangThai ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "ngay_sua")
    private Date ngaySua;

    @PrePersist
    public void setNgayTao() {
        this.ngayTao = new Date();
    }

    @PreUpdate
    public void setNgaySua() {
        this.ngaySua = new Date();
    }
}
