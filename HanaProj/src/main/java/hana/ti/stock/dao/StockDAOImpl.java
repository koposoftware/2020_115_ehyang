package hana.ti.stock.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hana.ti.stock.vo.StockVO;

@Repository
public class StockDAOImpl implements StockDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 주가 실시간 표 보여주기
	 * */
	@Override
	public List<StockVO> stockList() {
		List<StockVO> stockList = sqlSession.selectList("stock.dao.StockDAO.stockList");
		return stockList;
	}

	/**
	 * 관심종목에 등록
	 * */
	@Override
	public void basket(StockVO stock) {
		sqlSession.insert("stock.dao.StockDAO.basket", stock);
	}
}
