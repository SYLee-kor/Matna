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

import com.kosta.matna.domain.admin.AD;
import com.kosta.matna.domain.admin.PageMaker;
import com.kosta.matna.domain.admin.SearchKeyWord;
import com.kosta.matna.service.admin.AdService;

@Controller
@RequestMapping("/admin/AD")  
public class ADController {
	
	private static final Logger logger
    = LoggerFactory.getLogger(ADController.class);
 
	@Inject
	private AdService service;
	String uploadPath;
	
	@RequestMapping(value="/change", method = RequestMethod.POST) //������ �߼��� �ֹ���� 
	public String setAD(Model model, int no, HttpSession session) throws Exception{
		
			AD ad = service.selectView(no);

			// # ad가 null일 경우 처리..
			if( ad == null ) {
				// # 등록된 광고가 없으므로 임의의 값 설정..
				ad = new AD(0, "", "광고 없음", "광고를 등록해주세요.", "");
			}
				
			model.addAttribute("total", service.total());
			model.addAttribute("AD",ad);
		
		
		return "main/header/ad/setAD";
	}
	
	@RequestMapping("/list") //������ �߼��� �ֹ���� 
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
			System.out.println("������: "+imgName);
			
			if(imgName.equals("")){
				service.insertAD(ad);
			}else{
				if(!new File(uploadPath).exists()){
					new File(uploadPath).mkdir();
					System.out.println("��������");
				}
				String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
				ad.setPhoto(savedName);
			//System.out.println("���� �����̸� : "+file.getOriginalFilename()); Ȯ����ó�� ����/jpg,png,gif
			//System.out.println("���� Ȯ���ڸ�: "+fileName.substring(fileName.lastIndexOf(".")+1));
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
			System.out.println("������: "+imgName);
			
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
	public @ResponseBody void delete(HttpSession session,int no)throws Exception{
		
		if(new File(session.getServletContext().getRealPath("/resource/images/admin/ad/")+service.select(no).getPhoto()).delete()){
			System.out.println("���� ����");
		}else
			System.out.println("���� ����");
		
		service.deleteAD(no);
	}
	
	private String uploadFile(String photoName, byte[] fileData)throws Exception{ //��ǰ UID_��ǰ�� ����
		
		UUID uid=UUID.randomUUID();
		String savedName = uid.toString()+"_"+photoName;
		File target = new File(uploadPath,savedName); 
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
}
