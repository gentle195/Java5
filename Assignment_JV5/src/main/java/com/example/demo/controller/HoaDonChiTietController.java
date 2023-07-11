package com.example.demo.controller;


import com.example.demo.model.ChiTietSanPham;
import com.example.demo.model.HoaDonChiTiet;
import com.example.demo.model.HoaDon;
import com.example.demo.service.ChiTietSpService;
import com.example.demo.service.HoaDonChiTietService;
import com.example.demo.service.HoaDonService;
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
@RequestMapping("/hoa-don-chi-tiet")
public class HoaDonChiTietController {

    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;

    @Autowired
    private HoaDonService hoaDonService;
    @Autowired
    private ChiTietSpService chiTietSpService;

    @GetMapping("hien-thi")
    public String hienThi(Model model, @ModelAttribute("hoaDonChiTiet") HoaDonChiTiet hoaDonChiTiet,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<HoaDonChiTiet> page = hoaDonChiTietService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());

        return "hoadonchitiet";
    }

    @PostMapping("add-hoa-don-chi-tiet")
    public String addChiTietSanPham(Model model, @ModelAttribute("hoaDonChiTiet") HoaDonChiTiet hoaDonChiTiet, @RequestParam("pageNum") Optional<Integer> pageNum,
                                    @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        hoaDonChiTietService.add(hoaDonChiTiet);
//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<HoaDonChiTiet> page = hoaDonChiTietService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/hoa-don-chi-tiet/hien-thi";
    }

    @PostMapping("/update-hoa-don-chi-tiet/{id1}/{id2}")
    public String updateChiTietSanPham(Model model, @PathVariable("id1") UUID id1, @PathVariable("id2") UUID id2, @ModelAttribute("hoaDonChiTiet") HoaDonChiTiet hoaDonChiTiet, @RequestParam("pageNum") Optional<Integer> pageNum,
                                       @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        HoaDonChiTiet sp = hoaDonChiTietService.getOne(id1, id2);
        sp.setDonGia(hoaDonChiTiet.getDonGia());
        sp.setSoLuong(hoaDonChiTiet.getSoLuong());
        sp.getId().setHoaDon(hoaDonChiTiet.getId().getHoaDon());
        sp.getId().setChiTietSanPham(hoaDonChiTiet.getId().getChiTietSanPham());
        hoaDonChiTietService.update(sp);
//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<HoaDonChiTiet> page = hoaDonChiTietService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/hoa-don-chi-tiet/hien-thi";
    }

    @GetMapping("/view-update-hoa-don-chi-tiet/{id1}/{id2}")
    public String viewUpdate(Model model, @PathVariable("id1") UUID id1, @PathVariable("id2") UUID id2, @ModelAttribute("hoaDonChiTiet") HoaDonChiTiet hoaDonChiTiet) {
        HoaDonChiTiet sp = hoaDonChiTietService.getOne(id1, id2);
        model.addAttribute("hoaDonChiTiet", sp);
        return "updatehoadonchitiet";
    }

    @GetMapping("/detail-hoa-don-chi-tiet/{id1}/{id2}")
    public String detail(Model model, @PathVariable("id1") UUID id1, @PathVariable("id2") UUID id2, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("hoaDonChiTiet") HoaDonChiTiet hoaDonChiTiet) {
        HoaDonChiTiet sp = hoaDonChiTietService.getOne(id1, id2);
        model.addAttribute("hoaDonChiTiet", sp);
//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<ChiTietSanPham> page = chiTietSpService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "detailhoadonchitiet";
    }

    @GetMapping("/remove-hoa-don-chi-tiet/{id1}/{id2}")
    public String delete(Model model, @PathVariable("id1") UUID id1, @PathVariable("id2") UUID id2, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("hoaDonChiTiet") HoaDonChiTiet hoaDonChiTiet) {
        hoaDonChiTietService.delete(id1, id2);
//        HoaDonChiTiet gh=hoaDonChiTietService.getOne(id1,id2);
//        hoaDonChiTietService.delete(gh);
//        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<ChiTietSanPham> page = chiTietSpService.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/hoa-don-chi-tiet/hien-thi";
    }

    @ModelAttribute("hoaDon")
    public List<HoaDon> getGh() {
        return hoaDonService.getTen();
    }

    @ModelAttribute("chiTietSanPham")
    public List<ChiTietSanPham> getCt() {
        return chiTietSpService.getChiTiet();
    }
}
