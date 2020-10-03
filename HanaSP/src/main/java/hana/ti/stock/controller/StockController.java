package hana.ti.stock.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hana.ti.account.service.AccountService;
import hana.ti.member.vo.MemberVO;
import hana.ti.stock.service.StockService;
import hana.ti.stock.vo.StockVO;

@Controller
public class StockController {

	@Autowired
	private StockService stockService;
	@Autowired
	private AccountService accountService;
	
	/**
	 * 주식목록
	 * */
	@RequestMapping("/stock")
	public ModelAndView list(HttpSession session) {
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		
		List<StockVO> stockListc1 = stockService.stockListc1(loginVO.getId());
		List<StockVO> stockListc2 = stockService.stockListc2(loginVO.getId());
		List<StockVO> stockListc3 = stockService.stockListc3(loginVO.getId());
		List<StockVO> stockListc4 = stockService.stockListc4(loginVO.getId());
		List<StockVO> stockListc5 = stockService.stockListc5(loginVO.getId());
		String stockRegdate = stockService.stockDate();
		
//		for(StockVO vo : stockList) {
//			System.out.println(vo);
//		}
		System.out.println(stockListc4);
		ModelAndView mav = new ModelAndView("stock/stockList");
		
		mav.addObject("stockListc1", stockListc1);
		mav.addObject("stockListc2", stockListc2);
		mav.addObject("stockListc3", stockListc3);
		mav.addObject("stockListc4", stockListc4);
		mav.addObject("stockListc5", stockListc5);
		mav.addObject("stockRegdate", stockRegdate);
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
	 * 나의 관심종목
	 * */
	@RequestMapping("/myBasket")
	public ModelAndView myBasket(HttpSession session) {
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		List<StockVO> basketList = stockService.basketList(loginVO.getId());
		int saccbalance = accountService.sbalance(loginVO.getId());
		
		ModelAndView mav = new ModelAndView("stock/myBasket");
		mav.addObject("basketList", basketList);
		mav.addObject("saccbalance",saccbalance);
		return mav;
	}
	
	/**
	 * 관심종목에서 삭제
	 * */
	@ResponseBody
	@PostMapping("/stock/delBasket")
	public void delBasket(StockVO stockVO) {
		stockService.delBasket(stockVO);
	}
	
	/**
	 * 코스피 지수 보여주기
	 * */
	@ResponseBody
	@RequestMapping("/stock/kospi")
	public List<StockVO> kospi(){
		List<StockVO> kospiList = stockService.kospi();
		System.out.println(kospiList);
		return kospiList;
		
	}
}