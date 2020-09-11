package hana.ti.buy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hana.ti.autotransfer.vo.AutotransferVO;
import hana.ti.buy.service.BuyService;
import hana.ti.buy.vo.BuyVO;
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
	 * 주금통 내역 조회
	 * */
	@ResponseBody
	@PostMapping("/account/saList")
	public ModelAndView saList(@RequestParam("account_num") String account_num){
		
		System.out.println(account_num);
		
		List<BuyVO> saList = buyService.saList(account_num);
		ModelAndView mav = new ModelAndView("account/stockAccountList");
		mav.addObject("saList", saList);
		return mav;
	}
}
