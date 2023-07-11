package com.example.demo.repository;

import com.example.demo.model.ChiTietSanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ChiTietSpRepository extends JpaRepository<ChiTietSanPham, UUID> {
    @Query("select sp from ChiTietSanPham sp where sp.id=?1")
    ChiTietSanPham detail(UUID id);

    @Query("select sp from ChiTietSanPham  sp")
    Page<ChiTietSanPham> findAll(Pageable pageable);

    @Query("select ct.id, sp.ten from ChiTietSanPham  ct left join SanPham sp on ct.sanPham.id=sp.id")
    List<ChiTietSanPham> getTen();

    @Query("select ct from ChiTietSanPham  ct left join SanPham sp on ct.sanPham.id=sp.id where sp.ten like %?1%")
    List<ChiTietSanPham> search(String ten);
}
