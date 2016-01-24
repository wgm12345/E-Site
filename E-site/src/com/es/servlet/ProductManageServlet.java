﻿package com.es.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.es.dao.bean.ProductBean;
import com.es.dao.bean.sellerBean;
import com.es.dao.factory.DAOFactory;
import com.es.dao.pub.PublicStrIsNull;


public class ProductManageServlet extends MyServlet {

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
		HttpSession session = request.getSession();
		sellerBean sellerBean = (sellerBean) session.getAttribute("seller");
		if(action.equals("foodlist")) {
			//System.out.println("hh");
			String suser=PublicStrIsNull.isNullStr(request.getParameter("suser"));
			String sname=PublicStrIsNull.isNullStr(request.getParameter("sname"));
			int recordSize = DAOFactory.createProductDAO().getCount(suser,sellerBean.getSid(),sname,-1,-1,-1);
			
			int pastart= this.pagingHandle(request, recordSize)[0];
			int paend= this.pagingHandle(request, recordSize)[1];
			if(pastart<0)pastart=0;
		//	System.out.print(sellerBean.getSid()+"-----------"+pastart+"-------------"+paend+"---------------");
			request.setAttribute("foodList", DAOFactory.createProductDAO().selectProduct(suser,sellerBean.getSid(), sname,-1,-1,-1,  pastart, paend));
			request.setAttribute("suser", suser);
			request.setAttribute("sname", sname);

		} else if(action.equals("foodinfo")) {
			String suser = PublicStrIsNull.isNullStr(request.getParameter("suser"));
			ProductBean userBean = DAOFactory.createProductDAO().selectProduct(suser);
			request.setAttribute("userBean",userBean);
		} else if(action.equals("delfood")) {	
			String suser = PublicStrIsNull.isNullStr(request.getParameter("del"));
			DAOFactory.createProductDAO().deleteProduct(suser);
			String msg = "删除成功!";
			response.sendRedirect(request.getContextPath() + fromPage + "?msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
			return;
		}
		request.getRequestDispatcher(fromPage).forward(request, response);
	}

}
