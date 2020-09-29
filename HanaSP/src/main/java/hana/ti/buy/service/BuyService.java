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
	 * 매수 및 매도 증권계좌 내역 조회
	 * */
	public List<BuyVO> saList(String account_num);
	
	/**
	 * 체결목록
	 * */
	public List<BuyVO> buyList(String id);
	
	/**
	 * 매도시 매수테이블 업데이트
	 * */
	public void updateBuy(BuyVO buyVO);
	
	/**
	 * 매도시 매도테이블에 추가
	 * */
	public void sell(BuyVO buyVO);
	
	/**
	 * 매도시 증권계좌 내역에 추가
	 * */
	public void sellDetail(BuyVO buyVO);
	
	/**
	 * 매도시 증권계좌 잔액 변화
	 * */
	public void sellBalance(BuyVO buyVO);
	
	/**
	 * 매매상세(매도완료한거)
	 * */
	public List<BuyVO> sellList(String id);
	
	/**
	 * 구매가능한것 알람
	 * */
	public List<BuyVO> canBuy(String id);
}
