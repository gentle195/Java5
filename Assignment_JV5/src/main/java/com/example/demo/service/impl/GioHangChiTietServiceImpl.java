package com.example.demo.service.impl;

import com.example.demo.model.ChiTietSanPham;
import com.example.demo.model.GioHangChiTiet;
import com.example.demo.model.KhachHang;
import com.example.demo.repository.GioHangChiTietRepository;
import com.example.demo.service.GioHangChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.UUID;

@Service
public class GioHangChiTietServiceImpl implements GioHangChiTietService {

    @Autowired
    GioHangChiTietRepository repository;


    @Override
    public Page<GioHangChiTiet> getAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public GioHangChiTiet getOne(UUID id1, UUID id2) {
        return repository.detail(id1, id2);
    }

    @Override
    public String findMa(UUID id) {
        return repository.findMa(id);
    }

    @Override
    public KhachHang findMaKh(String ma) {
        return repository.findMaKh(ma);
    }

    @Override
    public ArrayList<GioHangChiTiet> find(String ma) {
        return repository.find(ma);
    }

    @Override
    public UUID findId(UUID id) {
        return repository.findId(id);
    }

    @Override
    public void add(GioHangChiTiet gioHangChiTiet) {
        repository.save(gioHangChiTiet);
    }

    @Override
    public void delete(UUID id1,UUID id2) {
        repository.deleteGioHang(id1,id2);
    }

    @Override
    public void update(GioHangChiTiet gioHangChiTiet) {
        repository.save(gioHangChiTiet);
    }


}
