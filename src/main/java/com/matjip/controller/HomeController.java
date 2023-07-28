package com.matjip.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.matjip.bean.RestBean;
import com.matjip.bean.UserBean;
import com.matjip.service.RestService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private RestService restService;
	
//	@Resource(name="loginUserBean")
//	@Lazy
//	private UserBean loginUserBean;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, HttpServletRequest request, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		String url = request.getContextPath();
		System.out.println("주소표시줄에 " + url + "/ 이 입력되었습니다.");
		
		List<RestBean> restTop3List = new ArrayList<RestBean>();
		restTop3List = restService.getRestTop3();
		
		model.addAttribute("restTop3List", restTop3List);
		
		return "index";
	}
	
}
