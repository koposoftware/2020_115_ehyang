package hana.ti.autotransfer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hana.ti.autotransfer.dao.AutotransferDAO;
import hana.ti.autotransfer.vo.AutotransferVO;

@Service
public class AutotransferServiceImpl implements AutotransferService {

	@Autowired
	   private AutotransferDAO autotransferDAO;
	
	/**
	 * 자동이체
	 * */
	@Transactional
	@Override
	public void transfer(AutotransferVO autotransferVO) {
		autotransferDAO.send(autotransferVO);
		autotransferDAO.receive(autotransferVO);
	}
}
