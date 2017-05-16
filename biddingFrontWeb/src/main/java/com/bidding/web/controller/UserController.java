/**
 * 
 */
package com.bidding.web.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.bidding.web.common.ConstantMessages;
import com.bidding.web.common.Route;
import com.bidding.web.model.ItemModel;
import com.bidding.web.model.User;
import com.bidding.web.model.UserModel;

/**
 * @author Manisha
 *
 */
@Controller
public class UserController {
	@RequestMapping(value = "/edituser", method = RequestMethod.GET)
	public String edituserprof(@RequestParam("userId") int userId ,HttpServletRequest request,ModelMap model) throws ParseException {
		User userDetails = new User();
		userDetails.setUserId(Integer.parseInt(request.getParameter("userId")));
		userDetails.setUserName(request.getParameter("userName"));
		userDetails.setPassword(request.getParameter("password"));
		userDetails.setCity(request.getParameter("city"));
		userDetails.setCountry(request.getParameter("country"));
		String date1 = request.getParameter("DOB");
		DateFormat format = new SimpleDateFormat("E MMM dd HH:mm:ss Z yyyy", Locale.ENGLISH);
		Date date = format.parse(date1);
		Calendar cal = Calendar.getInstance();
		    cal.setTime(date);
		String formatedDate = cal.get(Calendar.YEAR) + "-" + 
		            (cal.get(Calendar.MONTH) + 1) + 
		            "-" +         cal.get(Calendar.MONTH);
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Date date2 = format1.parse(formatedDate);
		userDetails.setDOB(date2);
		System.out.print(date1);
		userDetails.setDOB(date2);
		System.out.print(date1);
		userDetails.setEmail(request.getParameter("email"));
		userDetails.setFirstName(request.getParameter("firstName"));
		String firstName = request.getParameter("firstName");
		System.out.print(firstName);
		userDetails.setLastName(request.getParameter("lastName"));
		userDetails.setLocation(request.getParameter("location"));
		userDetails.setMobile(request.getParameter("mobile"));
		userDetails.setSex(request.getParameter("sex"));
		userDetails.setState(request.getParameter("state"));
		userDetails.setStreetName(request.getParameter("streetName"));
		userDetails.setZipcode(request.getParameter("zipcode"));
	   	model.addAttribute("user", userDetails);
		return "profileEdit";
	}
	
	@RequestMapping(value = "/getUserProfile", method = RequestMethod.GET)
	public String getUserProfile(@RequestParam("userId") int userId ,HttpServletRequest request,ModelMap model) {
		UserModel customer = new UserModel();
		if(userId==0)
		{
			model.addAttribute("errorMessage", ConstantMessages.serverError);
			return "error";
		}
		try {	
			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.set("accessToken", "Manisha");
			UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(Route.basePath+Route.getProfileInfoUrl);
			builder.queryParam("userId", userId);
			
		    customer = restTemplate.getForObject(builder.build().encode().toUri(), UserModel.class);
		    if(customer.getResponse().getResponseCode().equalsIgnoreCase(ConstantMessages.successCode))
		    	{
		   			model.addAttribute("user", customer.getUserDetails());
		   			return "myProfile";
		    	}
		    else
		    	{
		    		model.addAttribute("errorMessage", customer.getResponse().getResponseMessage());
		    		return "error";
		    	}
	} catch (Exception e) {
		e.printStackTrace();
	}
		return "error";
	}
	
	
	@RequestMapping(value = "/editUserProfile", method = RequestMethod.POST)
	public String editUserProfile(HttpServletRequest request,ModelMap model) throws ParseException {
		UserModel customer = new UserModel();
		//Get values from the form for registering a new user
		User userDetails = new User();
		userDetails.setUserId(Integer.parseInt(request.getParameter("userId")));
		userDetails.setUserName(request.getParameter("userName"));
		userDetails.setPassword(request.getParameter("password"));
		userDetails.setCity(request.getParameter("city"));
		userDetails.setCountry(request.getParameter("country"));
		String date1 = request.getParameter("DOB");
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Date date2 = format1.parse(date1);
		userDetails.setDOB(date2);
		userDetails.setEmail(request.getParameter("email"));
		userDetails.setFirstName(request.getParameter("firstName"));
		userDetails.setLastName(request.getParameter("lastName"));
		userDetails.setLocation(request.getParameter("location"));
		userDetails.setMobile(request.getParameter("mobile"));
		userDetails.setSex(request.getParameter("sex"));
		userDetails.setState(request.getParameter("state"));
		userDetails.setStreetName(request.getParameter("streetName"));
		userDetails.setZipcode(request.getParameter("zipcode"));
		if(userDetails.getUserId()==0)
		{
			model.addAttribute("message", ConstantMessages.serverError);
			return "error";
		}
		try {	
			RestTemplate restTemplate = new RestTemplate();
			ItemModel res = new ItemModel();
		    res = restTemplate.postForObject(Route.basePath+"/editProfileInfo?",userDetails, ItemModel.class);
		    if(res.getResponse().getResponseCode().equalsIgnoreCase(ConstantMessages.successCode))
		    	{
		   			model.addAttribute("message", res.getResponse().getResponseMessage());
		   			model.addAttribute("user",userDetails);
		   			return "homePage";
		    	}
		    else
		    	{
		    		model.addAttribute("message", customer.getResponse().getResponseMessage());
		    		return "error";
		    	}
	} catch (Exception e) {
		e.printStackTrace();
	}
		return "error";
	}
	
	

}
