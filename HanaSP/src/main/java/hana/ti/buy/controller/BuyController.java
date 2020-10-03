package hana.ti.buy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hana.ti.buy.service.BuyService;
import hana.ti.buy.vo.BuyVO;
import hana.ti.member.vo.MemberVO;
import hana.ti.stock.service.StockService;
import hana.ti.stock.vo.StockVO;


@Controller
public class BuyController {

   @Autowired
   private BuyService buyService;
   @Autowired
   private StockService stockService;
   
   /**
    * 주식 매수
    * */
   @PostMapping("/buy")
     public String buy(BuyVO buyVO, StockVO stockVO) {
      // 구매하면
      buyService.buy(buyVO);
      // 관심종목에서 삭제
      stockService.delBasket(stockVO);
      // 증권계좌에서 그 가격만큼 이체
      buyService.sabalance(buyVO);
      // 증권계좌 내역에 추가
      buyService.saDetail(buyVO);
      
      return "redirect:/myBasket";
     }
   
   /**
    * 매수및매도 증권계좌내역조회
    * */
   @ResponseBody
   @PostMapping("/account/saList")
   public ModelAndView saList(@RequestParam("account_num") String account_num){
      
		/* System.out.println(account_num); */
      
      List<BuyVO> saList = buyService.saList(account_num);
      ModelAndView mav = new ModelAndView("account/stockAccountList");
      mav.addObject("saList", saList);
      return mav;
   }
   
   /**
    * 체결목록 조회
    * */
   @RequestMapping("/buyList")
   public ModelAndView buyList(HttpSession session) {
	   
	   	MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		
		// 매수 목록
		List<BuyVO> buyList = buyService.buyList(id);
		
		ModelAndView mav = new ModelAndView("stock/stockBuyList");
		mav.addObject("buyList", buyList);
		
		// 매도 목록
		List<BuyVO> sellList = buyService.sellList(id);
		mav.addObject("sellList", sellList);
		
		// 총 매수금
		int totalBuy = buyService.totalBuy(id);
		mav.addObject("totalBuy", totalBuy);
		
		// 실현손익
		int howmuch = buyService.howmuch(id);
		mav.addObject("howmuch", howmuch);
		
		return mav;
   }
   
   /**
    * 수익률 계산(현재가)
    * */
//   @ResponseBody
//   @PostMapping("/stock/rate")
//   public ModelAndView nowPrice(String code) {
//	
//	   // 주식 현재가
//	   int price = buyService.nowPrice(code);
//	   
//	   ModelAndView mav = new ModelAndView("stock/profitRate");
//	   mav.addObject("price", price);
//	   return mav;
//   }
   
   @PostMapping("/sell")
   public String sell(BuyVO buyVO, String code) {
	   
	   // 매도하면 매수목록에서 삭제
	   buyService.updateBuy(buyVO);
	   // 매도테이블에 추가
	   buyService.sell(buyVO);
	   // 증권계좌에 입금
	   buyService.sellBalance(buyVO);
	   // 증권계좌 내역에 추가
	   buyService.sellDetail(buyVO);
	   
	   return "redirect:/buyList";
   }
   
	/**
	 * 구매가능한것 알람
	 * */
   @RequestMapping("/canBuyList")
   public ModelAndView canBuyList(HttpSession session){
	   
	   MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
	
		List<BuyVO> canBuyList = buyService.canBuy(id);
		ModelAndView mav = new ModelAndView("stock/canBuyList");
		mav.addObject("canBuyList", canBuyList);
		
		return mav;
   }
   

	/*
	 * @RequestMapping("/sellList") public ModelAndView sellList(HttpSession
	 * session) {
	 * 
	 * MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); String id =
	 * loginVO.getId();
	 * 
	 * // 체결목록 List<BuyVO> sellList = buyService.sellList(id);
	 * 
	 * ModelAndView mav = new ModelAndView("stock/stockSellList");
	 * mav.addObject("sellList", sellList);
	 * 
	 * return mav; }
	 */
   
}