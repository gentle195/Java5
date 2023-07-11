package com.example.demo.service;

import com.example.demo.model.GioHang;
import com.example.demo.model.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public interface HoaDonService {

    public Page<HoaDon> getAll(Pageable pageable);
    public HoaDon getOne(UUID id);
    public void add(HoaDon gioHang);
    public void delete(UUID id);
    public void update(HoaDon gioHang);
    public void update1(UUID id);
    public void update2(UUID id);
    public List<HoaDon> getTen();
}
