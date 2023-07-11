package com.example.demo.service;


import com.example.demo.model.ChiTietSanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ChiTietSpService {

    public Page<ChiTietSanPham> getAll(Pageable pageable);
    public ChiTietSanPham getOne(UUID id);
    public void add(ChiTietSanPham chiTietSanPham);
    public void delete(UUID id);
    public void update(ChiTietSanPham chiTietSanPham);
    public List<ChiTietSanPham> getChiTiet();
    public List<ChiTietSanPham> search(String ten);
    public ChiTietSanPham thanhToan(UUID id);
}
