﻿package com.es.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.es.dao.bean.sale_promBean;
import com.es.dao.factory.DAOFactory;
import com.es.dao.pub.PublicStrIsNull;


public class NoticeManageServlet extends MyServlet {

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
		if(action.equals("noticeList")) {
			String temp=request.getParameter("pid");
			int pid;
			if(temp==null||temp.length()==0)
				pid=-1;
			else pid=Integer.parseInt(temp);
			String pname=PublicStrIsNull.isNullStr(request.getParameter("pname"));
			int recordSize = DAOFactory.createSalePromDAO().getCount(pid, pname);
			int pastart= this.pagingHandle(request, recordSize)[0];
			int paend= this.pagingHandle(request, recordSize)[1];
			if(pastart<=0)pastart=1;
			request.setAttribute("noticeList", DAOFactory.createSalePromDAO().searchSP(pid, pname,  pastart, paend));
			request.setAttribute("pid", pid);
			request.setAttribute("pname", pname);

		} else if(action.equals("noticeadd")) {
			String msg = "";
			sale_promBean notice = new sale_promBean();
			//pname,pstartime,pendtime,pdescription
			notice.setPname(PublicStrIsNull.isNullStr(request.getParameter("pname")));
			notice.setPstartime(PublicStrIsNull.isNullStr(request.getParameter("pstartime")));
			notice.setPendtime(PublicStrIsNull.isNullStr(request.getParameter("pendtime")));
			notice.setPdescription(PublicStrIsNull.isNullStr(request.getParameter("pdescription")));
			DAOFactory.createSalePromDAO().insertSP(notice);
			msg = "添加成功.";
			response.sendRedirect(request.getContextPath() + fromPage + "?success=success&msg="
					+ java.net.URLEncoder.encode(msg, "UTF-8"));
			return;

		} else if(action.equals("noticeedit")) {
			String first = PublicStrIsNull.isNullStr(request.getParameter("first"));
			String temp=request.getParameter("suser");
			int pid;
			if(temp==null||temp.length()==0)
				pid=-1;
			else pid=Integer.parseInt(temp);
			sale_promBean notice = DAOFactory.createSalePromDAO().searchSP(pid);
			if(first.equals("update")) {
				notice.setPname(PublicStrIsNull.isNullStr(request.getParameter("pname")));
				notice.setPstartime(PublicStrIsNull.isNullStr(request.getParameter("pstartime")));
				notice.setPendtime(PublicStrIsNull.isNullStr(request.getParameter("pendtime")));
				notice.setPdescription(PublicStrIsNull.isNullStr(request.getParameter("pdescription")));
				DAOFactory.createSalePromDAO().updateSP(notice);
				String msg = "公告更新成功！";
				response.sendRedirect(request.getContextPath() + fromPage + "?pid=" + pid + "&msg="
						+ java.net.URLEncoder.encode(msg, "UTF-8"));
				return;
			}
			request.setAttribute("userBean",notice);
		} else if(action.equals("noticeinfo")) {
			String temp=request.getParameter("suser");
			int pid;
			if(temp==null||temp.length()==0)
				pid=-1;
			else pid=Integer.parseInt(temp);
			sale_promBean userBean = DAOFactory.createSalePromDAO().searchSP(pid);
			request.setAttribute("userBean",userBean);
		} else if(action.equals("delnotice")) {
			String temp=request.getParameter("del");
			int pid;
			if(temp==null||temp.length()==0)
				pid=-1;
			else pid=Integer.parseInt(temp);
			DAOFactory.createSalePromDAO().deleteSP(pid);
			String msg = "删除成功!";
			response.sendRedirect(request.getContextPath() + fromPage + "?msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
			return;
		}
		request.getRequestDispatcher(fromPage).forward(request, response);
	}

}
