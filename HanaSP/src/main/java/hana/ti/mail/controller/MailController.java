package hana.ti.mail.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hana.ti.mail.service.MailService;

@Controller
@RequestMapping(value="/login")
public class MailController {
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping(value="/email")
	public ModelAndView board2(){
		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000;
		mv.setViewName("test/email");
		mv.addObject("random", ran);
		return mv;
	}
	
	
	
	@RequestMapping(value="/createEmailCheck", method=RequestMethod.GET)
	@ResponseBody
	public boolean createEmailCheck(@RequestParam String userEmail, @RequestParam int random, HttpServletRequest req){
	
		//이메일 인증
		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = req.getSession(true);
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + authCode + "입니다.");
 
		String sendEmailId = "hanastockpiggybank@gmail.com";
		return mailService.send(subject, sb.toString(), sendEmailId , userEmail, null);
	}
	
	@RequestMapping(value="/emailAuth", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> emailAuth(@RequestParam String authCode, @RequestParam String random, HttpSession session){
		String originalJoinCode = (String) session.getAttribute("authCode");
		String originalRandom = Integer.toString((int) session.getAttribute("random"));
		if(originalJoinCode.equals(authCode) && originalRandom.equals(random))
			return new ResponseEntity<String>("success", HttpStatus.OK);
		else return new ResponseEntity<String>("false", HttpStatus.OK);
	}
	
	
}