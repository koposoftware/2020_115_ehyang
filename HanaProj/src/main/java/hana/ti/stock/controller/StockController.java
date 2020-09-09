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
	 * 주식목록
	 * */
	@RequestMapping("/stock")
	public ModelAndView list(HttpSession session) {
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		
		List<StockVO> stockList = stockService.stockList(loginVO.getId());
		String stockRegdate = stockService.stockDate();
//		for(StockVO vo : stockList) {
//			System.out.println(vo);
//		}
		
		ModelAndView mav = new ModelAndView("stock/stockList");
		mav.addObject("stockList", stockList);
		mav.addObject("stockRegdate", stockRegdate);
		return mav;
	}
	
	/*
	 * @RequestMapping("/stockChart") public ModelAndView chartList(HttpSession
	 * session) {
	 * 
	 * List<StockVO> chartList = stockService.stockList();
	 * 
	 * ModelAndView mav = new ModelAndView("stock/chartList");
	 * mav.addObject("chartList", chartList);
	 * 
	 * return mav; }
	 */
	
	
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
	 * 나의 관심종목
	 * */
	@RequestMapping("/myBasket")
	public ModelAndView myBasket(HttpSession session) {
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		List<StockVO> basketList = stockService.basketList(loginVO.getId());
		
		ModelAndView mav = new ModelAndView("stock/myBasket");
		mav.addObject("basketList", basketList);
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/stock/delBasket")
	public void delBasket(StockVO stockVO) {
		stockService.delBasket(stockVO);
	}
}
