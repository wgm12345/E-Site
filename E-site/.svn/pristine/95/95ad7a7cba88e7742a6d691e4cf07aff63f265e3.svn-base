package com.wy.tools;

import java.util.*;
import com.wy.model.UserInfoForm;

public class UserInfoList {
	private static UserInfoList userInfo = new UserInfoList();
	private Vector vector = null;
	public UserInfoList() {
		this.vector = new Vector();
	}

	public static UserInfoList getInstance() {
		return userInfo;
	}

	public boolean addUserInfo(UserInfoForm form) {
		if (form != null) {
			this.vector.add(form);
			return true;
		} else {
			return false;
		}
	}

	public Vector getList() {
		return vector;
	}

	public int removeUserInfo(int id) {
		for (int i = 0; i < vector.size(); i++) {
			UserInfoForm form = (UserInfoForm) vector.elementAt(i);
			int idd = form.getId().intValue();
			if (idd == id) {
				vector.removeElementAt(i);
			}
		}
		return id;
	}
}