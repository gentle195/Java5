package com.example.demo.service.impl;


import com.example.demo.model.ChiTietSanPham;
import com.example.demo.repository.ChiTietSpRepository;
import com.example.demo.service.ChiTietSpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class ChiTietSpServiceImpl implements ChiTietSpService {

    @Autowired
    ChiTietSpRepository repository;

    @Override
    public Page<ChiTietSanPham> getAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public ChiTietSanPham getOne(UUID id) {
        return repository.detail(id);
    }

    @Override
    public void add(ChiTietSanPham chiTiet) {
        repository.save(chiTiet);
    }

    @Override
    public void delete(UUID chiTiet) {
        repository.deleteById(chiTiet);
    }

    @Override
    public void update(ChiTietSanPham chiTiet) {
        repository.save(chiTiet);
    }

    @Override
    public List<ChiTietSanPham> getChiTiet() {
        return repository.findAll();
    }

    @Override
    public List<ChiTietSanPham> search(String ten) {
        return repository.search(ten);
    }

    @Override
    public ChiTietSanPham thanhToan(UUID id) {
        return  repository.findById(id).orElse(null);
    }
}
