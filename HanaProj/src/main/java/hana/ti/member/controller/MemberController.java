package hana.ti.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import hana.ti.member.service.MemberService;
import hana.ti.member.vo.MemberVO;

@SessionAttributes({"loginVO"})   
@Controller
public class MemberController {
   
   @Autowired
   private MemberService memberService;

   
   /**
    * 로그인
    * */
   @GetMapping("/login")
   public String loginForm() {
      return "/member/login";
   }
   
   @PostMapping("/login")
   public ModelAndView login(MemberVO member, HttpSession session) {
      
      MemberVO loginVO = memberService.login(member);
      ModelAndView mav = new ModelAndView();
      
      // 로그인 실패
      if(loginVO == null) {
         mav.setViewName("redirect:/login");
      } 
      else {
         // 로그인 성공
         
         String dest = (String)session.getAttribute("dest");
         if(dest == null) { // 로그인 인터셉트의 preHandler를 거치지 않은 것
            mav.setViewName("redirect:/");
         } else {   // 로그인 인터셉트의 preHandler를 거친 것
            mav.setViewName("redirect:/" + dest);
            session.removeAttribute(dest);
         }
         mav.addObject("loginVO", loginVO);
      }
      return mav;
   }
   
   /**
    * 로그아웃
    * */
   @RequestMapping("/logout")
   public String logout(SessionStatus status) {
      
      status.setComplete();
      return "redirect:/";
   }
   
   /**
    * 회원가입
    * */
   @GetMapping("/signUp")
   public String newMember(Model model, HttpSession session) {
      
      MemberVO member = new MemberVO();
      
      model.addAttribute("memberVO", member);
      
      return "/member/signUp";
      
   }
   
   @PostMapping("/signUp")
   public String newMember(MemberVO member) {
      
      memberService.signupMem(member);
      
      return "redirect:/";
   }

   /**
    * 아이디 중복확인
    * */
   @PostMapping("/idChk")
   public int idChk(MemberVO member) {
      int result = memberService.idChk(member);
      return result;
   }
}