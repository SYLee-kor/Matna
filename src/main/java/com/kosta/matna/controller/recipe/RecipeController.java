package com.kosta.matna.controller.recipe;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.junit.runner.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// # 뷰들의 위치 잡아주기.
	private String path = "/main/body/recipe/"; // # WEB-INF/views/ {path} 
	
	@RequestMapping(value="regist",method=RequestMethod.GET)
	public String registrecipe(@ModelAttribute("pageType") String pageType, Model model
			, @ModelAttribute("tabType") String tabType, @ModelAttribute("page") String page){
		model.addAttribute("action", "regist");
		return path+"book";
	}

	@RequestMapping(value="regist",method=RequestMethod.POST)
	public @ResponseBody String registrecipe(RecipeVO recipe, RedirectAttributes rttr, HttpSession session
			, String pageType, String page, MultipartFile file){
		System.out.println(recipe);
		try {
			if(file!=null) {
				uploadPath = session.getServletContext().getRealPath("/resource/images/recipe");
				String photoName = uploadFile(file.getOriginalFilename(), file.getBytes());
				recipe.setPhoto(photoName);
			}else
				recipe.setPhoto("포토");
			if(service.registRecipe(recipe))
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("pageType", pageType);
			rttr.addAttribute("page", 1);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
			//return "error";
		}
		return "success";
		//return "redirect:/recipe/list";
	}
	
	@RequestMapping(value="modify",method=RequestMethod.GET)
	public String modifyRecipe(int no, Model model
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
		return path+"book";
	}

	@RequestMapping(value="modify",method=RequestMethod.POST)
	public @ResponseBody String modifyRecipe(RecipeVO recipe, RedirectAttributes rttr, HttpSession session
			, String pageType,  String page, MultipartFile file){
		System.out.println("수정시 사진 값 : "+recipe.getPhoto());
		System.out.println("파일 사진이름  : "+file.getOriginalFilename());
		try {
			// # 사진 세팅
			uploadPath = session.getServletContext().getRealPath("/resource/images/recipe");
			if( file != null && file.getOriginalFilename().trim().length()!=0 ){
				System.out.println("modifyRecipe 사진 생성");
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
		return "success";
	}
	
	@RequestMapping("read")
	public String readrecipe(int no,Model model, @ModelAttribute("pageType") String pageType
			, @ModelAttribute("tabType") String tabType, @ModelAttribute("page") String page){
		try {
			RecipeVO recipe = service.readRecipe(no);
			
			model.addAttribute( "recipe", recipe );
			model.addAttribute( "action", "read" );
			
			if(recipe != null){
				String values[] = {recipe.getIngredient(),recipe.getPrice(),recipe.getDifficulty(),recipe.getTime()};
				model.addAttribute( "values", values );
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return path+"book";
	}
	
	@RequestMapping("remove")
	public @ResponseBody String removerecipe(int no){
		System.out.println("Recipe_remove 실행   : no = "+no);
		try {
			if(service.removeRecipe(no)) return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "fail";
	}
	
	@RequestMapping("list") 
	public String listrecipe(Model model, String pageType, HttpSession session,
			Criteria cri){
		try {
		cri.setPerPageNum(6);
		pageType = ( pageType == null ) ? "recipe" : pageType;
		int userNo = session.getAttribute("userNo") != null ? (int)session.getAttribute("userNo") : 0;
		List<RecipeVO> list = 
				service.readList(pageType,userNo, new RowBounds(cri.getPageStart(),cri.getPerPageNum()));
		PageMaker pageMaker = new PageMaker(cri, service.getTotalCount());
		List<Integer> likeList = service.getLikeRecipies(userNo);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("pageType", pageType);
		model.addAttribute("recipeList", list);
		model.addAttribute("likeList", likeList);
		model.addAttribute("pageMaker", pageMaker);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return path+"list";
	} // # list페이지로 가기 위한 메소드
	
	@RequestMapping(value="likesUp", method=RequestMethod.POST)
	public @ResponseBody boolean likesUp(int no, String writer
			,Model model){
		try {
			int writerInt = writer ==null || writer.equals("") ? 0 : Integer.parseInt(writer);
			return service.likesUp(no, writerInt);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private String uploadFile(String photoName, byte[] fileData)throws Exception{ //상품 UID_상품명 생성
		UUID uid=UUID.randomUUID();
		String savedName = uid.toString()+"_"+photoName;
		File target = new File(uploadPath,savedName); 
		FileCopyUtils.copy(fileData, target);
		return "<img src='/matna/resource/images/recipe/"+savedName+"' width='400px' height='400px' class='photo'>";
	}
}
