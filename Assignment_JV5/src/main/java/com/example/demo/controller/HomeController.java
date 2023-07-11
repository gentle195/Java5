package com.example.demo.controller;

import com.example.demo.model.Cart;
import com.example.demo.model.ChiTietSanPham;
import com.example.demo.model.GioHang;
import com.example.demo.model.GioHangChiTiet;
import com.example.demo.model.HoaDon;
import com.example.demo.model.HoaDonChiTiet;
import com.example.demo.model.IdChiTiet;
import com.example.demo.model.IdGioHang;
import com.example.demo.model.ItemGioHang;
import com.example.demo.model.KhachHang;
import com.example.demo.model.NhanVien;
import com.example.demo.repository.ChiTietSpRepository;
import com.example.demo.service.ChiTietSpService;
import com.example.demo.service.GioHangChiTietService;
import com.example.demo.service.GioHangService;
import com.example.demo.service.HoaDonChiTietService;
import com.example.demo.service.HoaDonService;
import com.example.demo.service.KhachHangService;
import com.example.demo.service.NhanVienService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.UUID;

@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private HttpSession httpSession;
    @Autowired
    private ChiTietSpService chiTietSpService;
    @Autowired
    private ChiTietSpRepository chiTietSpRepository;
    @Autowired
    private GioHangChiTietService gioHangChiTietService;
    @Autowired
    private GioHangService gioHangService;
    @Autowired
    private KhachHangService khachHangService;
    @Autowired
    private HoaDonService hoaDonService;
    @Autowired
    private NhanVienService nhanVienService;
    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "9") Integer pageSize
    ) {
//        ArrayList<ChiTietSanPham> list= (ArrayList<ChiTietSanPham>) chiTietSpService.getChiTiet();
        Pageable page = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<ChiTietSanPham> list = chiTietSpService.getAll(page);
        model.addAttribute("list", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        model.addAttribute("page", list.getNumber());
        return "home";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") UUID id) {
        ChiTietSanPham ct = chiTietSpService.getOne(id);
        model.addAttribute("chiTiet", ct);
        return "detail";
    }

    @GetMapping("/add")
    public String add(@RequestParam("id") UUID id) {
        Optional<ChiTietSanPham> list = chiTietSpRepository.findById(id);
        ArrayList<GioHang> listt = gioHangService.getMa();
        String ma = gioHangChiTietService.findMa(listt.get(0).getKhachHang().getId());
        ItemGioHang itemGioHang = new ItemGioHang(list.get().getId(),
                list.get().getSanPham().getTen(),
                list.get().getMauSac().getTen(),
                list.get().getDongSanPham().getTen(),
                list.get().getNhaSanXuat().getTen(),
                1,
                list.get().getGiaBan());
        Cart cart = (Cart) httpSession.getAttribute(ma);
        if (cart == null) {
            Cart c = new Cart();
            ArrayList<ItemGioHang> listItem = new ArrayList<>();
            listItem.add(itemGioHang);
            c.setListGioHang(listItem);
            httpSession.setAttribute(ma, c);

        } else {
            Cart c = (Cart) httpSession.getAttribute(ma);
            ArrayList<ItemGioHang> listItem = c.getListGioHang();
            for (ItemGioHang i : listItem
            ) {
                if (i.getId().equals(id)) {
                    i.setSoLuong(itemGioHang.getSoLuong() + 1);
                    i.setGiaBan(list.get().getGiaBan().multiply(BigDecimal.valueOf(i.getSoLuong())));
                    return "redirect:/home/hien-thi";
                }
            }
            listItem.add(itemGioHang);
        }
        return "redirect:/home/hien-thi";
    }

    @PostMapping("/addDetail/{id}")
    public String addDetail(@PathVariable("id") UUID id, @RequestParam("soLuong") String soLuong) {
        Integer sl = Integer.valueOf(soLuong);
        Optional<ChiTietSanPham> list = chiTietSpRepository.findById(id);
        ArrayList<GioHang> listt = gioHangService.getMa();
        String ma = gioHangChiTietService.findMa(listt.get(0).getKhachHang().getId());
        ItemGioHang itemGioHang = new ItemGioHang(list.get().getId(),
                list.get().getSanPham().getTen(),
                list.get().getMauSac().getTen(),
                list.get().getDongSanPham().getTen(),
                list.get().getNhaSanXuat().getTen(),
                sl,
                list.get().getGiaBan());
        Cart cart = (Cart) httpSession.getAttribute(ma);
        if (cart == null) {
            Cart c = new Cart();
            ArrayList<ItemGioHang> listItem = new ArrayList<>();
            listItem.add(itemGioHang);
            c.setListGioHang(listItem);
            httpSession.setAttribute(ma, c);

        } else {
            Cart c = (Cart) httpSession.getAttribute(ma);
            ArrayList<ItemGioHang> listItem = c.getListGioHang();
            for (ItemGioHang i : listItem
            ) {
                if (i.getId().equals(id)) {
                    i.setSoLuong(itemGioHang.getSoLuong() + sl);
                    i.setGiaBan(list.get().getGiaBan().multiply(BigDecimal.valueOf(i.getSoLuong())));
                    return "redirect:/home/detail/{id}";
                }
            }
            listItem.add(itemGioHang);
        }
        return "redirect:/home/detail/{id}";
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @PathVariable("id") UUID id) {
        ArrayList<GioHang> listt = gioHangService.getMa();
        String ma = gioHangChiTietService.findMa(listt.get(0).getKhachHang().getId());
        Cart cart = (Cart) httpSession.getAttribute(ma);
        ArrayList<ItemGioHang> item = cart.getListGioHang();

        for (int i = 0; i < item.size(); i++) {
            if (item.get(i).getId().equals(id)) {
                item.remove(i);
            }
        }
        return "redirect:/home/cart";
    }

    @GetMapping("/cart")
    public String cart(Model model) {
        ArrayList<GioHang> listt = gioHangService.getMa();
        String ma = gioHangChiTietService.findMa(listt.get(0).getKhachHang().getId());
        Cart cart = (Cart) httpSession.getAttribute(ma);
        ArrayList<ItemGioHang> item = cart.getListGioHang();
        model.addAttribute("list", item);
        return "cart";
    }

    @PostMapping("/search")
    public String search(Model model, @RequestParam("ten") String ten) {
        ArrayList<ChiTietSanPham> list = (ArrayList<ChiTietSanPham>) chiTietSpService.search(ten);
        model.addAttribute("list", list);
        return "home";
    }

    @PostMapping("/thanh-toan")
    public String thanhToan() {
        ArrayList<NhanVien> list = (ArrayList<NhanVien>) nhanVienService.getTen();
        NhanVien nv = list.get(0);
        ArrayList<GioHang> listt = gioHangService.getMa();
        String ma = gioHangChiTietService.findMa(listt.get(0).getKhachHang().getId());
        KhachHang kh = gioHangChiTietService.findMaKh(ma);
        HoaDon hd = new HoaDon();
        for (int i = 0; i < 5 + 1; i++) {
            Random rdm = new Random();
            int rdmm = rdm.nextInt(10000) + 1;
            hd.setMa("HD" + rdmm);
        }
        Date ngayTao = new Date(System.currentTimeMillis());
        hd.setKhachHang(kh);
        hd.setNhanVien(nv);
        hd.setNgayTao(ngayTao);
        hd.setTinhTrang(0);
        hoaDonService.add(hd);

        Cart cart = (Cart) httpSession.getAttribute(ma);
        ArrayList<ItemGioHang> item = cart.getListGioHang();

        ArrayList<HoaDonChiTiet> listHdct = new ArrayList<>();
        for (ItemGioHang it : item
        ) {
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            ChiTietSanPham chiTietSanPham = chiTietSpService.thanhToan(it.getId());
            hoaDonChiTiet.setId(new IdChiTiet(hd, chiTietSanPham));
            hoaDonChiTiet.setDonGia(it.getGiaBan());
            hoaDonChiTiet.setSoLuong(it.getSoLuong());
            listHdct.add(hoaDonChiTiet);
            chiTietSanPham.setSoLuongTon(chiTietSanPham.getSoLuongTon() - it.getSoLuong());
            chiTietSpService.update(chiTietSanPham);
        }
        hoaDonChiTietService.list(listHdct);

        httpSession.removeAttribute(ma);
        return "redirect:/home/hien-thi";
    }
}
