package hana.ti.stock.service;

import java.util.List;

import hana.ti.stock.vo.StockVO;

public interface StockService {
	
	/**
	 * 주식목록
	 * */
	List<StockVO> stockList();
	
	/**
	 * 주가 최근 업데이트 날짜
	 * */
	public String stockDate();
	
	/**
	 * 이미 관심종목에 등록한 것은 관심종목에 등록하지 못하게 하기
	 * */
	List<StockVO> stockList(String id);
	
	/**
	 * 관심종목에 등록
	 * */
	public void basket(StockVO stockVO);
	
	/**
	 * 나의 관심종목
	 * */
	List<StockVO> basketList(String id);
	
	/**
	 * 관심종목 삭제
	 * */
	public void delBasket(StockVO stockVO);
}
