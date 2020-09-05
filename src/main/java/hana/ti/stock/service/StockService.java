package hana.ti.stock.service;

import java.util.List;

import hana.ti.stock.vo.StockVO;

public interface StockService {
	
	/**
	 * 주식목록
	 * */
	List<StockVO> stockList();
	
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
}
