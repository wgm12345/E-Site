package com.wy.tools;

import javax.servlet.http.HttpSessionBindingEvent;

public class UserInfoTrace
		implements
			javax.servlet.http.HttpSessionBindingListener {
	private int id;
	private UserInfoList container = UserInfoList.getInstance();
	private UserInfoList userInfo = UserInfoList.getInstance();

	public UserInfoTrace() {
		id = 0;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void valueBound(HttpSessionBindingEvent arg0) {
		System.out.println("上线" + this.id);

	}

	public void valueUnbound(HttpSessionBindingEvent arg0) {
		System.out.println("下线" + this.id);
		if (id != -1) {
			container.removeUserInfo(id);
			userInfo.removeUserInfo(id);
		}
	}

}
