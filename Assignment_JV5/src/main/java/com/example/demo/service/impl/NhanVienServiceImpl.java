package com.example.demo.service.impl;

import com.example.demo.model.NhanVien;
import com.example.demo.repository.NhanVienRepository;
import com.example.demo.service.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class NhanVienServiceImpl implements NhanVienService {

    @Autowired
    NhanVienRepository repository;

    @Override
    public Page<NhanVien> getAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public NhanVien getOne(UUID id) {
        return repository.detail(id);
    }

    @Override
    public void add(NhanVien nhanVien) {
        repository.save(nhanVien);
    }

    @Override
    public void delete(UUID nhanVien) {
        repository.deleteById(nhanVien);
    }

    @Override
    public void update(NhanVien nhanVien) {
        repository.save(nhanVien);
    }

    @Override
    public List<NhanVien> search(String ten) {
        return repository.search(ten);
    }

    @Override
    public List<NhanVien> getTen() {
        return repository.findAll();
    }
}
