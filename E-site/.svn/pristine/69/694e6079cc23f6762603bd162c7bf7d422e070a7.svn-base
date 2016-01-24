package com.es.dao.interf;

import java.util.List;

import com.es.dao.bean.managerBean;
public interface managerDAOinterf {

	/**
	 * 获取用户总数.
	 * 
	 * @return 用户总数.
	 */
	public int getCount();

	/**
	 * 获取用户总数.
	 * 
	 * @param mid
	 *            注册用户名(精确查) (null:表无此条件).
	 * @param mname
	 *            用户姓名(模糊查) (null:表无此条件).
	 * @return 用户总数.
	 */
	public int getCount(String mid, String mname);

	/**
	 * 查询用户.
	 * 
	 * @param mid
	 *            注册用户名(精确查) (null:表无此条件).
	 * @param mname
	 *            用户姓名(模糊查) (null:表无此条件).
	 * @param pastart
	 *            记录 开始行 (-1:表无此条件).
	 * @param paend
	 *            记录 结束行 (-1:表无此条件).
	 * @return 用户对象集.
	 */
	public List<managerBean> searchUser(String mid, String mname,  int pastart, int paend);

	/**
	 * 查询用户.
	 * 
	 * @param mid
	 *            注册用户名(精确查).
	 * @return 用户对象.
	 */
	public managerBean searchUser(String mid);

	/**
	 * 注册用户.
	 * 
	 * @param userBean
	 *            用户对象.
	 * @return 添加是否成功.
	 */
	public boolean insertUser(managerBean userBean);

	/**
	 * 删除用户.
	 * 
	 * @param mid
	 *            用户名.
	 * @return 删除是否成功.
	 */
	public boolean deleteUser(String mid);

	/**
	 * 修改用户基础信息 (根据mid修改mpwd,mname,msex,mphone,maddress,memail字段的值).
	 * 
	 * @param userBean
	 *            用户对象.
	 * @return 修改是否成功.
	 */
	public boolean updateUser(managerBean userBean);
	//mid,mpwd,mname,msex,mphone,maddress,memail
	/**
	 * 修改密码.
	 * 
	 * @param mid
	 *            注册用户名.
	 * @param mpwd
	 *            密码.
	 * @return 修改是否成功.
	 */
	public boolean updateUserForPWD(String mid, String mpwd);

}