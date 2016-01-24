package com.es.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.es.bo.Cart;
import com.es.dao.factory.DAOFactory;
import com.es.dao.pub.PublicStrIsNull;
/**
 * 购物车管理Servlet,用于对购物车中的商品进行增删改查
 */
public class CartServlet extends MyServlet {

	private static final long serialVersionUID = 1L;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = PublicStrIsNull.isNullStr(request.getParameter("act"));
		String fromPage = PublicStrIsNull.isNullStr(request.getParameter("fromPage"));
		HttpSession session = request.getSession();
		//获取mcCart的值
		Cart cart = (Cart)session.getAttribute("mcCart");
	//	System.out.println(cart+"---------------------");
		if(action.equals("buyFood")) {
			if(cart==null){
				cart =new Cart();
				session.setAttribute("mcCart",cart);
			}else{
				String sid = PublicStrIsNull.isNullStr(request.getParameter("sid"));
				if(cart.isShop(sid)==false){
					cart.clearMc();
				}
			}
			int fid = Integer.parseInt(PublicStrIsNull.isNullStr(request.getParameter("fid")));
			cart.addMc(fid);
			String sid = PublicStrIsNull.isNullStr(request.getParameter("sid"));
			int recordSize = DAOFactory.createProductDAO().getCount(null, sid, null, -1, -1,-1);
			int pastart= this.pagingHandle(request, recordSize)[0];
			int paend= this.pagingHandle(request, recordSize)[1];
			if(pastart<=0)pastart=1;
		//	System.out.println(sid+"---------------------"+recordSize);
			request.setAttribute("ShopFoodList", DAOFactory.createProductDAO().selectProduct(null, sid, null, -1, -1,-1, pastart, paend));
			request.setAttribute("Shop", DAOFactory.createSellerDAO().searchUser(sid));
		} else if(action.equals("updateFood")) {
			int nid = Integer.parseInt(PublicStrIsNull.isNullStr(request.getParameter("nid")));
			int newCount = Integer.parseInt(PublicStrIsNull.isNullStr(request.getParameter("newCount")));
			cart.updateMc(nid, newCount);
		} else if(action.equals("deleteFood")) {
			int nid = Integer.parseInt(PublicStrIsNull.isNullStr(request.getParameter("nid")));
			cart.deleteMc(nid);
		} else if(action.equals("clearFood")) {
			cart.clearMc();
		}
		request.getRequestDispatcher(fromPage).forward(request, response);
		//response.sendRedirect(request.getContextPath() + fromPage);
	}

}
