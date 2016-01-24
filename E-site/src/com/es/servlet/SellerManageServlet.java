﻿package com.es.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.es.dao.bean.sellerBean;
import com.es.dao.factory.DAOFactory;
import com.es.dao.pub.PublicStrIsNull;


public class SellerManageServlet extends MyServlet {

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
		if(action.equals("sellerList")) {
			String suser=PublicStrIsNull.isNullStr(request.getParameter("suser"));
			String sname=PublicStrIsNull.isNullStr(request.getParameter("sname"));
			int recordSize = DAOFactory.createSellerDAO().getCount(suser, sname);
			int pastart= this.pagingHandle(request, recordSize)[0];
			int paend= this.pagingHandle(request, recordSize)[1];
			if(pastart<=0)pastart=1;
			request.setAttribute("sellerList", DAOFactory.createSellerDAO().searchUser(suser, sname,  pastart, paend));
			request.setAttribute("suser", suser);
			request.setAttribute("sname", sname);

		} else if(action.equals("selleradd")) {
			String msg = "";
			String suser = request.getParameter("suser");
			if (DAOFactory.createSellerDAO().searchUser(suser) == null) {
				sellerBean seller = new sellerBean();
				seller.setSid(PublicStrIsNull.isNullStr(suser));
				seller.setSpwd(PublicStrIsNull.isNullStr(request.getParameter("spwd")));
				seller.setSname(PublicStrIsNull.isNullStr(request.getParameter("sname")));
				seller.setSphone(PublicStrIsNull.isNullStr(request.getParameter("sphone")));
				seller.setSdescription(PublicStrIsNull.isNullStr(request.getParameter("sdescription")));
				seller.setSemail(PublicStrIsNull.isNullStr(request.getParameter("semail")));
				seller.setSaddress(PublicStrIsNull.isNullStr(request.getParameter("saddress")));
				DAOFactory.createSellerDAO().insertUser(seller);
				msg = "Add success! Return the list of sellers.";
				response.sendRedirect(request.getContextPath() + fromPage + "?success=success&msg="
						+ java.net.URLEncoder.encode(msg, "gb2312"));
				return;
			} else {
				msg = "The seller already exists, please change your username";
				response.sendRedirect(request.getContextPath() + fromPage + "?msg="
						+ java.net.URLEncoder.encode(msg, "gb2312"));
				return;
			}

		} else if(action.equals("selleredit")) {
			String first = PublicStrIsNull.isNullStr(request.getParameter("first"));
			String suser = PublicStrIsNull.isNullStr(request.getParameter("suser"));
			sellerBean seller = DAOFactory.createSellerDAO().searchUser(suser);
			if(first.equals("update")) {
				seller.setSid(PublicStrIsNull.isNullStr(suser));
				seller.setSpwd(PublicStrIsNull.isNullStr(request.getParameter("spwd")));
				seller.setSname(PublicStrIsNull.isNullStr(request.getParameter("sname")));
				seller.setSphone(PublicStrIsNull.isNullStr(request.getParameter("sphone")));
				seller.setSpraise(seller.getSpraise());
				seller.setSlastdate(seller.getSlastdate());
				seller.setSdescription(PublicStrIsNull.isNullStr(request.getParameter("sdescription")));
				seller.setSemail(PublicStrIsNull.isNullStr(request.getParameter("semail")));
				seller.setSaddress(PublicStrIsNull.isNullStr(request.getParameter("saddress")));
				DAOFactory.createSellerDAO().updateUser(seller);
				String msg = "The seller data updated successfully！";
				response.sendRedirect(request.getContextPath() + fromPage + "?username=" + suser + "&msg="
						+ java.net.URLEncoder.encode(msg, "gb2312"));
				return;
			}
			request.setAttribute("userBean",seller);
		} else if(action.equals("sellerinfo")) {
			String suser = PublicStrIsNull.isNullStr(request.getParameter("suser"));
			sellerBean userBean = DAOFactory.createSellerDAO().searchUser(suser);
			request.setAttribute("userBean",userBean);
		} else if(action.equals("delseller")) {	
			String suser = PublicStrIsNull.isNullStr(request.getParameter("del"));
			DAOFactory.createSellerDAO().deleteUser(suser);
			String msg = "Delete success!";
			response.sendRedirect(request.getContextPath() + fromPage + "?msg=" + java.net.URLEncoder.encode(msg, "gb2312"));
			return;
		}
		request.getRequestDispatcher(fromPage).forward(request, response);
	}

}
