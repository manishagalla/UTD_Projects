///**
// * 
// */
//package com.bidding.web.filter;
//
//import java.io.IOException;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//
///**
// * @author Manisha
// *
// */
//public class filterRequests implements Filter {
//
//	    @Override
//	    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//	            throws IOException, ServletException {
//	    	HttpServletRequest req = (HttpServletRequest) request;
//	    	 HttpSession session = ((HttpServletRequest) request).getSession();
//	    	 if(req.getRequestURI().endsWith("frontend/") || req.getRequestURI().endsWith("jpg") || req.getRequestURI().endsWith("login") || req.getRequestURI().endsWith("registration"))
//	    	 {
//	    		 chain.doFilter(request, response);
//	    	 }
//	    	
//	    	 else{
//	    		 if(session.getAttribute("user") != null)
//	    		 chain.doFilter(request, response);
//	    		 else
//	    		 {
//	    			 HttpServletResponse res = (HttpServletResponse) response;
//	    			 res.sendRedirect("http://localhost:8090/frontend/");
//	    		 }
//	    	 }
//	    }
//
//	    @Override
//	    public void init(FilterConfig filterConfig) throws ServletException {
//	       System.out.println("CorsFilter initiated");
//	    }
//
//		@Override
//		public void destroy() {
//			 System.out.println("CorsFilter closed");
//		}
//	}
//
