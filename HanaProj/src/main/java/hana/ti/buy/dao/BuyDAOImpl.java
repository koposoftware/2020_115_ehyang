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
		sqlSession.insert("buy.dao.BuyDAO.buydetail", buyVO);
	}

	/**
	 * 주금통 내역 조회
	 * */
	@Override
	public List<BuyVO> saList(String account_num) {
		List<BuyVO> saList = sqlSession.selectList("buy.dao.BuyDAO.saccountList", account_num);
		return saList;
	}
}
