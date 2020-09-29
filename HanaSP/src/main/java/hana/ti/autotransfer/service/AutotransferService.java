package hana.ti.autotransfer.service;

import java.util.List;

import hana.ti.autotransfer.vo.AutotransferVO;

public interface AutotransferService {

	/**
	 * 주금통 첫 번째 이체 신청 일반계좌 -> 증권계좌
	 * */
	public void transfer(AutotransferVO autotransferVO);
	
	/**
	 * 주금통 내역
	 * */
	List<AutotransferVO> autoList(String fromAccount);
	
	/**
	 * 예약테이블 리스트
	 * */
	List<AutotransferVO> resTblList();
	
	/**
	 * 예약테이블에 있는 것들 매일 18시에 송금
	 * */
	public void resSPsend();

	/**
	 * 업데이트(2번 이체 되어서 따로 빼줌)
	 * */
	public void resUpdate();
	
}
