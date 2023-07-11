package com.example.demo.service;

import com.example.demo.model.ChiTietSanPham;
import com.example.demo.model.GioHangChiTiet;
import com.example.demo.model.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.UUID;

public interface GioHangChiTietService {

    public Page<GioHangChiTiet> getAll(Pageable pageable);
    public GioHangChiTiet getOne(UUID id1,UUID id2);
    public String findMa(UUID id);
    public KhachHang findMaKh(String ma);
    public ArrayList<GioHangChiTiet> find(String ma);
    public UUID findId(UUID id);
    public void add(GioHangChiTiet gioHangChiTiet);
    public void delete(UUID id1, UUID id2);
    public void update(GioHangChiTiet gioHangChiTiet);
}
