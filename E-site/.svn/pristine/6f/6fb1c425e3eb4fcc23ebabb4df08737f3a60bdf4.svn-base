package com.es.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.es.dao.bean.sellerBean;
import com.es.dao.factory.DAOFactory;

/**
 * 编辑管理员信息的Servlet,用户修改管理员资料和密码
 */
public class EditSellerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String act = request.getParameter("act");
		String fromPage = request.getParameter("fromPage");
		String msg = "";

		if (act.equals("edit")) {   
			HttpSession session = request.getSession();
			sellerBean userBean = (sellerBean) session.getAttribute("seller");
			userBean.setSname(request.getParameter("sname"));
			userBean.setSphone(request.getParameter("sphone"));
			userBean.setSemail(request.getParameter("semail"));
			userBean.setSaddress(request.getParameter("saddress"));
			userBean.setSdescription(request.getParameter("sdescription"));
			DAOFactory.createSellerDAO().updateUser(userBean);
			msg = "The seller data updated successfully";
			response.sendRedirect(fromPage + "?msg=" + java.net.URLEncoder.encode(msg, "gb2312"));
		} else if (act.equals("editpass")) {
			HttpSession session = request.getSession();
			sellerBean userBean = (sellerBean) session.getAttribute("seller");
			String old_Pwd = request.getParameter("old_password");
			String new_Pwd = request.getParameter("new_password");
			if (userBean.getSpwd().equals(old_Pwd)) {
				userBean.setSpwd(new_Pwd);
				DAOFactory.createSellerDAO().updateUserForPWD(userBean.getSid(), new_Pwd);
				msg = "密码更新成功!";
				response.sendRedirect(fromPage + "?msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
			} else {
				msg = "旧密码不正确.";
				response.sendRedirect(fromPage + "?msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
			}
		}
	}

}
