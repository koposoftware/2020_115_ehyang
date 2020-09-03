package hana.ti.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import hana.ti.member.vo.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	// 로그인O -> 게시판 글 등록가능, 로그인X -> 게시판 글 등록불가능
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)	
			throws Exception {

		System.out.println("pre발동!!!");
		// 어떤 컨트롤러의 어느 메소드를 실행했는지 handler를 통해 알 수 있음
		HandlerMethod method = (HandlerMethod)handler;
		System.out.println("메소드 : "+ method);
		System.out.println("controller : " + method.getBean());
		
		// 로그인 여부 체크
		HttpSession session = request.getSession();	// session객체 얻어오고
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); 	// loginVO있는지 확인
		
		if(loginVO == null) {	// 로그인 안되어있으면
			
			String uri = request.getRequestURI();	// 내가 지금 접속한 uri (Mission-Spring까지 다나옴)
			System.out.println("uri1 : " + uri);
			uri = uri.substring(request.getContextPath().length());
			System.out.println("uri2 : " + uri);
//			System.out.println(uri);
			
			// query : ?뒤에 날아가는 값
			String query = request.getQueryString();
			System.out.println(query);
			
			if(query != null && query.length() != 0)
				uri = uri + "?" + query;
			
			//세션영역에 uri등록
			session.setAttribute("dest", uri);
			
			response.sendRedirect(request.getContextPath() + "/login");	// 로그인페이지로 보내라
			
			return false;		// 그 컴포넌트로 가는 것을 막아!내가 @RequestMapping해준거 요청 안함
		}
		return true;		// 로그인 되어있으면 내가 @RequestMapping해준거 요청 함
	}

	/*
	 * @Override public void postHandle(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, ModelAndView modelAndView)
	 * throws Exception { System.out.println("postHandle()호출");
	 * super.postHandle(request, response, handler, modelAndView); }
	 * 
	 * @Override public void afterCompletion(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, Exception ex) throws Exception
	 * { System.out.println("afterCompletion()호출"); super.afterCompletion(request,
	 * response, handler, ex); }
	 */

}
