package com.bidding.web.model;

public class UserModel {

	public UserModel() {
		
	}
	public Response response;
	public User userDetails;

	public Response getResponse() {
		return response;
	}

	public void setResponse(Response response) {
		this.response = response;
	}

	public User getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(User userDetails) {
		this.userDetails = userDetails;
	}
}
