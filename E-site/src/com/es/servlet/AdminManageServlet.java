﻿package com.es.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.es.dao.bean.managerBean;
import com.es.dao.bean.sellerBean;
import com.es.dao.factory.DAOFactory;
import com.es.dao.pub.PublicStrIsNull;


public class AdminManageServlet extends MyServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fromPage = PublicStrIsNull.isNullStr(request.getParameter("fromPage"));
		String action = PublicStrIsNull.isNullStr(request.getParameter("act"));
		if(action.equals("adminList")) {
			String suser=PublicStrIsNull.isNullStr(request.getParameter("suser"));
			String sname=PublicStrIsNull.isNullStr(request.getParameter("sname"));
			int recordSize = DAOFactory.createManagerDAO().getCount(suser, sname);
			int pastart= this.pagingHandle(request, recordSize)[0];
			int paend= this.pagingHandle(request, recordSize)[1];
			if(pastart<=0)pastart=1;
			request.setAttribute("adminList", DAOFactory.createManagerDAO().searchUser(suser, sname,  pastart, paend));
			request.setAttribute("suser", suser);
			request.setAttribute("sname", sname);

		} else if(action.equals("adminadd")) {
			String msg = "";
			String suser = request.getParameter("suser");
			if (DAOFactory.createManagerDAO().searchUser(suser) == null) {
				managerBean admin = new managerBean();
				admin.setMid(PublicStrIsNull.isNullStr(suser));
				admin.setMpwd(PublicStrIsNull.isNullStr(request.getParameter("spwd")));
				admin.setMname(PublicStrIsNull.isNullStr(request.getParameter("sname")));
				admin.setMsex(PublicStrIsNull.isNullStr(request.getParameter("ssex")));
				admin.setMphone(PublicStrIsNull.isNullStr(request.getParameter("sphone")));
				admin.setMemail(PublicStrIsNull.isNullStr(request.getParameter("semail")));
				admin.setMaddress(PublicStrIsNull.isNullStr(request.getParameter("saddress")));
				DAOFactory.createManagerDAO().insertUser(admin);
				msg = "添加成功!返回列表。";
				response.sendRedirect(request.getContextPath() + fromPage + "?success=success&msg="
						+ java.net.URLEncoder.encode(msg, "UTF-8"));
				return;
			} else {
				msg = "管理员已经存在,请更改用户名 ！";
				response.sendRedirect(request.getContextPath() + fromPage + "?msg="
						+ java.net.URLEncoder.encode(msg, "UTF-8"));
				return;
			}

		} else if(action.equals("adminedit")) {
			String first = PublicStrIsNull.isNullStr(request.getParameter("first"));
			String suser = PublicStrIsNull.isNullStr(request.getParameter("suser"));
			managerBean userBean = DAOFactory.createManagerDAO().searchUser(suser);
			if(first.equals("update")) {
				userBean.setMname(request.getParameter("sname"));
				userBean.setMsex(request.getParameter("ssex"));
				userBean.setMphone(request.getParameter("sphone"));
				userBean.setMemail(request.getParameter("semail"));
				userBean.setMaddress(request.getParameter("saddress"));
				DAOFactory.createManagerDAO().updateUser(userBean);
				String msg = "管理员数据更新成功！";
				response.sendRedirect(request.getContextPath() + fromPage + "?username=" + suser + "&msg="
						+ java.net.URLEncoder.encode(msg, "UTF-8"));
				return;
			}
			request.setAttribute("userBean",userBean);
		} else if(action.equals("admininfo")) {
			System.out.println("hhhh");
			String suser = PublicStrIsNull.isNullStr(request.getParameter("suser"));
			sellerBean userBean = DAOFactory.createSellerDAO().searchUser(suser);
			request.setAttribute("userBean",userBean);
		} else if(action.equals("deladmin")) {	
			String suser = PublicStrIsNull.isNullStr(request.getParameter("del"));
			managerBean userBean =DAOFactory.createManagerDAO().searchUser(suser);
			if(userBean.getMlevel()!=1){	
				DAOFactory.createManagerDAO().deleteUser(suser);
				String msg = "删除成功!";
				response.sendRedirect(request.getContextPath() + fromPage + "?msg=" + java.net.URLEncoder.encode(msg, "gb2312"));
				return;
			}
			else{
				String  msg = "你不能删除管理员!";
				response.sendRedirect(request.getContextPath() + fromPage + "?msg="
						+ java.net.URLEncoder.encode(msg, "UTF-8"));
				return;
			}
		}
		request.getRequestDispatcher(fromPage).forward(request, response);
	}

}
