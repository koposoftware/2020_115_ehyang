package hana.ti.buy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hana.ti.autotransfer.vo.AutotransferVO;
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

	/**
	 * 매수시 증권계좌 잔액변화
	 * */
	@Override
	public void sabalance(BuyVO buyVO) {
		buyDAO.saBalance(buyVO);		
	}
	
	 /**
	   * 매수내역에 추가
	   * */
	@Override
	public void saDetail(BuyVO buyVO) {
		buyDAO.saDetail(buyVO);			
	}

	/**
	 * 주금통 내역 조회
	 * */
	@Override
	public List<BuyVO> saList(String account_num) {
		List<BuyVO> saList = buyDAO.saList(account_num);
		return saList;
	}
}
