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
		// 매수내역에 추가
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
	 * 총 매수금
	 * */
	@Override
	public int totalBuy(String id) {
		int totalBuy = buyDAO.totalBuy(id);
		return totalBuy;
	}
	

	/**
	 * 매수 및 매도 증권계좌 내역 조회
	 * */
	@Override
	public List<BuyVO> saList(String account_num) {
		List<BuyVO> saList = buyDAO.saList(account_num);
		return saList;
	}


	/**
	 * 체결목록
	 * */
	@Override
	public List<BuyVO> buyList(String id) {
		List<BuyVO> buyList = buyDAO.buyList(id);
		return buyList;
	}
	
	/**
	 * 매도시 매수테이블 업데이트
	 * */
	@Override
	public void updateBuy(BuyVO buyVO) {
		buyDAO.updateBuy(buyVO);
	}

	/**
	 * 매도시 매도테이블에 추가
	 * */
	@Override
	public void sell(BuyVO buyVO) {
		buyDAO.sell(buyVO);
	}
	
	/**
	 * 매도시 증권계좌 내역에 추가
	 * */
	@Override
	public void sellDetail(BuyVO buyVO) {
		buyDAO.sellDetail(buyVO);
	}

	/**
	 * 매도시 증권계좌 잔액 증가
	 * */
	@Override
	public void sellBalance(BuyVO buyVO) {
		buyDAO.sellBalance(buyVO);
	}
	
	
	/**
	 * 매매상세(매도완료한거)
	 * */
	@Override
	public List<BuyVO> sellList(String id) {
		List<BuyVO> sellList = buyDAO.sellList(id);
		return sellList;
	}

	/**
	 * 구매가능한것 알람
	 * */
	@Override
	public List<BuyVO> canBuy(String id) {
		List<BuyVO> canBuyList = buyDAO.canBuy(id);
		return canBuyList;
	}

	/**
	 * 실현손익
	 * */
	@Override
	public int howmuch(String id) {
		int howmuch = buyDAO.howmuch(id);
		return howmuch;
	}
}
