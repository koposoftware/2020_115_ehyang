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
	 * 건설 및 중공업, 에너지/화학, 철강/소재
	 * */
	@Override
	public List<StockVO> stockListc1(String id) {
		List<StockVO> stockListc1 = sqlSession.selectList("stock.dao.StockDAO.stockListc1", id);
		return stockListc1;
	}
	
	/**
	 * 경기소비재 및 금융
	 * */
	@Override
	public List<StockVO> stockListc2(String id) {
		List<StockVO> stockListc2 = sqlSession.selectList("stock.dao.StockDAO.stockListc2" , id);
		return stockListc2;
	}

	/**
	 * 생활소비재 및 산업재
	 * */
	@Override
	public List<StockVO> stockListc3(String id) {
		List<StockVO> stockListc3 = sqlSession.selectList("stock.dao.StockDAO.stockListc3" , id);
		return stockListc3;
	}

	/**
	 * 정보기술 및 커뮤니케이션서비스
	 * */
	@Override
	public List<StockVO> stockListc4(String id) {
		List<StockVO> stockListc4 = sqlSession.selectList("stock.dao.StockDAO.stockListc4" , id);
		return stockListc4;
	}

	/**
	 * 헬스케어
	 * */
	@Override
	public List<StockVO> stockListc5(String id) {
		List<StockVO> stockListc5 = sqlSession.selectList("stock.dao.StockDAO.stockListc5" , id);
		return stockListc5;
	}

	/**
	 * 주식 최근 업데이트 날짜
	 * */
	@Override
	public String stockRegdate() {
		String date = sqlSession.selectOne("stock.dao.StockDAO.stockregdate");
		return date;
	}

	/**
	 * 관심종목에 등록
	 * */
	@Override
	public void basket(StockVO stockVO) {
		sqlSession.insert("stock.dao.StockDAO.basket", stockVO);
	}

	/**
	 * 나의 관심종목
	 * */
	@Override
	public List<StockVO> basketList(String id) {
		List<StockVO> basketList = sqlSession.selectList("stock.dao.StockDAO.basketList", id);
		return basketList;
	}
	
	/**
	 * 관심종목에 있는 주식 현재가로 업데이트
	 * */	
	@Override
	public void basUpdate() {
		sqlSession.update("stock.dao.StockDAO.basUpdate");
	}

	/**
	 * 관심종목 삭제
	 * */
	@Override
	public void delBasket(StockVO stockVO) {
		sqlSession.delete("stock.dao.StockDAO.delBasket", stockVO);
	}

	/**
	 * 코스피 지수 보여주기
	 * */
	@Override
	public List<StockVO> kospi() {
		List<StockVO> kospiList = sqlSession.selectList("stock.dao.StockDAO.kospi");
		return kospiList;
	}

}
