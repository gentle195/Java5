package com.example.demo.model;


import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Table(name = "hoa_don_chi_tiet")
@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class HoaDonChiTiet {

    @EmbeddedId
    private IdChiTiet id;
    @Column(name = "so_luong")
    private int soLuong;

    @Column(name = "don_gia")
    private BigDecimal donGia;


}
