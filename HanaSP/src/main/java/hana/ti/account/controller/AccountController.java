package hana.ti.account.controller;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
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
	 * @throws Exception 
	 * */
	@ResponseBody
	@PostMapping("/account/unRegSPMsg")
	public int unRegSPMsg() throws Exception {
		
//		int ran = new Random().nextInt(900000) + 100000;
		
		String code = create();
		int num = Integer.parseInt(code);
		
		messageSend.send("01051400204", "인증번호 " + code + " 를 입력해주세요.");
		
		return num;
	}

	/**
	 * OTP 생성 메소드
	 * */
	private static final long DISTANCE = 30000; // 30 sec
	   private static final String ALGORITHM = "HmacSHA1";
	   private static final byte[] SECRET_KEY = "define your secret key here".getBytes();


	   private static long create(long time) throws Exception {
	      byte[] data = new byte[8];
	      
	      long value = time;
	      for (int i = 8; i-- > 0; value >>>= 8) {
	         data[i] = (byte) value;
	      }
	    
	      Mac mac = Mac.getInstance(ALGORITHM);
	      mac.init(new SecretKeySpec(SECRET_KEY, ALGORITHM));
	    
	      byte[] hash = mac.doFinal(data);
	      int offset = hash[20 - 1] & 0xF;
	    
	      long truncatedHash = 0;
	      for (int i = 0; i < 4; ++i) {
	         truncatedHash <<= 8;
	         truncatedHash |= hash[offset + i] & 0xFF;
	      }
	    
	      truncatedHash &= 0x7FFFFFFF;
	      truncatedHash %= 1000000;
	    
	      return truncatedHash;
	   }
	   
	   public static String create() throws Exception {
	      return String.format("%06d", create(new Date().getTime() / DISTANCE));
	   }

	   public static boolean vertify(String code) throws Exception {
	      return create().equals(code);
	   }
	
	/**
	 * 이메일 전송
	 * @throws Exception 
	 * */
	@ResponseBody
	@GetMapping("/unRegSPEmail")
	public int sendCertificateNumber(@RequestParam("toMail") String toMail, HttpSession session) throws Exception {
		
		// 인증번호 생성
		String code = create();
		int num = Integer.parseInt(code);
	      
	      MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
	      String name = loginVO.getName();
	      
	      //제목
	      String title = "하나 주금통 서비스 해지 인증번호입니다.";
	      
	      //내용, 인증번호 포함
	      String content = "";
	      content += name + "님 안녕하십니까. \n";
	      content += "하나 주금통서비스 해지 인증번호입니다. \n";
	      content += "보고 계신 화면에 아래의 인증번호를 입력해주세요. \n";
	      content += "인증번호 : " + num + "\n";
	           
	      String setFrom = "HanaSP";
	      
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
	      
	      return num;
	   }
	

	/**
	 * 주금통 현황
	 * */
	@GetMapping("/mySP")
	public ModelAndView mySP(HttpSession session) {
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		String account_num = loginVO.getAccount_num();
		
		List<Integer> mySPList = accountService.mySP(account_num);
		ModelAndView mav = new ModelAndView("account/mySP");
		mav.addObject("mySPList", mySPList);
		
		System.out.println(mySPList);
		
		return mav;
	}
}