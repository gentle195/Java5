package com.example.demo.repository;

import com.example.demo.model.GioHang;
import com.example.demo.model.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, UUID> {
    @Query("select sp from HoaDon sp where sp.id=?1")
    HoaDon detail(UUID id);

    @Transactional
    @Modifying
    @Query("update HoaDon hd set hd.tinhTrang=0 where hd.id=?1")
    void update1(UUID id);

    @Transactional
    @Modifying
    @Query("update HoaDon hd set hd.tinhTrang=1 where hd.id=?1")
    void update2(UUID id);

    @Query("select sp from HoaDon  sp")
    Page<HoaDon> findAll(Pageable pageable);
}
