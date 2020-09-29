package hana.ti.account.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hana.ti.account.service.AccountService;
import hana.ti.account.vo.AccountVO;
import hana.ti.member.vo.MemberVO;
import hana.ti.message.MessageSend;

@Controller
public class AccountController {

	@Autowired
	private AccountService accountService;
	@Autowired
	private MessageSend messageSend;
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	/**
	 * 통합계좌조회
	 * */
	@RequestMapping("/account")
	public ModelAndView list(HttpSession session) {
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String id = loginVO.getId();
		
		List<AccountVO> accountList = accountService.selectAllAccount(id);
		int sumTotal = accountService.sum(id);
		
		ModelAndView mav = new ModelAndView("account/accountList");
		mav.addObject("accountList", accountList);
		mav.addObject("sumTotal", sumTotal);
		
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
	 * 비대면계좌 개설
	 * */
	@GetMapping("/createInMsg")
	public String createMsg() {
		
		
		return "/account/createInMsg";
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
	 
	/**
	 * 주금통 해지 문자인증
	 * */
	@ResponseBody
	@PostMapping("/account/unRegSPMsg")
	public int unRegSPMsg() {
		
		int ran = new Random().nextInt(900000) + 100000;
		
		messageSend.send("01051400204", "인증번호 " + ran + " 를 입력해주세요.");
		
		return ran;
	}

	/**
	 * 이메일 전송
	 * */
	@ResponseBody
	@GetMapping("/unRegSPEmail")
	public String sendCertificateNumber(@RequestParam("toMail") String toMail, HttpSession session) {
	      
	      //인증번호
	      Random random = new Random();
	      String cert = Integer.toString(random.nextInt(10)); 
	      cert += Integer.toString(random.nextInt(10));
	      cert += Integer.toString(random.nextInt(10));
	      cert += Integer.toString(random.nextInt(10));
	      cert += Integer.toString(random.nextInt(10));
	      cert += Integer.toString(random.nextInt(10));
	      
	      //제목
	      String title = "인증번호입니다.";
	      
	      //내용, 인증번호 포함
	      String content = "";
	      content += "하나은행 이체서비스 인증번호입니다. \n";
	      content += "인증번호 : " + cert + "\n";
	           
	      String setFrom = "hee";
	      
	      try {
	         MimeMessage message = mailSender.createMimeMessage();
	         MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");
	         
	         messageHelper.setFrom(setFrom);
	         messageHelper.setTo(toMail);
	         messageHelper.setSubject(title);
	         messageHelper.setText(content);
	         
	         mailSender.send(message);
	         
	      } catch(Exception e) {
	         System.out.println(e);
	      }
	      
	      return cert;
	   }
}