package hana.ti.stock.dao;

import java.util.List;

import hana.ti.stock.vo.StockVO;

public interface StockDAO {

	/**
	 * 주가 실시간 표 보여주기
	 * */
	public List<StockVO> stockList();
	
	/**
	 * 이미 관심종목에 등록한 것은 관심종목에 등록하지 못하게 하기
	 * */
	public List<StockVO> stockList(String id);
	
	/**
	 * 관심종목에 등록
	 * */
	public void basket(StockVO stockVO);
}
