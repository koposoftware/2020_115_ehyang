package hana.ti.stock.service;

import java.util.List;

import hana.ti.stock.vo.StockVO;

public interface StockService {
	
	/**
	 * 건설 및 중공업, 에너지/화학, 철강/소재
	 * */
	List<StockVO> stockListc1(String id);
	
	/**
	 * 경기소비재 및 금융
	 * */
	List<StockVO> stockListc2(String id);
	
	/**
	 * 생활소비재 및 산업재
	 * */
	List<StockVO> stockListc3(String id);
	
	/**
	 * 정보기술 및 커뮤니케이션서비스
	 * */
	List<StockVO> stockListc4(String id);
	
	/**
	 * 헬스케어
	 * */
	List<StockVO> stockListc5(String id);
	
	/**
	 * 주가 최근 업데이트 날짜
	 * */
	public String stockDate();
	
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
