package com.kosta.matna.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.matna.controller.community.CommunityController;
import com.kosta.matna.domain.admin.AD;
import com.kosta.matna.domain.admin.PageMaker;
import com.kosta.matna.domain.admin.SearchKeyWord;
import com.kosta.matna.service.admin.AdService;

@Controller
@RequestMapping("/admin/AD")
public class ADController {
	
	private static final Logger logger
    = LoggerFactory.getLogger(CommunityController.class);

	@Inject
	private AdService service;
	String uploadPath;
	
	@RequestMapping(value="/change", method = RequestMethod.POST) //관리자 발송전 주문취소 
	public String setAD(Model model, int no) throws Exception{
		
		logger.info("광고 변경");
		
			AD ad = service.selectView(no);
			model.addAttribute("total", service.total());
			model.addAttribute("AD",ad);
			System.out.println("광고번호 : " + ad.getNo());
		
		
		return "main/header/ad/setAD";
	}
	
	@RequestMapping("/list") //관리자 발송전 주문취소 
	public String list(Model model, SearchKeyWord cri) throws Exception{
		model.addAttribute("ad", service.selectList(cri));
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.listCount(cri));
		
		model.addAttribute("pageMaker",maker);
		return "main/admin/ad/list";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(int no, Model model,@ModelAttribute("cri") SearchKeyWord cri)throws Exception{
		logger.info("AD read");
		AD ad = service.select(no);
		model.addAttribute("AD", ad);		
		return "main/admin/ad/info";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGet()throws Exception{
		
		return "main/admin/ad/insert";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(HttpSession session,MultipartFile file, AD ad)throws Exception{
		logger.info("AD insert");
		logger.info("AD::"+ad); 
		//String uploadPath = request.getSession().getServletContext().getRealPath("/img");
		uploadPath = session.getServletContext().getRealPath("/resource/images/admin/ad");
		
		try {
			String imgName = file.getOriginalFilename();
			System.out.println("사진값: "+imgName);
			
			if(imgName.equals("")){
				service.insertAD(ad);
			}else{
				String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
				String fileName = file.getName();
				ad.setPhoto(savedName);
			//System.out.println("사진 원래이름 : "+file.getOriginalFilename()); 확장자처리 안함/jpg,png,gif
			//System.out.println("사진 확장자명: "+fileName.substring(fileName.lastIndexOf(".")+1));
				service.insertAD(ad);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/admin/AD/list";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(HttpSession session,MultipartFile file, AD ad,@ModelAttribute("cri") SearchKeyWord cri){
		logger.info("AD update");
		logger.info("AD::"+ad); 
		//String uploadPath = request.getSession().getServletContext().getRealPath("/img");
		uploadPath = session.getServletContext().getRealPath("/resource/images/admin/ad");
		
		try {
			String imgName = file.getOriginalFilename();
			System.out.println("사진값: "+imgName);
			
			if(imgName.equals("")){
				service.updateAD(ad);
			}else{
				String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
				String fileName = file.getName();
				ad.setPhoto(savedName);
				service.updateAD(ad);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/admin/AD/list?page="+cri.getPage()+"&perPageNum="+cri.getPerPageNum()+"&searchType="+cri.getSearchType()+"&keyword="+cri.getKeyword();
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public @ResponseBody void delete(int no)throws Exception{
		service.deleteAD(no);
	}
	
	private String uploadFile(String photoName, byte[] fileData)throws Exception{ //상품 UID_상품명 생성
		
		UUID uid=UUID.randomUUID();
		String savedName = uid.toString()+"_"+photoName;
		File target = new File(uploadPath,savedName); 
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
}
