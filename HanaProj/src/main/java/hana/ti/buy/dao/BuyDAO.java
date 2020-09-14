package hana.ti.buy.dao;

import java.util.List;

import hana.ti.autotransfer.vo.AutotransferVO;
import hana.ti.buy.vo.BuyVO;

public interface BuyDAO {

	/**
	 * 주식 매수
	 * */
	public void buy(BuyVO buyVO);
	
	/**
	 * 매수시 증권계좌 잔액 변화
	 * */
	public void saBalance(BuyVO buyVO);
	
	/**
	 * 매수 내역에 추가
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
	 * 매도시 매수목록에서 삭제
	 * */
	public void delBuy(BuyVO buyVO);
	
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
}
