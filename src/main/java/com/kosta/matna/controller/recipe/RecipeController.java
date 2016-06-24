package com.kosta.matna.controller.recipe;

import java.io.File;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matna.domain.recipe.Criteria;
import com.kosta.matna.domain.recipe.PageMaker;
import com.kosta.matna.domain.recipe.RecipeVO;
import com.kosta.matna.service.recipe.RecipeService;

@RequestMapping("/recipe/")
@Controller
public class RecipeController {
	
	@Inject
	RecipeService service;
	
	String uploadPath;
	
	// # ����� ��ġ ����ֱ�.
	private String path = "/main/body/recipe/"; // # WEB-INF/views/ {path} 
	
	@RequestMapping(value="regist",method=RequestMethod.GET)
	public String registrecipe(@ModelAttribute("pageType") String pageType, Model model
			, @ModelAttribute("tabType") String tabType, @ModelAttribute("page") String page){
		model.addAttribute("action", "regist");
		return path+"regist";
	}

	@RequestMapping(value="regist",method=RequestMethod.POST)
	public String registrecipe(RecipeVO recipe, RedirectAttributes rttr, HttpSession session
			, String pageType, String page, MultipartFile file){
		try {
			// # ������ �� ���� ��� ����Ʈ �̹��� ����!!
			/*Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*title=[\"']?([^>\"']+)[\"']?[^>]*");
			Matcher match = pattern.matcher(recipe.getContent());
			String imgTag = "";
			if (match.find())imgTag = match.group(0);
			String photo = imgTag+" width=\"150\" height=\"90\">";
			photo = (imgTag.equals("")) ? "����" : photo;*/
			
			// # ���� ��� 
//			recipe.setPhoto(photo);
			if(file!=null) {
				uploadPath = session.getServletContext().getRealPath("/resource/recipe_images");
				String photoName = uploadFile(file.getOriginalFilename(), file.getBytes());
				recipe.setPhoto(photoName);
			}else
				recipe.setPhoto("����");
			if(service.registRecipe(recipe))
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("pageType", pageType);
			rttr.addAttribute("page", 1);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "redirect:/recipe/list";
	}
	
	@RequestMapping(value="modify",method=RequestMethod.GET)
	public String modifyrecipe(int no, Model model
			, String pageType, String tabType, String page){
		try {
			RecipeVO recipe = service.readRecipe(no);
			model.addAttribute("recipe", recipe);
			model.addAttribute("action", "modify");
			model.addAttribute("page", page);
			model.addAttribute("pageType", pageType);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return path+"regist";
	}

	@RequestMapping(value="modify",method=RequestMethod.POST)
	public String modifyrecipe(RecipeVO recipe, RedirectAttributes rttr, HttpSession session
			, String pageType,  String page, MultipartFile file){
		System.out.println("recipe_modify ���� [page : "+page+" / pageType : "+pageType);
		try {

			// # ������ �� ���� ��� ����Ʈ �̹��� ����!!
			/*Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*title=[\"']?([^>\"']+)[\"']?[^>]*");
			Matcher match = pattern.matcher(recipe.getContent());
			String imgTag = "";
			if (match.find())imgTag = match.group(0);
			String photo = imgTag+" width=\"150\" height=\"90\">";
			photo = (imgTag.equals("")) ? "����" : photo;
			recipe.setPhoto(photo);*/
			
			// # ���� ����
			uploadPath = session.getServletContext().getRealPath("/resource/recipe_images");
			if( file != null ){
				String photoName = uploadFile(file.getOriginalFilename(), file.getBytes());
				recipe.setPhoto(photoName);
			}
			
			if(service.modifyRecipe(recipe))
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("pageType",pageType);
			rttr.addAttribute("page",page);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "redirect:/recipe/list";
	}
	
	@RequestMapping("read")
	public String readrecipe(int no,Model model, @ModelAttribute("pageType") String pageType
			, @ModelAttribute("tabType") String tabType, @ModelAttribute("page") String page){
		try {
			RecipeVO recipe = service.readRecipe(no);
			String titles[] = {"���","����","���̵�","���� �ð�"};
			String romeNum[] = {"i","ii","iii","iv"};
			model.addAttribute( "titles", titles );
			model.addAttribute( "recipe", recipe );
			model.addAttribute( "romeNum", romeNum );
			
			if(recipe != null){
				String values[] = {recipe.getIngredient(),recipe.getPrice(),recipe.getDifficulty(),recipe.getTime()};
				model.addAttribute( "values", values );
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return path+"content";
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	public String removerecipe(int no, RedirectAttributes rttr
			, String pageType, String page){
		try {
			if(service.removeRecipe(no))
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("pageType", pageType);
			rttr.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "redirect:/recipe/list";
	}
	
	@RequestMapping("list") 
	public String listrecipe(Model model, String pageType
			, Criteria cri){
		try {
		pageType = ( pageType == null ) ? "recipe" : pageType;
		List<RecipeVO> list = 
				service.readList(pageType, new RowBounds(cri.getPageStart(),cri.getPerPageNum()));
		PageMaker pageMaker = new PageMaker(cri, service.getTotalCount());
		model.addAttribute("page", cri.getPage());
		model.addAttribute("pageType", pageType);
		model.addAttribute("recipeList", list);
		model.addAttribute("pageMaker", pageMaker);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return path+"list";
	} // # list�������� ���� ���� �޼ҵ�
	

	private String uploadFile(String photoName, byte[] fileData)throws Exception{ //��ǰ UID_��ǰ�� ����
		UUID uid=UUID.randomUUID();
		String savedName = uid.toString()+"_"+photoName;
		File target = new File(uploadPath,savedName); 
		FileCopyUtils.copy(fileData, target);
		return "<img src='/matna/resource/recipe_images/"+savedName+"'>";
	}
}
