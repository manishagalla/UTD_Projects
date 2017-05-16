package com.bidding.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.bidding.web.common.ConstantMessages;
import com.bidding.web.common.Route;
import com.bidding.web.model.Item;
import com.bidding.web.model.ItemModel;
import com.bidding.web.model.Response;
import com.bidding.web.model.User;

@Controller
public class BidController {
	@RequestMapping(value = "/bid", method = RequestMethod.GET)
	public String Bid1(@RequestParam("userId") int userId, @RequestParam("itemId") int itemId,@RequestParam("itemPrice") float itemPrice, HttpServletRequest request,ModelMap model) throws IOException {
		
		if(itemId == 0 || itemPrice ==0 || userId ==0)
		{
			model.addAttribute("errorMessage", ConstantMessages.mandatoryParamsMissing);
			return "errorMessage";
		}
		model.addAttribute("itemId",itemId);
	    model.addAttribute("userId",userId);
	    model.addAttribute("itemPrice",itemPrice);
		return "bidItem";
	}
	
	@RequestMapping(value = "/deleteBid", method = RequestMethod.POST)
	public String deleteBid(@RequestParam("userId") int userId, @RequestParam("itemId") int itemId,HttpServletRequest request,ModelMap model) throws IOException {
		ItemModel response = new ItemModel();
		if(itemId == 0 || userId ==0)
		{
			model.addAttribute("errorMessage", ConstantMessages.mandatoryParamsMissing);
			return "errorMessage";
		}
		RestTemplate restTemplate = new RestTemplate();
		UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(Route.basePath+Route.deleteBid);
		builder.queryParam("userId", userId);
		builder.queryParam("itemId", itemId);
	    response = restTemplate.getForObject(builder.build().encode().toUri(), ItemModel.class);
	    model.addAttribute("message",response.getResponse().getResponseMessage());
		return myPostedItems(userId, request, model);
	}
	
	
	@RequestMapping(value = "/bidItemAttempt", method = RequestMethod.GET)
	public String checkNewBid(@RequestParam("userId") int userId, @RequestParam("itemPrice") float itemPrice, @RequestParam("itemId") int itemId, @RequestParam("bidValue") float bidValue,HttpServletRequest request,ModelMap model) throws IOException {
		if(itemId == 0 || bidValue ==0 || userId ==0)
		{
			model.addAttribute("errorMessage", ConstantMessages.mandatoryParamsMissing);
			return "errorMessage";
		}
		else if( bidValue> itemPrice)
			return createNewBid(userId, itemId, bidValue, request, model);
		model.addAttribute("message", ConstantMessages.LargerValue);
	return "error";
	}
	@RequestMapping(value = "/bidItem", method = RequestMethod.POST)
	public String createNewBid(@RequestParam("userId") int userId, @RequestParam("itemId") int itemId, @RequestParam("bidValue") float bidValue,HttpServletRequest request,ModelMap model) throws IOException {
		ItemModel response = new ItemModel();
		if(itemId == 0 || bidValue ==0 || userId ==0)
		{
			model.addAttribute("errorMessage", ConstantMessages.mandatoryParamsMissing);
			return "errorMessage";
		}
		RestTemplate restTemplate = new RestTemplate();
		UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(Route.basePath+Route.bidForItem);
		builder.queryParam("bidValue", bidValue);
		builder.queryParam("userId", userId);
		builder.queryParam("itemId", itemId);
	    response = restTemplate.getForObject(builder.build().encode().toUri(), ItemModel.class);
	    model.addAttribute("message",response.getResponse().getResponseMessage());
		return "homePage";
	}
	@RequestMapping(value = "/createnewbid", method = RequestMethod.GET)
	public String createNew(ModelMap model) {
		return "createNewBid";
	}
	
	@RequestMapping(value = "/purchaseHistory", method = RequestMethod.GET)
	public String purchaseItem(@RequestParam("userId") int userId, ModelMap model) {
		ItemModel itemResponse = new ItemModel();
		System.out.print("Request received");
		RestTemplate restTemplate = new RestTemplate();
		UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(Route.basePath+Route.purchaseHistory);
		builder.queryParam("userId", userId);
		itemResponse = restTemplate.getForObject(builder.build().encode().toUri(), ItemModel.class);
		if(itemResponse.getResponse().getResponseCode().equalsIgnoreCase(ConstantMessages.successCode)){
			model.addAttribute("itemList",itemResponse.getItemList());
			return "purchasedItems";
		}
		else{
			model.addAttribute("message", ConstantMessages.Empty);
			return "error";
		}
			
	}
	
