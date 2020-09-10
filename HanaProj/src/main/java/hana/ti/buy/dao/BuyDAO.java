package hana.ti.buy.dao;

import hana.ti.buy.vo.BuyVO;

public interface BuyDAO {

	/**
	 * 주식 매수
	 * */
	public void buy(BuyVO buyVO);
}
