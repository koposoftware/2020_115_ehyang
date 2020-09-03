package hana.ti.autotransfer.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hana.ti.autotransfer.vo.AutotransferVO;


@Repository
public class AutotransferDAOImpl implements AutotransferDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 자동이체 보내기
	 * */
	@Override
	public void send(AutotransferVO autotransferVO) {
		sqlSession.update("autotransfer.dao.autotransferDAO.send", autotransferVO);
	}
	
	/**
	 * 자동이체받기
	 * */
	@Override
	public void receive(AutotransferVO autotransferVO) {
		sqlSession.update("autotransfer.dao.autotransferDAO.receive", autotransferVO);
	}
}
