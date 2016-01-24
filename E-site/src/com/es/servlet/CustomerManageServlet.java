package com.es.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.es.dao.bean.customerBean;
import com.es.dao.factory.DAOFactory;
import com.es.dao.pub.PublicStrIsNull;


public class CustomerManageServlet extends MyServlet {

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
		if(action.equals("customerList")) {
			String suser=PublicStrIsNull.isNullStr(request.getParameter("suser"));
			String sname=PublicStrIsNull.isNullStr(request.getParameter("sname"));
			int recordSize = DAOFactory.createCustomerDAO().getCount(suser, sname);
			int pastart= this.pagingHandle(request, recordSize)[0];
			int paend= this.pagingHandle(request, recordSize)[1];
			if(pastart<=0)pastart=1;
			request.setAttribute("customerList", DAOFactory.createCustomerDAO().searchUser(suser, sname,  pastart, paend));
			request.setAttribute("suser", suser);
			request.setAttribute("sname", sname);
		} else if(action.equals("customeredit")) {
			String first = PublicStrIsNull.isNullStr(request.getParameter("first"));
			String suser = PublicStrIsNull.isNullStr(request.getParameter("suser"));
			customerBean userBean = DAOFactory.createCustomerDAO().searchUser(suser);
			if(first.equals("update")) {
				userBean.setCname(request.getParameter("sname"));
				userBean.setCsex(request.getParameter("ssex"));
				userBean.setCphone(request.getParameter("sphone"));
				userBean.setCemail(request.getParameter("semail"));
				userBean.setCaddress(request.getParameter("saddress"));
				DAOFactory.createCustomerDAO().updateUser(userBean);
				String msg = "顾客信息更改成功！";
				response.sendRedirect(request.getContextPath() + fromPage + "?username=" + suser + "&msg="
						+ java.net.URLEncoder.encode(msg, "UTF-8"));
				return;
			}
			request.setAttribute("userBean",userBean);
		} else if(action.equals("customerinfo")) {
			String suser = PublicStrIsNull.isNullStr(request.getParameter("suser"));
			customerBean userBean = DAOFactory.createCustomerDAO().searchUser(suser);
			request.setAttribute("userBean",userBean);
		} else if(action.equals("delcustomer")) {
			String suser = PublicStrIsNull.isNullStr(request.getParameter("del"));
			DAOFactory.createCustomerDAO().deleteUser(suser);
			String msg = "删除成功!";
			response.sendRedirect(request.getContextPath() + fromPage + "?msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
			return;
		}
		request.getRequestDispatcher(fromPage).forward(request, response);
	}

}
