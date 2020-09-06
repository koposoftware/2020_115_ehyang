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
	 * 주식목록
	 * */
	@Override
	public List<StockVO> stockList() {
		List<StockVO> stockList = stockDAO.stockList();
		return stockList;
	}

	/**
	 * 이미 관심종목에 등록한 것은 관심종목에 등록하지 못하게 하기
	 * */
	@Override
	public List<StockVO> stockList(String id) {
		List<StockVO> stockList = stockDAO.stockList(id);
		return stockList;
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
