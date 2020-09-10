package hana.ti.buy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

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
		return "redirect:/myBasket";
	  }
}
