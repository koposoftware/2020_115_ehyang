package hana.ti.buy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hana.ti.buy.dao.BuyDAO;
import hana.ti.buy.vo.BuyVO;

@Service
public class BuyServiceImpl implements BuyService {

	@Autowired
	   private BuyDAO buyDAO;

	/**
	 * 주식 매수
	 * */
	@Override
	public void buy(BuyVO buyVO) {
		buyDAO.buy(buyVO);
	}
}
