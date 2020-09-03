package hana.ti.autotransfer.service;

import hana.ti.autotransfer.vo.AutotransferVO;

public interface AutotransferService {

	/**
	 * 자동이체
	 * */
	public void transfer(AutotransferVO autotransferVO);
}
