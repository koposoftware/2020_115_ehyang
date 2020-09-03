package hana.ti.stock.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hana.ti.member.vo.MemberVO;
import hana.ti.stock.service.StockService;
import hana.ti.stock.vo.StockVO;

@Controller
public class StockController {

	@Autowired
	private StockService stockService;
	
	/**
	 * 내 전체 통합계좌목록 보여주기
	 * */
	@RequestMapping("/stock")
	public ModelAndView list(HttpSession session) {
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		
		List<StockVO> stockList = stockService.stockList(loginVO.getId());
		
		for(StockVO vo : stockList) {
			System.out.println(vo);
		}
		
		ModelAndView mav = new ModelAndView("stock/stockList");
		mav.addObject("stockList", stockList);
		
		return mav;
	}
	
	/**
	 * 관심종목 등록
	 * */
	@ResponseBody
	@PostMapping("/stock/addFavorite")
	public void addFavorite(StockVO stockVO) {
//		System.out.println(stockVO);
		stockService.basket(stockVO);
	}
	
	/**
	 * 관심종목에 등록
	 * */
//	@GetMapping("/basket")
//	public String basketForm(Model model, HttpSession session) {
//		
//		StockVO stock = new StockVO();
//
//		model.addAttribute("stockVO", stock);
//
//		return "/stock/basket";
//	}
//
//	@PostMapping("/basket")
//	public String basket(@Valid StockVO stockVO, BindingResult result, @RequestParam("name")String name, @RequestParam("code")String code) {
//
//		if(result.hasErrors()) {
//			return "stock/basket";
//		}
//		
//		return "redirect:/";
//	}
}
