package com.wy.action;

import java.util.Enumeration;
import java.util.Map;
import java.util.Vector;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wy.dao.UserInfoDao;
import com.wy.dao.UserInfoDaoImp;
import com.wy.model.UserInfoForm;
import com.wy.tools.UserInfoList;
import com.wy.tools.UserInfoTrace;

public class UserInfoAction extends ActionSupport
		implements
			ModelDriven<UserInfoForm>,
			SessionAware {

	private UserInfoForm userInfo = new UserInfoForm();

	private UserInfoDaoImp dao = null;

	protected Map session;

	public UserInfoForm getModel() {

		return userInfo;
	}

	public void setSession(Map session) {

		this.session = session;

	}

	public void validateSaveUserInfo() {
		if (userInfo.getAccount().length() == 0) {
			this.addFieldError("account", "请您输入用户名!");
		}
		if (userInfo.getPassword().length() == 0) {
			this.addFieldError("password", "请输入密码!");
		}
		if (userInfo.getRepassword().length() == 0) {
			this.addFieldError("repassword", "请输入重复密码!");
		}
		if (!userInfo.getPassword().equals(userInfo.getRepassword())) {
			this.addFieldError("repassword", "您输入的密码与重复密码不一致!");
		}
		if (userInfo.getResult().length() == 0) {
			this.addFieldError("reslut", "请输入密码保护答案!");
		}
		if (userInfo.getEmail().trim().length() != 0) {
			String str = userInfo.getEmail().trim();
			if (!com.wy.tools.Encrypt.checkEmail(str)) {
				this.addFieldError("email", "您输入的邮箱地址不正确!");
			}
		}

		String code = (String) session.get("rand");
		if (userInfo.getCode().length() == 0) {
			this.addFieldError("code", "请您输入校验码!");
		} else if (!code.equals(userInfo.getCode())) {
			this.addFieldError("code", "您输入的校验码不正确，请重新输入!");
		}
	}

	public String saveUserInfo() {
		dao = new UserInfoDao();
		String inforamtion = "用户注册失败！";
		if (dao.saveUserInfo(userInfo)) {
			inforamtion = "用户注册成功！";
		}
		ServletActionContext.getRequest().setAttribute("inforamtion",
				inforamtion);
		return SUCCESS;
	}

	private String checkUserInfoHere(String account) {
		String checkResult = "";
		dao = new UserInfoDao();
		UserInfoForm form = dao.queryUserInfo(userInfo.getAccount());
		if (null == form) {
			checkResult = "您输入的用户名不存在！";
		} else {
			UserInfoList userInfoList = UserInfoList.getInstance();
			Vector vc = userInfoList.getList();
			if (!vc.isEmpty() && vc != null) {
				Enumeration en = vc.elements();
				while (en.hasMoreElements()) {
					UserInfoForm userInfoForm = (UserInfoForm) en.nextElement();
					if (userInfoForm.getAccount().equals(form.getAccount())) {
						checkResult = "您输入的用户名已经登录了！";
					}
				}
			}
		}

		return checkResult;
	}

	private String checkUserInfoBe(String password) {
		String information = "";
		dao = new UserInfoDao();
		UserInfoForm form = dao.queryUserInfo(userInfo.getAccount());
		password = com.wy.tools.Encrypt.encodeMD5(password);

		if (form != null) {
			if (!password.equals(form.getPassword())) {
				information = "您输入的密码不正确";
			}
		}
		return information;
	}

	public void validateCheckUserInfo() {
		String inforamtion = "";
		if (userInfo.getAccount().length() == 0) {
			this.addFieldError("account", "请您输入用户名!");
		} else if (this.checkUserInfoHere(userInfo.getAccount()).length() != 0) {
			inforamtion = checkUserInfoHere(userInfo.getAccount());
			this.addFieldError("account", inforamtion);
		}

		if (userInfo.getPassword().length() == 0) {
			this.addFieldError("password", "请输入密码!");
		} else if (this.checkUserInfoBe(userInfo.getAccount()).length() != 0) {
			inforamtion = checkUserInfoBe(userInfo.getAccount());
			this.addFieldError("password", inforamtion);
		}

		String code = (String) session.get("rand");
		if (userInfo.getCode().length() == 0) {
			this.addFieldError("code", "请您输入校验码!");
		} else if (!code.equals(userInfo.getCode())) {
			this.addFieldError("code", "您输入的校验码不正确，请重新输入!");
		}

	}

	public String checkUserInfo() {
		dao = new UserInfoDao();
		UserInfoForm userInfoForm = dao.queryUserInfo(userInfo.getAccount());

		UserInfoTrace userInfoTrace = new UserInfoTrace();
		userInfoTrace.setId(userInfoForm.getId());
		UserInfoList userInfoList = UserInfoList.getInstance();
		userInfoList.addUserInfo(userInfoForm);
		ServletActionContext.getRequest().setAttribute("userInfoTrace",
				userInfoTrace);
		ServletActionContext.getRequest().setAttribute("form", userInfoForm);
		return "checkSuccess";
	}

}
