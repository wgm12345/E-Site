﻿package com.es.servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import com.es.dao.pub.PublicStrIsNull;

/**
 * HttpServlet的子类.添加了分页处理的方法.
 */
public class MyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * 分页处理.传入当前页和总记录数.返回一个int数组.里面存放开始行和结束行.供尾列查询时调用.
	 * 
	 * @param request
	 * 			请求对象
	 * @param recordSize
	 * 			数据库中查询的总记录数
	 * @return 数组,下标0存pastart.下标1存paend.
	 */
	public int[] pagingHandle(HttpServletRequest request,int recordSize){
	
		int pageSize = Integer.parseInt(this.getServletConfig().getInitParameter("pageSize"));
		int pageCount = (recordSize + pageSize - 1) / pageSize;
		String tmpCurPage = PublicStrIsNull.isNullStr(request.getParameter("curPage"));
		
		int curPage = 1;

		try {
			curPage = Integer.parseInt(tmpCurPage);
			if (curPage < 1)
				curPage = 1;
			if(curPage>pageCount)
				curPage=pageCount;
		} catch (Exception e) {
		}
		
		int pastart=(curPage-1)*pageSize+1;
		int paend=curPage*pageSize;
		
		int res[]={pastart,paend};
		
		request.setAttribute("recordSize", recordSize);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("curPage", curPage);
		
		return res;
	}
}
