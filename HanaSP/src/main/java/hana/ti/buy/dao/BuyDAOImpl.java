package hana.ti.buy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hana.ti.autotransfer.vo.AutotransferVO;
import hana.ti.buy.vo.BuyVO;

@Repository
public class BuyDAOImpl implements BuyDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 주식 매수
	 * */
	@Override
	public void buy(BuyVO buyVO) {
		sqlSession.insert("buy.dao.BuyDAO.buy", buyVO);
	}

	/**
	 * 매수시 증권계좌 잔액 변화
	 * */
	@Override
	public void saBalance(BuyVO buyVO) {
		sqlSession.update("buy.dao.BuyDAO.buystock", buyVO);
	}
	
	/**
	 * 매수내역에 추가
	 * */
	@Override
	public void saDetail(BuyVO buyVO) {
		sqlSession.insert("buy.dao.BuyDAO.buyDetail", buyVO);
	}
	
	/**
	 * 총 매수금
	 * */
	@Override
	public int totalBuy(String id) {
		int totalBuy = sqlSession.selectOne("buy.dao.BuyDAO.totalBuy", id);
		return totalBuy;
	}
	
	/**
	 * 매수 및 매도 증권계좌 내역 조회
	 * */
	@Override
	public List<BuyVO> saList(String account_num) {
		List<BuyVO> saList = sqlSession.selectList("buy.dao.BuyDAO.saccountList", account_num);
		return saList;
	}

	/**
	 * 체결목록
	 * */
	@Override
	public List<BuyVO> buyList(String id) {
		List<BuyVO> buyList = sqlSession.selectList("buy.dao.BuyDAO.buyList", id);
		return buyList;
	}

	/**
	 * 매도시 매수테이블 업데이트
	 * */
	@Override
	public void updateBuy(BuyVO buyVO) {
		sqlSession.delete("buy.dao.BuyDAO.updateBuy", buyVO);
	}

	/**
	 * 매도시 매도테이블에 추가
	 * */
	@Override
	public void sell(BuyVO buyVO) {
		sqlSession.insert("buy.dao.BuyDAO.sell", buyVO);
	}

	/**
	 * 매도시 증권계좌 내역에 추가
	 * */
	@Override
	public void sellDetail(BuyVO buyVO) {
		sqlSession.insert("buy.dao.BuyDAO.sellDetail", buyVO);
	}

	/**
	 * 매도시 증권계좌 잔액 변화
	 * */
	@Override
	public void sellBalance(BuyVO buyVO) {
		sqlSession.update("buy.dao.BuyDAO.sellStock", buyVO);
	}

	
	/**
	 * 구매가능한것 알람
	 * */	
	@Override
	public List<BuyVO> canBuy(String id) {
		List<BuyVO> canBuyList = sqlSession.selectList("buy.dao.BuyDAO.alarm", id);
		return canBuyList;
	}

	/**
	 * 매매상세(매도완료한거)
	 * */
	@Override
	public List<BuyVO> sellList(String id) {
		List<BuyVO> sellList = sqlSession.selectList("buy.dao.BuyDAO.sellList", id);
		return sellList;
	}

	/**
	 * 실현손익
	 * */
	@Override
	public int howmuch(String id) {
		int howmuch = sqlSession.selectOne("buy.dao.BuyDAO.howmuch", id);
		return howmuch;
	}
	
}
