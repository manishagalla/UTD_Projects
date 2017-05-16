package com.bidding.web.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.bidding.web.common.ConstantMessages;
import com.bidding.web.common.Route;
import com.bidding.web.model.Login;
import com.bidding.web.model.User;
import com.bidding.web.model.UserModel;
import com.bidding.web.utils.MemCacheUtils;
@Controller
public class LoginController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String landingPage(HttpServletRequest request,ModelMap model) {
		return "login";
	}
	@RequestMapping(value = "/hithomepage", method = RequestMethod.GET)
	public String hitHomePage(HttpServletRequest request,ModelMap model) {
		return "homePage";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutback(HttpServletRequest request,ModelMap model) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "login";
	}
	
	@RequestMapping(value = "/registernewUser", method = RequestMethod.GET)
	public String registerNew(ModelMap model) {
		return "registration";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request,ModelMap model) throws IOException {
		UserModel customer = new UserModel();
		Login userDetails = new Login();
		userDetails.setUsername(request.getParameter("userName"));
		userDetails.setPassword(request.getParameter("password"));
	//	userDetails.setLocation(GeoLocationUtils.getLocation("33.0006239", "-96.7771018"));
		userDetails.setLocation("UTD");
		if(userDetails.getUsername() == null || userDetails.getPassword() == null)
		{
			model.addAttribute("errorMessage", ConstantMessages.wrongUserNameOrPassword);
			return "login-error";
		}
		try {	
			if(MemCacheUtils.getKeyFromCache(userDetails.getUsername()) != null)
			{
				//customer.setUserDetails(MemCacheUtils.getKeyFromCache(userDetails.getUsername()));
				HttpSession session = request.getSession();
				session.setAttribute("userId", customer.getUserDetails().getUserId());
				session.setAttribute("firstname",customer.getUserDetails().getFirstName());
				session.setAttribute("lastname",customer.getUserDetails().getLastName());
				session.setAttribute("mobile",customer.getUserDetails().getMobile());
				session.setAttribute("email",customer.getUserDetails().getEmail());
				session.setAttribute("location",customer.getUserDetails().getLocation());
				session.setAttribute("lastlogin",customer.getUserDetails().getModifiedDate());
				model.addAttribute("user", customer.getUserDetails());
				model.addAttribute("errorMessage", customer.getUserDetails().getFirstName()+" "+customer.getUserDetails().getLastName());
				return "homePage";
			}
			RestTemplate restTemplate = new RestTemplate();
			customer = restTemplate.postForObject(Route.basePath+Route.loginUrl,userDetails, UserModel.class);
		if(customer.getResponse().getResponseCode().equalsIgnoreCase(ConstantMessages.successCode))
		{
			HttpSession session = request.getSession();
			session.setAttribute("userId", customer.getUserDetails().getUserId());
			session.setAttribute("firstname",customer.getUserDetails().getFirstName());
			session.setAttribute("lastname",customer.getUserDetails().getLastName());
			session.setAttribute("mobile",customer.getUserDetails().getMobile());
			session.setAttribute("email",customer.getUserDetails().getEmail());
			session.setAttribute("location",customer.getUserDetails().getLocation());
			session.setAttribute("lastlogin",customer.getUserDetails().getModifiedDate());
			model.addAttribute("user", customer.getUserDetails());
			model.addAttribute("errorMessage", customer.getUserDetails().getFirstName()+" "+customer.getUserDetails().getLastName());
			return "homePage";
		}
		else
		{
			model.addAttribute("errorMessage", customer.getResponse().getResponseMessage());
			return "login-error";
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
		return "login-error";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(HttpServletRequest request,ModelMap model) throws ParseException {
		UserModel customer = new UserModel();
		//Get values from the form for registering a new user
		User userDetails = new User();
		userDetails.setUserName(request.getParameter("userName"));
		userDetails.setPassword(request.getParameter("password"));
		userDetails.setCity(request.getParameter("city"));
		userDetails.setCountry(request.getParameter("country"));
		String date1 = request.getParameter("DOB");
		DateFormat format = new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH);
		Date date = format.parse(date1);
		userDetails.setDOB(date);
		userDetails.setEmail(request.getParameter("email"));
		userDetails.setFirstName(request.getParameter("firstName"));
		userDetails.setLastName(request.getParameter("lastName"));
		userDetails.setLocation(request.getParameter("location"));
		userDetails.setMobile(request.getParameter("mobile"));
		userDetails.setSex(request.getParameter("sex"));
		userDetails.setState(request.getParameter("state"));
		userDetails.setStreetName(request.getParameter("streetName"));
		userDetails.setZipcode(request.getParameter("zipcode"));
		
		try {	
			RestTemplate restTemplate = new RestTemplate();
			customer = restTemplate.postForObject(Route.basePath+Route.registerUrl,userDetails, UserModel.class);
		if(customer.getResponse().getResponseCode().equalsIgnoreCase(ConstantMessages.creationCode))
		{
			HttpSession session = request.getSession();
			session.setAttribute("user", customer.getUserDetails());
			model.addAttribute("name", customer.getUserDetails().getFirstName()+" "+customer.getUserDetails().getLastName());
			//MemCacheUtils.keepInCache(customer.getUserDetails().getUserName(), customer.getUserDetails());
			return "login";
		}
		else
		{
			model.addAttribute("errorMessage", customer.getResponse().getResponseMessage());
			return "register-error";
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
		return "register-error";
	}
}
