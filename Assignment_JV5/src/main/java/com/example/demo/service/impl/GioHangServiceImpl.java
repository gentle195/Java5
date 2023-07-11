package com.example.demo.service.impl;

import com.example.demo.model.GioHang;
import com.example.demo.repository.GioHangRepository;
import com.example.demo.service.GioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class GioHangServiceImpl implements GioHangService {

    @Autowired
    GioHangRepository repository;


    @Override
    public Page<GioHang> getAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public GioHang getOne(UUID id) {
        return repository.detail(id);
    }

    @Override
    public ArrayList<GioHang> getMa() {
        return (ArrayList<GioHang>) repository.findAll();
    }

    @Override
    public void add(GioHang gioHang) {
        repository.save(gioHang);
    }

    @Override
    public void delete(UUID id) {
        repository.deleteById(id);
    }

    @Override
    public void update(GioHang gioHang) {
        repository.save(gioHang);
    }

    @Override
    public List<GioHang> getTen() {
        return repository.findAll();
    }
}
