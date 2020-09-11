package hana.ti.buy.service;

import java.util.List;

import hana.ti.buy.vo.BuyVO;

public interface BuyService {

	/**
	 * 주식 매수
	 * */
	public void buy(BuyVO buyVO);
	
	/**
	 * 매수시 증권계좌 잔액변화
	 * */
	public void sabalance(BuyVO buyVO);
	
	/**
	 * 매수내역에 추가
	 * */
	public void saDetail(BuyVO buyVO);
	
	/**
	 * 주금통 내역 조회
	 * */
	List<BuyVO> saList(String account_num);
}
