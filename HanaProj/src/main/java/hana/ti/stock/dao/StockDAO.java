package hana.ti.stock.dao;

import java.util.List;

import hana.ti.stock.vo.StockVO;

public interface StockDAO {

	/**
	 * 주가 실시간 표 보여주기
	 * */
	public List<StockVO> stockList();
	
	/**
	 * 관심종목에 등록
	 * */
	public void basket(StockVO stock);
}
