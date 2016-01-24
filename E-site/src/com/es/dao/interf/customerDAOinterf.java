package com.es.dao.interf;

import java.util.List;

import com.es.dao.bean.customerBean;
public interface customerDAOinterf {

	/**
	 * 获取用户总数.
	 * 
	 * @return 用户总数.
	 */
	public int getCount();

	/**
	 * 获取用户总数.
	 * 
	 * @param cid
	 *            注册用户名(精确查) (null:表无此条件).
	 * @param cname
	 *            用户姓名(模糊查) (null:表无此条件).
	 * @return 用户总数.
	 */
	public int getCount(String cid, String cname);

	/**
	 * 查询用户.
	 * 
	 * @param cid
	 *            注册用户名(精确查) (null:表无此条件).
	 * @param cname
	 *            用户姓名(模糊查) (null:表无此条件).
	 * @param pastart
	 *            记录 开始行 (-1:表无此条件).
	 * @param paend
	 *            记录 结束行 (-1:表无此条件).
	 * @return 用户对象集.
	 */
	public List<customerBean> searchUser(String cid, String cname, int pastart, int paend);

	/**
	 * 查询用户.
	 * 
	 * @param cid
	 *            注册用户名(精确查).
	 * @return 用户对象.
	 */
	public customerBean searchUser(String cid);

	/**
	 * 注册用户.
	 * 
	 * @param userBean
	 *            用户对象.
	 * @return 添加是否成功.
	 */
	public boolean insertUser(customerBean userBean);

	/**
	 * 删除用户.
	 * 
	 * @param cid
	 *            用户名.
	 * @return 删除是否成功.
	 */
	public boolean deleteUser(String cid);

	/**
	 * 修改用户基础信息 (根据cid修改cpwd,cname,csex,cemail,cphone,caddress,cregdate,clastdate字段的值).
	 * 
	 * @param userBean
	 *            用户对象.
	 * @return 修改是否成功.
	 */
	public boolean updateUser(customerBean userBean);

	/**
	 * 修改密码.
	 * 
	 * @param cid
	 *            注册用户名.
	 * @param cpwd
	 *            密码.
	 * @return 修改是否成功.
	 */
	public boolean updateUserForPWD(String cid, String cpwd);

}