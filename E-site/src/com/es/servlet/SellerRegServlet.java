﻿package com.es.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.es.dao.bean.sellerBean;
import com.es.dao.factory.DAOFactory;

/**
 * 用于seller用户注册Servlet
 *
 */
public class SellerRegServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private String msgStr = "";

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String oprate = request.getParameter("oprate").trim();
		String suser = request.getParameter("suser");
		if (oprate.equals("chkUser")) {
			response.setContentType("texy/html;charset=gb2312");
			sellerBean user = DAOFactory.createSellerDAO().searchUser(suser);
			if (user != null) {
				msgStr = "<img src='"+ request.getContextPath() +"/images/check_error.gif'  /> 对不起,此用户名已存在,请更换用户名注册!";
			} else {
				msgStr = "";
			}
			response.getWriter().write(msgStr);
		}
	}
//http://dapp:8080/EaterNet_test/msg.jsp?fromPage=/EaterNet_test/Customer_Reg.jsp&msg=%D1%E9%D6%A4%C2%EB%CA%E4%C8%EB%B4%ED%CE%F3.%C7%EB%D6%D8%D0%C2%CA%E4%C8%EB%21
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}
