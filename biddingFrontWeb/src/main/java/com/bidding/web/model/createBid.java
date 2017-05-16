/**
 * 
 */
package com.bidding.web.model;

/**
 * @author Manisha
 *
 */
public class createBid {

	String productName;
	String productDescription;
	int price;
	String imageUrl;
	int bid_userid;
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBid_userid() {
		return bid_userid;
	}
	public void setBid_userid(int bid_userid) {
		this.bid_userid = bid_userid;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
}
