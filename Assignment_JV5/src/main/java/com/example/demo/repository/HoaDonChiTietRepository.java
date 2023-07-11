package com.example.demo.repository;

import com.example.demo.model.HoaDonChiTiet;
import com.example.demo.model.HoaDonChiTiet;
import com.example.demo.model.IdChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, IdChiTiet> {
    @Query("select sp from HoaDonChiTiet  sp")
    Page<HoaDonChiTiet> findAll(Pageable pageable);

    @Query("select sp from HoaDonChiTiet sp where sp.id.hoaDon.id=?1 and sp.id.chiTietSanPham.id=?2")
    HoaDonChiTiet detail(UUID id1, UUID id2);

    @Transactional
    @Modifying
    @Query("delete from HoaDonChiTiet sp where sp.id.hoaDon.id=?1 and sp.id.chiTietSanPham.id=?2")
    void deleteHoaDon(UUID id1, UUID id2);
}
