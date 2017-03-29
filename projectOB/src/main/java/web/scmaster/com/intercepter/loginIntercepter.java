package web.scmaster.com.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class loginIntercepter extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("mmmmmmmmmmmmmmmmmmmmmmmmm");
		//로그인 정보 확인
		HttpSession session = request.getSession();
		System.out.println("cccc");
			if(session.getAttribute("id") == null){
			//로그인 하지 않은 경우
				System.out.println("aaaaa");
			response.sendRedirect("/");
			return false;
		}
		
			//로그인 한 경우		
			System.out.println("mmmmmm");
		return super.preHandle(request, response, handler);
	}
	
}
