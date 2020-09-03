package hana.ti.autotransfer.dao;

import hana.ti.autotransfer.vo.AutotransferVO;

public interface AutotransferDAO {
	/**
	 * 자동이체 보내기
	 * */
	public void send(AutotransferVO autotransferVO);
	
	/**
	 * 자동이체 받기
	 * */
	public void receive(AutotransferVO autotransferVO);
}
