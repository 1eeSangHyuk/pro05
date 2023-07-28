package com.matjip.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import com.matjip.bean.UserBean;

public class UserInterceptor implements HandlerInterceptor{

//   @Resource(name="loginUserBean")
//   @Lazy
//   private UserBean loginUserBean;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		if(request.getSession().getAttribute("sid")==null) {
			
			response.sendRedirect(request.getContextPath()+"/user/invalidUser");
			return false;
		} 
//		else if(request.getSession().getAttribute("sid").equals(loginUserBean.getUser_id()) == false) {
//			
//			response.sendRedirect(request.getContextPath()+"/user/invalidUser");
//			return false;
//		}
		return true;
	}
	
}
