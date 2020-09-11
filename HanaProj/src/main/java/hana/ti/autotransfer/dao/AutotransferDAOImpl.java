package hana.ti.autotransfer.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hana.ti.autotransfer.vo.AutotransferVO;


@Repository
public class AutotransferDAOImpl implements AutotransferDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 주금통 첫 번째 이체 신청 일반계좌 -> 증권계좌
	 * */
	@Override
	public void send(AutotransferVO autotransferVO) {
		sqlSession.update("autotransfer.dao.autotransferDAO.send", autotransferVO);
	}
	
	/**
	 * 주금통 첫 번째 이체 신청 받기
	 * */
	@Override
	public void receive(AutotransferVO autotransferVO) {
		sqlSession.update("autotransfer.dao.autotransferDAO.receive", autotransferVO);
	}
	
	/**
	 * 주금통 그날 남은 금액 업데이트
	 * */
	@Override
	public void resUpdate(AutotransferVO autotransferVO) {
		sqlSession.update("autotransfer.dao.autotransferDAO.resUpdate", autotransferVO);	
	}

	/**
	 * 주금통 내역 조회
	 * */
	@Override
	public List<AutotransferVO> autoList(String fromAccount) {
		List<AutotransferVO> transferList = sqlSession.selectList("autotransfer.dao.autotransferDAO.autoList", fromAccount);
		return transferList;
	}

	/**
	 * 주금통 신청하면 예약테이블에 추가
	 * */
	@Override
	public void insertRes(AutotransferVO autotransferVO) {
		sqlSession.insert("autotransfer.dao.autotransferDAO.resSP", autotransferVO);
	}
	
	/**
	 * 예약테이블 리스트
	 * */
	@Override
	public List<AutotransferVO> resTblList() {
		List<AutotransferVO> resList = sqlSession.selectList("autotransfer.dao.autotransferDAO.resSPList");
		return resList;
	}
	
	/**
	 * 송금 내역
	 * */
	@Override
	public void transferList(AutotransferVO autotransferVO) {
		sqlSession.insert("autotransfer.dao.autotransferDAO.transferList", autotransferVO);
	}

	/**
	 * 주금통 서비스 취소 -> 예약테이블에서 삭제
	 * */
	@Override
	public void resSPDel(String fromAccount) {
		sqlSession.delete("autotransfer.dao.autotransferDAO.resSPDel", fromAccount);		
	}
}
