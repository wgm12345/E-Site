﻿package com.es.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.es.dao.bean.customerBean;
import com.es.dao.factory.DAOFactory;
import com.es.dao.pub.PublicStrIsNull;

/**
 * 用于处理前台用户注册Servlet
 *
 */
public class RegServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private String msgStr = "";

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String oprate = request.getParameter("oprate").trim();
		String suser = request.getParameter("suser");
		if (oprate.equals("chkUser")) {
			response.setContentType("text/html;charset=utf-8");
			customerBean user = DAOFactory.createCustomerDAO().searchUser(suser);
			if (user != null) {
				msgStr = "<img src='"+ request.getContextPath() +"/images/check_error.gif'  /> 对不起,此用户名已存在,请更换用户名注册!";
			} else {
				msgStr = "";
			}
			response.getWriter().write(msgStr);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		//解决编码问题
		 request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String suser = request.getParameter("suser");
		String fromPage = PublicStrIsNull.isNullStr(request.getParameter("fromPage"));
		String msgPage = PublicStrIsNull.isNullStr(request.getParameter("msg"));
		String rand = request.getParameter("rand");
		String srand = (String) session.getAttribute("rand");
		session.removeAttribute("rand");
		String msg = "";
		if (rand.equals(srand)) {
			if (DAOFactory.createCustomerDAO().searchUser(suser) == null) {
				customerBean user = new customerBean();
				user.setCid(PublicStrIsNull.isNullStr(suser));
				user.setCpwd(PublicStrIsNull.isNullStr(request.getParameter("spwd")));
				user.setCname(PublicStrIsNull.isNullStr(request.getParameter("sname")));
				System.out.println("名字是"+user.getCname());
				user.setCsex(PublicStrIsNull.isNullStr(request.getParameter("ssex")));
				user.setCphone(PublicStrIsNull.isNullStr(request.getParameter("sphone")));
				user.setCemail(PublicStrIsNull.isNullStr(request.getParameter("semail")));
				user.setCaddress(PublicStrIsNull.isNullStr(request.getParameter("saddress")));
				DAOFactory.createCustomerDAO().insertUser(user);
				session.setAttribute("user", DAOFactory.createCustomerDAO().searchUser(
						suser));
				msg = "注册成功, 3 秒后自动转入会员中心..........";
				fromPage = request.getContextPath() + "/Customer/Change_Info.jsp";
				response.sendRedirect(request.getContextPath() + msgPage + "?fromPage=" + fromPage + "&msg="
						+ java.net.URLEncoder.encode(msg, "UTF-8"));
			} else {
				msg = "用户已存在,请更换用户名,3 秒后自动返回..........";
				response.sendRedirect(request.getContextPath() + msgPage + "?fromPage=" + request.getContextPath() + fromPage + "&msg="
						+ java.net.URLEncoder.encode(msg, "UTF-8"));
			}
		} else {
			msg = "验证码输入错误.请重新输入!";
			response.sendRedirect(request.getContextPath() + msgPage + "?fromPage=" + request.getContextPath() + fromPage + "&msg="
					+ java.net.URLEncoder.encode(msg, "UTF-8"));
		}
	}
}
