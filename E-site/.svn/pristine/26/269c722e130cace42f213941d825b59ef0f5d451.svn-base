package com.es.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.es.dao.bean.sellerBean;
import com.es.dao.factory.DAOFactory;
import com.es.dao.pub.PublicGetDate;
import com.es.dao.pub.PublicStrIsNull;

/**
 * 店家登陆Servlet,用于验证店家登陆信息。
 */
public class SellerLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String suser = PublicStrIsNull.isNullStr(request.getParameter("suser"));
		String spwd = request.getParameter("spwd");
		String rand = request.getParameter("rand");
		String srand = (String) session.getAttribute("rand");
		session.removeAttribute("rand");
		String fromPage = request.getParameter("fromPage");
		String msg = "";

		if (rand.equals(srand)) {
			sellerBean user= DAOFactory.createSellerDAO().searchUser(suser);
			if (user != null ) {
				if (user.getSpwd().equals(spwd)) {
					user.setSlastdate(PublicGetDate.getDateTime());
					DAOFactory.createSellerDAO().updateUser(user);
					session.setAttribute("seller", user);
					if (request.getParameter("remember") != null
							&& request.getParameter("remember").equals("1")) {
						Cookie cookie = new Cookie("seller", suser);
						cookie.setMaxAge(60 * 60 * 24 * 365);
						cookie.setPath("/");
						response.addCookie(cookie);
					}
					response.sendRedirect("/E-site/Seller/Seller_Index.jsp");
				} else {
					Integer count = (Integer) session
							.getAttribute("LoginCount");
					if (count == null) {
						session.setAttribute("LoginCount", 3);
					}
					count = (Integer) session.getAttribute("LoginCount")
							- Integer.valueOf(1);
					session.setAttribute("LoginCount", count);
					msg = "密码错误. 你还有 " + count + "次机会!";
					response.sendRedirect(request.getContextPath() +fromPage + "?&msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
				}
			} else {
				msg = "用户不存在. 请重新输入!";
				response.sendRedirect(request.getContextPath() +fromPage + "?&msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
			}
		} else {
			msg = "验证码输入错误！请重新输入！";
			response.sendRedirect(request.getContextPath() +fromPage + "?&msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
		}
	}

}
