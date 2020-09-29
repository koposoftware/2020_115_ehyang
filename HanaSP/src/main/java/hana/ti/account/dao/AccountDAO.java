package hana.ti.account.dao;

import java.util.List;

import hana.ti.account.vo.AccountVO;
import hana.ti.autotransfer.vo.AutotransferVO;

public interface AccountDAO {

	/**
	 * 통합계좌조회
	 * */
	public List<AccountVO> selectAll(String id);
	
	/**
	 * 총자산 조회
	 * */
	public int sum(String id);
	
	/**
	 * 주금통 서비스 이용 X 통합계좌조회
	 * */
	public List<AccountVO> selectAllNotReg(String id);
	
	/**
	 * 증권계좌개설
	 * */
	public void create(AccountVO account);
	
	/**
	 * 증권계좌조회
	 * */
	public List<AccountVO> selectSAll(String id);
	
	/**
	 * 증권계좌 잔액 조회
	 * */
	public int sbalance(String id);
	
	/**
	 * 주금통 서비스 이용 O 통합계좌조회
	 * */
	public List<AccountVO> regA(String id);
	
	/**
	 * 주금통 등록
	 * */
	public void resSP(String fromAccount);
	
	/**
	 * 주금통 해지 account 테이블 type 변경
	 * */
	public void unRegSP(String account_num);
	
}
