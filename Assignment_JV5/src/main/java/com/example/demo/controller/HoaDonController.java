package com.example.demo.controller;

import com.example.demo.model.HoaDon;
import com.example.demo.model.HoaDon;
import com.example.demo.model.KhachHang;
import com.example.demo.model.NhanVien;
import com.example.demo.repository.HoaDonRepository;
import com.example.demo.service.HoaDonService;
import com.example.demo.service.KhachHangService;
import com.example.demo.service.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/hoa-don")
public class HoaDonController {

    @Autowired
    private HoaDonService hoaDonService;
    @Autowired
    private NhanVienService nhanVienService;
    @Autowired
    private KhachHangService khachHangService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<HoaDon> page = hoaDonService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "hoadon";
    }

    @PostMapping("add-hoa-don")
    public String addHoaDon(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon, @RequestParam("pageNum") Optional<Integer> pageNum,
                            @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        hoaDonService.add(hoaDon);
//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<HoaDon> page = hoaDonService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/hoa-don/hien-thi";
    }

    @PostMapping("/update-hoa-don/{id}")
    public String updateHoaDon(Model model, @PathVariable("id") UUID id, @ModelAttribute("hoaDon") HoaDon hoaDon, @RequestParam("pageNum") Optional<Integer> pageNum,
                               @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        HoaDon sp = hoaDonService.getOne(id);
        sp.setKhachHang(hoaDon.getKhachHang());
        sp.setNgayTao(hoaDon.getNgayTao());
        sp.setNgayThanhToan(hoaDon.getNgayThanhToan());
        sp.setNhanVien(hoaDon.getNhanVien());
        sp.setTenNguoiNhan(hoaDon.getTenNguoiNhan());
        sp.setDiaChi(hoaDon.getDiaChi());
        sp.setMa(hoaDon.getMa());
        sp.setSdt(hoaDon.getSdt());
        sp.setTinhTrang(hoaDon.getTinhTrang());
        sp.setNgayNhan(hoaDon.getNgayNhan());
        sp.setNgayShip(hoaDon.getNgayShip());
        hoaDonService.update(sp);
//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<HoaDon> page = hoaDonService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/hoa-don/hien-thi";
    }

    @GetMapping("/remove-hoa-don/{id}")
    public String delete(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("hoaDon") HoaDon hoaDon) {
        hoaDonService.delete(id);
//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<HoaDon> page = hoaDonService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/hoa-don/hien-thi";
    }

    @GetMapping("/trang-thai-0/{id}")
    public String trangThai1(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                             @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("hoaDon") HoaDon hoaDon) {
        hoaDonService.update1(id);
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<HoaDon> page = hoaDonService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/hoa-don/hien-thi";
    }

    @GetMapping("/trang-thai-1/{id}")
    public String trangThai2(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                             @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("hoaDon") HoaDon hoaDon) {
        hoaDonService.update2(id);
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<HoaDon> page = hoaDonService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/hoa-don/hien-thi";
    }

    @GetMapping("/detail-hoa-don/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        HoaDon sp = hoaDonService.getOne(id);
        model.addAttribute("hoaDon", sp);
//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<HoaDon> page = hoaDonService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "hoadon";
    }

    @GetMapping("/view-update-hoa-don/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id) {
        HoaDon sp = hoaDonService.getOne(id);
        model.addAttribute("hoaDon", sp);
        return "updatehoadon";
    }

    @ModelAttribute("nhanVien")
    public List<NhanVien> hienThiNv() {
        return nhanVienService.getTen();
    }

    @ModelAttribute("khachHang")
    public List<KhachHang> hienThiKh() {
        return khachHangService.getTen();
    }
}