	@RequestMapping(value= "/sortItems",method = RequestMethod.GET)
	public String sortPostedItems(@RequestParam(value = "sort") String sort,@RequestParam(value = "userId") int userId,HttpServletRequest request,ModelMap model) throws IOException
	{	
		ItemModel itemResponse = new ItemModel();
		List<Item> item = new ArrayList<Item>();
					RestTemplate restTemplate = new RestTemplate();
					UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(Route.basePath+Route.myPostedItems);
					builder.queryParam("userId", userId);
					itemResponse  = restTemplate.getForObject(builder.build().encode().toUri(), ItemModel.class);
			item = itemResponse.getItemList();
			if(itemResponse.getResponse().getResponseCode().equalsIgnoreCase(ConstantMessages.successCode))
			{
				if(sort.equalsIgnoreCase("name"))
				{
				Collections.sort(item, new Comparator<Item>() {
				    public int compare(Item item1, Item item2) {
				      return item1.getItemName().compareTo(item2.getItemName());
				    }
				});
				}
				if(sort.equalsIgnoreCase("date"))
				{
				Collections.sort(item, new Comparator<Item>() {
				    public int compare(Item item1, Item item2) {
				      return item1.getCreatedDate().compareTo(item2.getCreatedDate());
				    }
				});
				}
				model.addAttribute("itemList",item);
				return "postedItems";
			}
			else
			{
				model.addAttribute("message",itemResponse.getResponse().getResponseMessage());
				return "error";
			}
		}
	
	@RequestMapping(value= "/myPostedItems",method = RequestMethod.GET)
	public String myPostedItems(@RequestParam(value = "userId") int userId,HttpServletRequest request,ModelMap model) throws IOException
	{	
		ItemModel itemResponse = new ItemModel();
		if(userId == 0)
		{
			model.addAttribute("errorMessage","UserID not sent");
			return "error";
		}
		else
		{
					RestTemplate restTemplate = new RestTemplate();
					UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(Route.basePath+Route.myPostedItems);
					builder.queryParam("userId", userId);
					itemResponse  = restTemplate.getForObject(builder.build().encode().toUri(), ItemModel.class);

			}
		
			if(itemResponse.getResponse().getResponseCode().equalsIgnoreCase(ConstantMessages.successCode))
			{
				model.addAttribute("itemList",itemResponse.getItemList());
				return "postedItems";
			}
			else
			{
				model.addAttribute("message",itemResponse.getResponse().getResponseMessage());
				return "error";
			}
		}
	
	@RequestMapping(value= "/myBids",method = RequestMethod.GET)
	public String myBidItems(@RequestParam(value = "userId") int userId,HttpServletRequest request,ModelMap model) throws IOException
	{	
		ItemModel itemResponse = new ItemModel();
		if(userId == 0)
		{
			model.addAttribute("errorMessage","UserID not sent");
			return "error";
		}
		else
		{
			RestTemplate restTemplate = new RestTemplate();
			UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(Route.basePath+Route.myBids);
			builder.queryParam("userId", userId);
			itemResponse  = restTemplate.getForObject(builder.build().encode().toUri(), ItemModel.class);
			if(itemResponse.getResponse().getResponseCode().equalsIgnoreCase(ConstantMessages.successCode))
			{
				model.addAttribute("itemList",itemResponse.getItemList());
				return "myBids";
			}
			else
			{
				model.addAttribute("message",itemResponse.getResponse().getResponseMessage());
				return "error";
			}
		}
	}
	
	@RequestMapping(value = "/closeBid", method = RequestMethod.GET,produces="application/json")	
	public String closeBid(ModelMap model,@RequestParam(value="userId") int userId, @RequestParam(value="itemId") int itemId) {
		ItemModel response = new ItemModel();
		RestTemplate restTemplate = new RestTemplate();
		UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(Route.basePath+"closeBid");
		builder.queryParam("userId", userId);
		builder.queryParam("itemId", itemId);
		response = restTemplate.getForObject(builder.build().encode().toUri(), ItemModel.class);	
		if(response.getResponse().getResponseCode().equalsIgnoreCase(ConstantMessages.successCode))
		{
			model.addAttribute("message", response.getResponse().getResponseMessage());
		}
		else
		{
			model.addAttribute("errorMessage", response.getResponse().getResponseMessage());
		}
		return "homePage";
	}
	
	
	
	
	@RequestMapping(value = "/createdItem", method = RequestMethod.POST)
	public String createNewBid(HttpServletRequest request,ModelMap model) throws IOException {
		Item item = new Item();
		User user = new User();
		ItemModel response = new ItemModel();
		Response res = new Response();
		user.setUserId(Integer.parseInt(request.getParameter("userId")));
		item.setCreatedDate(new Date());
		item.setImageUrl(request.getParameter("imageUrl"));
		item.setItemDesc(request.getParameter("itemDesc"));
		item.setItemName(request.getParameter("itemName"));
		item.setItemPrice(Float.parseFloat(request.getParameter("itemPrice")));
		item.setStatus("CREATED");
		item.setCreatedDate(new Date(System.currentTimeMillis()));
		item.setUserId(user);
		
		RestTemplate restTemplate = new RestTemplate();
	    response  = restTemplate.postForObject(Route.basePath+Route.createNewBid,item,ItemModel.class);
		if(response.getResponse().getResponseCode().equalsIgnoreCase(ConstantMessages.successCode))
		{
			model.addAttribute("message", response.getResponse().getResponseMessage());
		}
		else
		{
			model.addAttribute("errorMessage", response.getResponse().getResponseMessage());
		}
		return "homePage";
	}
	
}

