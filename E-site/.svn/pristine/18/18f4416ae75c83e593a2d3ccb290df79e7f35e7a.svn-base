package com.es.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.es.dao.bean.ProductBean;
import com.es.dao.bean.sellerBean;
import com.es.dao.factory.DAOFactory;
import com.es.dao.pub.PublicStrIsNull;

/**
 * 处理首页功能的Servlet,用于分页处理，，商品显示
 */
public class MainServlet extends MyServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fromPage = PublicStrIsNull.isNullStr(request.getParameter("fromPage"));
		String skey = PublicStrIsNull.isNullStr(request.getParameter("skey"));
		String selectType = PublicStrIsNull.isNullStr(request.getParameter("selectType"));
		String act = PublicStrIsNull.isNullStr(request.getParameter("act"));
		HttpSession session = request.getSession();
		if(act.equals("praiseFood")){
			String fid = PublicStrIsNull.isNullStr(request.getParameter("fid"));
			ProductBean fb= DAOFactory.createProductDAO().selectProduct(fid);
			int p=Integer.parseInt(fb.getFpraise());
			fb.setFpraise((p+1)+"");
			DAOFactory.createProductDAO().updateProduct(fb);
			String sid = PublicStrIsNull.isNullStr(request.getParameter("sid"));
			if(sid.length()>0){
				int recordSize = DAOFactory.createProductDAO().getCount(null, sid, null, -1, -1,-1);
				int pastart= this.pagingHandle(request, recordSize)[0];
				int paend= this.pagingHandle(request, recordSize)[1];
				if(pastart<=0)pastart=1;
			//	System.out.println(sid+"---------------------"+recordSize);
				request.setAttribute("ShopFoodList", DAOFactory.createProductDAO().selectProduct(null, sid, null, -1, -1,-1, pastart, paend));
				request.setAttribute("Shop", DAOFactory.createSellerDAO().searchUser(sid));	
				session.setAttribute("sid", sid);
			}
		}else if(act.equals("enterShop")){
			String sid = PublicStrIsNull.isNullStr(request.getParameter("sid"));
			int recordSize = DAOFactory.createProductDAO().getCount(null, sid, null, -1, -1,-1);
			int pastart= this.pagingHandle(request, recordSize)[0];
			int paend= this.pagingHandle(request, recordSize)[1];
			if(pastart<=0)pastart=1;
	//		System.out.println(sid+"---------------------"+recordSize);
			request.setAttribute("ShopFoodList", DAOFactory.createProductDAO().selectProduct(null, sid, null, -1, -1,-1, pastart, paend));
			request.setAttribute("Shop", DAOFactory.createSellerDAO().searchUser(sid));
			session.setAttribute("sid", sid);
		}else if(act.equals("praiseShop")){
			String sid = PublicStrIsNull.isNullStr(request.getParameter("sid"));
			sellerBean sb= DAOFactory.createSellerDAO().searchUser(sid);
			int p=Integer.parseInt(sb.getSpraise()+"");
			sb.setSpraise((p+1));
			DAOFactory.createSellerDAO().updateUser(sb);
			int recordSize = DAOFactory.createProductDAO().getCount(null, sid, null, -1, -1,-1);
			int pastart= this.pagingHandle(request, recordSize)[0];
			int paend= this.pagingHandle(request, recordSize)[1];
			if(pastart<=0)pastart=1;
	//		System.out.println(sid+"---------------------"+recordSize);
			request.setAttribute("ShopFoodList", DAOFactory.createProductDAO().selectProduct(null, sid, null, -1, -1,-1, pastart, paend));
			request.setAttribute("Shop", DAOFactory.createSellerDAO().searchUser(sid));
			session.setAttribute("sid", sid);
		}else if(act.equals("showFood"))
		{//获取商品详情
			String sid = PublicStrIsNull.isNullStr(request.getParameter("sid"));
			String fid = PublicStrIsNull.isNullStr(request.getParameter("fid"));
			ProductBean fb= DAOFactory.createProductDAO().selectProduct(fid);	
				request.setAttribute("ShowFoodBean", fb);
				//System.out.println("设置成功");
				request.getRequestDispatcher("ShowGoodDetail.jsp"); 
				//System.out.println("没设置成功？");
				session.setAttribute("sid", sid);
		}
		
		else{
			int type=-1;
			/*
			if(selectType.equals("s0"))
				type=0;
			else if(selectType.equals("s1"))
				type=1;
			else if(selectType.equals("s2"))
				type=2;
*/
			int recordSize = DAOFactory.createProductDAO().getCount(null, null, skey, -1, -1,type);
			int pastart= this.pagingHandle(request, recordSize)[0];
			int paend= this.pagingHandle(request, recordSize)[1];
			if(pastart<=0)pastart=1;

			type=0;
			request.setAttribute("foodList", DAOFactory.createProductDAO().selectProduct(null, null, skey, -1, -1,type, pastart, paend));
			request.setAttribute("foodRankList", DAOFactory.createProductDAO().selectProduct(null, null, null, -1, -1,type, 1, 5));
			type=1;
			request.setAttribute("clothList", DAOFactory.createProductDAO().selectProduct(null, null, skey, -1, -1,type, pastart, paend));
			request.setAttribute("clothRankList", DAOFactory.createProductDAO().selectProduct(null, null, null, -1, -1,type, 1, 5));
			type=2;
			request.setAttribute("digitList", DAOFactory.createProductDAO().selectProduct(null, null, skey, -1, -1,type, pastart, paend));
			request.setAttribute("digitRankList", DAOFactory.createProductDAO().selectProduct(null, null, null, -1, -1,type, 1, 5));

		
		
			
			request.setAttribute("skey", skey);
			session.setAttribute("sid", "qdl");

		}
		request.getRequestDispatcher(fromPage).forward(request, response);
	}

}
