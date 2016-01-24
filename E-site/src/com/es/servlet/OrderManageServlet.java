package com.es.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.es.dao.bean.ordersBean;
import com.es.dao.bean.sellerBean;
import com.es.dao.factory.DAOFactory;
import com.es.dao.pub.PublicStrIsNull;


/**
 * 订单管理Server.用于显示订单列表，订单明细，修改订单，审核订单等操作
 */
public class OrderManageServlet extends MyServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = PublicStrIsNull.isNullStr(request.getParameter("act"));
		if(action.equals("orderList")) {
			String fromPage = PublicStrIsNull.isNullStr(request.getParameter("fromPage"));
			String orderId_str = PublicStrIsNull.isNullStr(request.getParameter("orderId"));
			String scuser = PublicStrIsNull.isNullStr(request.getParameter("scuser"));
			String sstatus_str = PublicStrIsNull.isNullStr(request.getParameter("sstatus"));
			HttpSession session = request.getSession();
			sellerBean userBean = (sellerBean) session.getAttribute("seller");
			String sid=userBean.getSid();
			int orderId = -1;
			int sstatus=-1;
			try {
				orderId = Integer.parseInt(orderId_str);
				sstatus=Integer.parseInt(sstatus_str);
			} catch(Exception e) {
			}
			int recordSize = DAOFactory.createOrdersDAO().getCount(orderId, scuser,sid,sstatus, null,null);
			int pastart = pagingHandle(request, recordSize)[0];
			int paend = pagingHandle(request, recordSize)[1];
			if(pastart<=0)pastart=1;
			List<ordersBean> list = DAOFactory.createOrdersDAO().searchOrder(orderId, scuser,sid,sstatus, null,null, pastart, paend);
			request.setAttribute("orderList", list);
			if(scuser != null && !scuser.equals(""))
				request.setAttribute("scuser", scuser);
			if(orderId_str != null && !orderId_str.equals(""))
				request.setAttribute("orderId", orderId_str);
			if(sstatus_str != null && !sstatus_str.equals(""))
				request.setAttribute("sstatus", sstatus);
			request.getRequestDispatcher(fromPage).forward(request, response);
		} else if(action.equals("orderItem")) {
			String fromPage = PublicStrIsNull.isNullStr(request.getParameter("fromPage"));
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			ordersBean orderBean = DAOFactory.createOrdersDAO().searchOrder(orderId);
			List orderItemList = DAOFactory.createOrderItemDAO().searchOrderItem(orderId);
			request.setAttribute("orderBean", orderBean);
			request.setAttribute("orderItemList",orderItemList);
			request.getRequestDispatcher(fromPage).forward(request, response);
		} else if(action.equals("auditOrder")) {
			String fromPage = PublicStrIsNull.isNullStr(request.getParameter("fromPage"));
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			String sstatus = PublicStrIsNull.isNullStr(request.getParameter("sstatus"));
			ordersBean orderBean = DAOFactory.createOrdersDAO().searchOrder(orderId);
			orderBean.setOstatus(Integer.parseInt(sstatus));
			DAOFactory.createOrdersDAO().auditingOrder(orderBean);
			String msg = "审核成功!";
			response.sendRedirect(request.getContextPath() + fromPage + "?msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
			return;
		}
	}

	@Override
	protected void doGet(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(arg0,arg1);
	}

}
