package hana.ti.autotransfer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hana.ti.account.dao.AccountDAO;
import hana.ti.autotransfer.dao.AutotransferDAO;
import hana.ti.autotransfer.vo.AutotransferVO;

@Service
public class AutotransferServiceImpl implements AutotransferService {

		@Autowired
		private AutotransferDAO autotransferDAO;
		@Autowired
		private AccountDAO accountDAO;
	
	/**
	 * 주금통 첫 번째 이체 신청 일반계좌 -> 증권계좌
	 * */
	@Transactional
	@Override
	public void transfer(AutotransferVO autotransferVO) {
		//보내기
		autotransferDAO.send(autotransferVO);
		// 받기
		autotransferDAO.receive(autotransferVO);
		// Y로 업데이트
		accountDAO.resSP(autotransferVO.getFromAccount());
		// 예약테이블에 추가
		autotransferDAO.insertRes(autotransferVO);
		// 거래내역에 추가
		autotransferDAO.transferList(autotransferVO);
	}

	/**
	 * 주금통 내역
	 * */
	@Override
	public List<AutotransferVO> autoList(String fromAccount) {
		List<AutotransferVO> tranferList = autotransferDAO.autoList(fromAccount);
		return tranferList;
	}

	/**
	 * 예약테이블 리스트
	 * */
	@Override
	public List<AutotransferVO> resTblList() {
		List<AutotransferVO> resList = autotransferDAO.resTblList();
		
		return resList;
	}
	
	/**
	 * 예약테이블에 있는 것들 매일 18시에 송금
	 * */

	@Transactional
	@Override
	public void resSPsend() {
		List<AutotransferVO> resList = autotransferDAO.resTblList();
		for(AutotransferVO autotransferVO:resList) {
			
			// 그날 남은 금액 업데이트
			autotransferDAO.resUpdate(autotransferVO);
			//보내기
			autotransferDAO.send(autotransferVO);
			// 받기
			autotransferDAO.receive(autotransferVO);
			// 거래내역에 추가
			autotransferDAO.transferList(autotransferVO);
		}
	}
}
