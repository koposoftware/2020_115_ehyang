package hana.ti.stock.dao;

import java.util.List;

import hana.ti.stock.vo.StockVO;

public interface StockDAO {

	/**
	 * 주식목록
	 * */
	public List<StockVO> stockList();
	
	/**
	 * 주식 최근 업데이트 날짜
	 * */
	public String stockRegdate ();
	
	/**
	 * 이미 관심종목에 등록한 것은 관심종목에 등록하지 못하게 하기
	 * */
	public List<StockVO> stockList(String id);
	
	/**
	 * 관심종목에 등록
	 * */
	public void basket(StockVO stockVO);
	
	/**
	 * 나의 관심종목
	 * */
	public List<StockVO> basketList(String id);
	
	/**
	 * 관심종목 삭제
	 * */
	public void delBasket(StockVO stockVO);
}
