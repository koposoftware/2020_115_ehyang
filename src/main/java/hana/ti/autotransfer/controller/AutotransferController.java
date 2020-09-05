package hana.ti.autotransfer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	 * 주금통 첫번째 이체 신청
	 * */
	@GetMapping("/autoTransfer")
	public ModelAndView registerForm(HttpSession session) {
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		
		List<AccountVO> accountNotRegList = accountService.selectNotRegAccount(id);
		ModelAndView mav = new ModelAndView("account/autoTransfer");
		mav.addObject("accountNotRegList",accountNotRegList);
		
		return mav;
	}
	
	@PostMapping("/autoTransfer")
	public String register(HttpSession session, AutotransferVO autotransferVO) {
		
		autotransferService.transfer(autotransferVO);
		return "redirect:/spList";
	}
	
	/**
	 * 주금통 내역 조회
	 * */
	@ResponseBody
	@PostMapping("/account/autoTransferlist")
	public ModelAndView list(@RequestParam("from_account") String fromAccount){
		
		System.out.println(fromAccount);
		
		List<AutotransferVO> transferList = autotransferService.autoList(fromAccount);
		ModelAndView mav = new ModelAndView("account/transferList");
		mav.addObject("transferList", transferList);
		return mav;
	}
	
	/**
	 * 주금통서비스 매일 777원씩 차감
	 * */
//	초 분 시 일 월 요일
	@Scheduled(cron = "0 3 19 * * *")
	public void spLogic() {
		System.out.println("매일 저녁 6시");
		autotransferService.resSPsend();
	}
}
