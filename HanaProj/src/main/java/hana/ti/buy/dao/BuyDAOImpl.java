package hana.ti.buy.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
