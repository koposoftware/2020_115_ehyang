package hana.ti.buy.service;

import hana.ti.buy.vo.BuyVO;

public interface BuyService {

	/**
	 * 주식 매수
	 * */
	public void buy(BuyVO buyVO);
}
