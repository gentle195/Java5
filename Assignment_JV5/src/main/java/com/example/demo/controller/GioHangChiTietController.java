package com.example.demo.controller;


import com.example.demo.model.ChiTietSanPham;
import com.example.demo.model.GioHang;
import com.example.demo.model.GioHangChiTiet;
import com.example.demo.repository.GioHangChiTietRepository;
import com.example.demo.service.ChiTietSpService;
import com.example.demo.service.GioHangChiTietService;
import com.example.demo.service.GioHangService;
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
@RequestMapping("/gio-hang-chi-tiet")
public class GioHangChiTietController {

    @Autowired
    private GioHangChiTietService gioHangChiTietService;
    @Autowired
    private GioHangService gioHangService;
    @Autowired
    private ChiTietSpService chiTietSpService;

    @GetMapping("hien-thi")
    public String hienThi(Model model, @ModelAttribute("gioHangChiTiet") GioHangChiTiet gioHangChiTiet,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<GioHangChiTiet> page = gioHangChiTietService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());

        return "giohangchitiet";
    }

    @PostMapping("add-gio-hang-chi-tiet")
    public String addChiTietSanPham(Model model, @ModelAttribute("gioHangChiTiet") GioHangChiTiet gioHangChiTiet, @RequestParam("pageNum") Optional<Integer> pageNum,
                                    @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        gioHangChiTietService.add(gioHangChiTiet);
//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<GioHangChiTiet> page = gioHangChiTietService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/gio-hang-chi-tiet/hien-thi";
    }

    @PostMapping("/update-gio-hang-chi-tiet/{id1}/{id2}")
    public String updateChiTietSanPham(Model model, @PathVariable("id1") UUID id1, @PathVariable("id2") UUID id2, @ModelAttribute("gioHangChiTiet") GioHangChiTiet gioHangChiTiet, @RequestParam("pageNum") Optional<Integer> pageNum,
                                       @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        GioHangChiTiet sp = gioHangChiTietService.getOne(id1, id2);
        sp.setDonGia(gioHangChiTiet.getDonGia());
        sp.setDonGiaKhiGiam(gioHangChiTiet.getDonGiaKhiGiam());
        sp.setSoLuong(gioHangChiTiet.getSoLuong());
        sp.getId().setGioHang(gioHangChiTiet.getId().getGioHang());
        sp.getId().setChiTietSanPham(gioHangChiTiet.getId().getChiTietSanPham());
        gioHangChiTietService.update(sp);
//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<GioHangChiTiet> page = gioHangChiTietService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/gio-hang-chi-tiet/hien-thi";
    }

    @GetMapping("/view-update-gio-hang-chi-tiet/{id1}/{id2}")
    public String viewUpdate(Model model, @PathVariable("id1") UUID id1, @PathVariable("id2") UUID id2, @ModelAttribute("gioHangChiTiet") GioHangChiTiet gioHangChiTiet) {
        GioHangChiTiet sp = gioHangChiTietService.getOne(id1, id2);
        model.addAttribute("gioHangChiTiet", sp);
        return "updategiohangchitiet";
    }

    @GetMapping("/detail-gio-hang-chi-tiet/{id1}/{id2}")
    public String detail(Model model, @PathVariable("id1") UUID id1, @PathVariable("id2") UUID id2, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("gioHangChiTiet") GioHangChiTiet gioHangChiTiet) {
        GioHangChiTiet sp = gioHangChiTietService.getOne(id1, id2);
        model.addAttribute("gioHangChiTiet", sp);
//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<ChiTietSanPham> page = chiTietSpService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "detailgiohangchitiet";
    }

    @GetMapping("/remove-gio-hang-chi-tiet/{id1}/{id2}")
    public String delete(Model model, @PathVariable("id1") UUID id1, @PathVariable("id2") UUID id2, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("gioHangChiTiet") GioHangChiTiet gioHangChiTiet) {
        gioHangChiTietService.delete(id1, id2);
//        GioHangChiTiet gh=gioHangChiTietService.getOne(id1,id2);
//        gioHangChiTietService.delete(gh);
//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<ChiTietSanPham> page = chiTietSpService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/gio-hang-chi-tiet/hien-thi";
    }

    @ModelAttribute("gioHang")
    public List<GioHang> getGh() {
        return gioHangService.getTen();
    }

    @ModelAttribute("chiTietSanPham")
    public List<ChiTietSanPham> getCt() {
        return chiTietSpService.getChiTiet();
    }

}
