package com.example.demo.service;

import com.example.demo.model.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public interface KhachHangService {

    public Page<KhachHang> getAll(Pageable pageable);
    public KhachHang getOne(UUID id);
    public KhachHang khachHang(String ma);
    public void add(KhachHang khachHang);
    public void delete(UUID id);
    public void update(KhachHang khachHang);
    public List<KhachHang> search(String ten);
    public List<KhachHang> getTen();
}
