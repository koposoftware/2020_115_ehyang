package hana.ti.account.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hana.ti.account.service.AccountService;
import hana.ti.account.vo.AccountVO;
import hana.ti.member.vo.MemberVO;

@Controller
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	/**
	 * 통합계좌조회
	 * */
	@RequestMapping("/account")
	public ModelAndView list(HttpSession session) {
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		
		List<AccountVO> accountList = accountService.selectAllAccount(id);
		
		ModelAndView mav = new ModelAndView("account/accountList");
		mav.addObject("accountList", accountList);
		return mav;
	}
	
	/**
	 * 증권계좌생성
	 * */
	@GetMapping("/create")
	public String createForm(Model model, HttpSession session) {
		
		AccountVO account = new AccountVO();
		
		model.addAttribute("accountVO", account);
		
		return "/account/create";
	}
	
	@PostMapping("/create")
	public String create(@Valid AccountVO accountVO, BindingResult result) {
		
		if(result.hasErrors()) {
			return "account/create";
		}
		
		accountService.create(accountVO);
		return "redirect:/";
	}
	
	/**
	 * 이미 증권계좌가 있는 고객은 생성하지 못하게 함
	 * */
	@RequestMapping("/ncreate")
	public String ncreate() {
		return "account/ncreate";
	}
	
	/**
	 * 증권계좌조회
	 * */
	@RequestMapping("/sAccount")
	public ModelAndView Slist(HttpSession session) {
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		
		List<AccountVO> SAccountList = accountService.selectSAllAccount(id);
		
		ModelAndView mav = new ModelAndView("account/sAccountList");
		mav.addObject("SAccountList", SAccountList);
		
		return mav;
	}
	
	/**
	 * 주금통 서비스에 등록한 계좌 및 증권계좌
	 * */
	@RequestMapping("/spList")
	public ModelAndView regA(HttpSession session) {
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		
		List<AccountVO> regAList = accountService.regA(id);
		ModelAndView mav = new ModelAndView("account/spList");
		mav.addObject("regAList", regAList);
		
		return mav;
	}
	
	/**
	 * 주금통 해지
	 * */
	@ResponseBody
	@PostMapping("/account/unRegSP")
	public void unRegSP(String account_num) {
		
		accountService.unRegSP(account_num);
	}
}
