package hana.ti.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hana.ti.stock.dao.StockDAO;
import hana.ti.stock.vo.StockVO;

@Service
public class StockServiceImpl implements StockService {

	
	@Autowired
	   private StockDAO stockDAO;

	/**
	 * 건설 및 중공업, 에너지/화학, 철강/소재
	 * */
	@Override
	public List<StockVO> stockListc1(String id) {
		List<StockVO> stockListc1 = stockDAO.stockListc1(id);
		return stockListc1;
	}
	
	/**
	 * 경기소비재 및 금융
	 * */
	@Override
	public List<StockVO> stockListc2(String id) {
		List<StockVO> stockListc2 = stockDAO.stockListc2(id);
		return stockListc2;
	}

	/**
	 * 생활소비재 및 산업재
	 * */
	@Override
	public List<StockVO> stockListc3(String id) {
		List<StockVO> stockListc3 = stockDAO.stockListc3(id);
		return stockListc3;
	}

	/**
	 * 정보기술 및 커뮤니케이션서비스
	 * */
	@Override
	public List<StockVO> stockListc4(String id) {
		List<StockVO> stockListc4 = stockDAO.stockListc4(id);
		return stockListc4;
	}

	/**
	 * 헬스케어
	 * */
	@Override
	public List<StockVO> stockListc5(String id) {
		List<StockVO> stockListc5 = stockDAO.stockListc5(id);
		return stockListc5;
	}

	/**
	 * 주가 최근 업데이트
	 * */
	@Override
	public String stockDate() {
		String date = stockDAO.stockRegdate();
		return date;
	}

	/**
	 * 관심종목에 등록
	 * */
	@Override
	public void basket(StockVO stockVO) {
		stockDAO.basket(stockVO);
	}

	/**
	 * 나의 관심종목
	 * */	
	@Override
	public List<StockVO> basketList(String id) {
		// 관심종목에 있는 주식 현재가로 업데이트
		stockDAO.basUpdate();	
		List<StockVO> basketList = stockDAO.basketList(id);
		return basketList;
	}

	/**
	 * 관심종목 삭제
	 * */
	@Override
	public void delBasket(StockVO stockVO) {
		stockDAO.delBasket(stockVO);
	}
}
