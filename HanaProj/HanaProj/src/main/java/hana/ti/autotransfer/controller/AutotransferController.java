package hana.ti.autotransfer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hana.ti.account.service.AccountService;
import hana.ti.account.vo.AccountVO;
import hana.ti.autotransfer.service.AutotransferService;
import hana.ti.autotransfer.vo.AutotransferVO;
import hana.ti.member.vo.MemberVO;

@Controller
public class AutotransferController {

	
	@Autowired
	private AutotransferService autotransferService;
	@Autowired
	private AccountService accountService;
	
	/**
	 * 자동이체신청
	 * */

	@GetMapping("/autoTransfer")
	public ModelAndView registerForm(HttpSession session) {
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		
		List<AccountVO> accountList = accountService.selectAllAccount(id);
		ModelAndView mav = new ModelAndView("account/autoTransfer");
		mav.addObject("accountList",accountList);
		
		return mav;
	}
	
	@PostMapping("/autoTransfer")
	public String register(HttpSession session, AutotransferVO autotransferVO) {
		
		autotransferService.transfer(autotransferVO);
		
		return "account/autoTransfer";
	}
}
