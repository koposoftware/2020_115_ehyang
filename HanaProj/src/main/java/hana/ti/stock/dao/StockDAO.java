package hana.ti.stock.dao;

import java.util.List;

import hana.ti.stock.vo.StockVO;

public interface StockDAO {

	/**
	 * 건설 및 중공업, 에너지/화학, 철강/소재
	 * */
	public List<StockVO> stockListc1(String id);
	
	/**
	 * 경기소비재 및 금융
	 * */
	public List<StockVO> stockListc2(String id);
	
	/**
	 * 생활소비재 및 산업재
	 * */
	public List<StockVO> stockListc3(String id);
	
	/**
	 * 정보기술 및 커뮤니케이션서비스
	 * */
	public List<StockVO> stockListc4(String id);
	
	/**
	 * 헬스케어
	 * */
	public List<StockVO> stockListc5(String id);
	
	/**
	 * 주식 최근 업데이트 날짜
	 * */
	public String stockRegdate();

	/**
	 * 관심종목에 등록
	 * */
	public void basket(StockVO stockVO);
	
	/**
	 * 나의 관심종목
	 * */
	public List<StockVO> basketList(String id);
	
	/**
	 * 관심종목에 있는 주식 현재가로 업데이트
	 * */
	public void basUpdate();
	
	/**
	 * 관심종목 삭제
	 * */
	public void delBasket(StockVO stockVO);
}
