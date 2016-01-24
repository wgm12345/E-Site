package com.es.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.es.dao.bean.customerBean;
import com.es.dao.factory.DAOFactory;

/**
 * 用于前台会员中心的用户资料修改和密码修改操作
 */
public class UpdateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String act = request.getParameter("act");
		String fromPage = request.getParameter("fromPage");
		String msgPage = request.getParameter("msg");
		String msg = "";

		if (act.equals("updateInfo")) {
			HttpSession session = request.getSession();
			customerBean userBean = (customerBean) session.getAttribute("user");
			userBean.setCname(request.getParameter("sname"));
			userBean.setCsex(request.getParameter("ssex"));
			userBean.setCphone(request.getParameter("sphone"));
			userBean.setCemail(request.getParameter("semail"));
			userBean.setCaddress(request.getParameter("saddress"));
			DAOFactory.createCustomerDAO().updateUser(userBean);
			msg = "用户资料修改成功, 3 秒后自动返回..........";
			response.sendRedirect(request.getContextPath() + msgPage + "?fromPage=" + request.getContextPath() + fromPage + "&msg="
					+ java.net.URLEncoder.encode(msg, "UTF-8"));
		} else if (act.equals("updatePwd")) {
			HttpSession session = request.getSession();
			customerBean userBean = (customerBean) session.getAttribute("user");
			String old_Pwd = request.getParameter("old_password");
			String new_Pwd = request.getParameter("new_password");
			if (userBean.getCpwd().equals(old_Pwd)) {
				userBean.setCpwd(new_Pwd);
				DAOFactory.createCustomerDAO().updateUserForPWD(userBean.getCid(), new_Pwd);
				msg = "密码修改成功, 3 秒后自动返回..........";
				response.sendRedirect(request.getContextPath() + msgPage + "?fromPage=" + request.getContextPath() + fromPage
						+ "&msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
			} else {
				msg = "旧密码不正确,3 秒后自动返回..........";
				response.sendRedirect(request.getContextPath() + msgPage + "?fromPage=" + request.getContextPath() + fromPage
						+ "&msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
			}
		}
	}

}
