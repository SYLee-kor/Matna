package com.kosta.matna.controller.item;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.matna.service.item.ItemService;

@Controller
public class ItemController {
	
	@Inject
	private ItemService service;
	
	@RequestMapping("/itemlistall")
	public String listall(Model model) { 
			try {
				model.addAttribute("list", service.listAll());
			} catch (Exception e) {
				e.printStackTrace();
			}
		return "test/list";
	}
	
	@RequestMapping("/itemdetail")
	public String detail(Model model){//, int no){ 아직 뷰가없어서 no값 못받음
		try {
			model.addAttribute("detail", service.read(3));//service.read(no));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test/detail";
	}
}
