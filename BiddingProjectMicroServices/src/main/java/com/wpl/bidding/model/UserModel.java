package com.wpl.bidding.model;

import com.wpl.bidding.persist.User;

public class UserModel {

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
