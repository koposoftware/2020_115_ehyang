package hana.ti.stock.service;

import java.util.List;

import hana.ti.stock.vo.StockVO;

public interface StockService {

	/**
	 * 내 전체 통합계좌목록 보여주기
	 * */
	List<StockVO> stockList();
	
	/**
	 * 관심종목에 등록
	 * */
	public void basket(StockVO stock);
}
