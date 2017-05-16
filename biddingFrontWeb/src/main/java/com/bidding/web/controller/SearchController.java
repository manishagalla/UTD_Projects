/**
 * 
 */
package com.bidding.web.controller;

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
import com.bidding.web.utils.MemCacheUtils;


/**
 * @author Manisha
 *
 */
@Controller
public class SearchController {
	
	@RequestMapping(value = "/searchItems", method = RequestMethod.GET,produces="application/json")	
	public  String searchItem(@RequestParam(value = "searchKeyword") String keyword,@RequestParam(value="userId") int userId,ModelMap map) {	
		if(keyword == null || userId == 0)
		{
			map.addAttribute("errorMessage", ConstantMessages.noSearchKeyword);
			return "searchError";
		}
		if(keyword.equals("noKeyword")){
			keyword="";
		}
		
		ItemModel itemList = new ItemModel();
		MemCacheUtils.getKeyFromCache(keyword);
		RestTemplate restTemplate = new RestTemplate();
		UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(Route.basePath+Route.searchItems);
		builder.queryParam("searchKeyword", keyword);
		builder.queryParam("userId", userId);
		System.out.println("Url: "+builder.build().encode().toUriString());

	    itemList = restTemplate.getForObject(builder.build().encode().toUri(), ItemModel.class);
		if(itemList.getResponse().getResponseCode().equalsIgnoreCase(ConstantMessages.successCode))
		{
			map.addAttribute("itemList",itemList.getItemList());
			MemCacheUtils.keepInCache(keyword, itemList.getItemList());
			return "itemsList";
		}
		else
		{
			map.addAttribute("errorMessage", ConstantMessages.serverError);
			return "error";
		}
	}
}
