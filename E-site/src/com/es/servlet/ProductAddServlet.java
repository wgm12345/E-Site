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
import com.jspsmart.upload.*;


public class ProductAddServlet extends MyServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		sellerBean userBean = (sellerBean) session.getAttribute("seller");
		String msg = "";
		String imgUrl="";//上传图片
		String imgName=null;
		SmartUpload su=new SmartUpload();
		su.initialize(JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 8192, true));
		try {
			su.upload();
		} catch (SmartUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		int Size = DAOFactory.createProductDAO().getCount(null, userBean.getSid(),null,-1,-1,-1);
		if(su.getFiles().getFile(0).getFileName().length()>0){
			
			imgName=userBean.getSid()+"No."+Size+ su.getFiles().getFile(0).getFileName();
			imgUrl="/EsiteImg/" +imgName;	
			try {
				su.getFiles().getFile(0).saveAs("/EsiteImg/" +imgName, SmartUpload.SAVE_VIRTUAL);
			} catch (SmartUploadException e) {
				e.printStackTrace();
			}
		}else{
			imgUrl=su.getRequest().getParameter("oldimg");
		}


		ProductBean product = new ProductBean();
		product.setFname(PublicStrIsNull.isNullStr(su.getRequest().getParameter("fname")));
		product.setFprice(PublicStrIsNull.isNullStr(su.getRequest().getParameter("fprice")));
		product.setFtype(PublicStrIsNull.isNullStr(su.getRequest().getParameter("ftype")));
		product.setFdescription(PublicStrIsNull.isNullStr(su.getRequest().getParameter("fdescription")));
		product.setFimg(imgUrl);
		product.setSid(userBean.getSid());
		DAOFactory.createProductDAO().insertProduct(product);
		msg = "添加成功! 返回商品列表.";
		response.sendRedirect(request.getContextPath() + "/Admin/Product_Add.jsp" + "?success=success&msg="
				+ java.net.URLEncoder.encode(msg, "UTF-8"));
		return;
	}

}
