package com.example.demo.service;

import com.example.demo.model.HoaDonChiTiet;
import com.example.demo.model.HoaDonChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public interface HoaDonChiTietService {

    public Page<HoaDonChiTiet> getAll(Pageable pageable);
    public HoaDonChiTiet getOne(UUID id1, UUID id2);
    public List<HoaDonChiTiet> list(List<HoaDonChiTiet> hd);
    public void add(HoaDonChiTiet hoaDonChiTiet);
    public void delete(UUID id1, UUID id2);
    public void update(HoaDonChiTiet hoaDonChiTiet);
}
