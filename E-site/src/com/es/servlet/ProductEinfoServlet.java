﻿package com.es.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.es.dao.bean.ProductBean;
import com.es.dao.bean.sellerBean;
import com.es.dao.factory.DAOFactory;
import com.es.dao.pub.PublicStrIsNull;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;


public class ProductEinfoServlet extends MyServlet {

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
		String suser = PublicStrIsNull.isNullStr(request.getParameter("suser"));
		HttpSession session = request.getSession();
		sellerBean userBean = (sellerBean) session.getAttribute("seller");
		if(suser.length()==0){
			
			String msg = "";
			String imgUrl="";
			String imgName="";//-------------------上传图片
			SmartUpload su=new SmartUpload();

			su.initialize(JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 8192, true));
			try {
				su.upload();
			} catch (SmartUploadException e1) {
				e1.printStackTrace();
			}
			int Size = DAOFactory.createProductDAO().getCount(null,userBean.getSid(), null,-1,-1,-1);

			if(su.getFiles().getFile(0).getFileName().length()>0){
	
				imgName=userBean.getSid()+"No."+Size+ su.getFiles().getFile(0).getFileName();
				imgUrl="/foodImg/" +imgName;	
				try {
					su.getFiles().getFile(0).saveAs("/foodImg/" +imgName, SmartUpload.SAVE_VIRTUAL);
				} catch (SmartUploadException e) {
					e.printStackTrace();
				}
			}else{
				imgUrl=su.getRequest().getParameter("oldimg");
			}


			ProductBean food = new ProductBean();
			food.setFid(PublicStrIsNull.isNullStr(su.getRequest().getParameter("fid")));
			food.setSid(userBean.getSid());
			food.setFname(PublicStrIsNull.isNullStr(su.getRequest().getParameter("fname")));
			food.setFprice(PublicStrIsNull.isNullStr(su.getRequest().getParameter("fprice")));
			food.setFtype(PublicStrIsNull.isNullStr(su.getRequest().getParameter("ftype")));
			food.setFpraise(PublicStrIsNull.isNullStr(su.getRequest().getParameter("fpraise")));
			food.setFdescription(PublicStrIsNull.isNullStr(su.getRequest().getParameter("fdescription")));
			food.setFimg(imgUrl);
			food.setFstatus("1");
			food.setSid(userBean.getSid());

			DAOFactory.createProductDAO().updateProduct(food);
			msg = "商品信息更新成功！";
			response.sendRedirect(request.getContextPath() + "/Seller/Product_Einfo.jsp" + "?username=" + suser + "&msg="
					+ java.net.URLEncoder.encode(msg, "UTF-8"));
			return;
		}else{
			ProductBean food0 = DAOFactory.createProductDAO().selectProduct(suser);
			request.setAttribute("userBean",food0);
		}
		request.getRequestDispatcher(fromPage).forward(request, response);
	}

}
