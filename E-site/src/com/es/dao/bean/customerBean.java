package com.es.dao.bean;

import java.io.Serializable;

public class customerBean implements Serializable {

	/**
	 * 生成serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 用户名
	 */
	private String cid;

	/**
	 * 用户密码
	 */
	private String cpwd;

	/**
	 * 用户姓名
	 */
	private String cname;

	/**
	 * 用户性别
	 */
	private String csex;

	/**
	 * 用户电话号码
	 */
	private String cphone;

	/**
	 * 用户地址
	 */
	private String caddress;

	/**
	 * 用户email地址
	 */
	private String cemail;

	/**
	 * 用户注册时间
	 */
	private String cregdate;


	/**
	 * 用户最后登陆时间
	 */
	private String clastdate;


	/**
	 * 用于获取用户最后登陆时间
	 * 
	 * @return 最后登陆时间
	 */
	public String getClastdate() {
		return clastdate;
	}

	/**
	 * 用于设置用户最后登陆时间
	 * 
	 * @param clastdate
	 *            最后登陆时间
	 */
	public void setClastdate(String clastdate) {
		this.clastdate = clastdate;
	}

	/**
	 * 用于获取用户注册时间
	 * 
	 * @return 注册时间
	 */
	public String getCregdate() {
		return cregdate;
	}

	/**
	 * 用于设置用户注册时间
	 * 
	 * @param cregdate
	 *            注册时间
	 */
	public void setCregdate(String cregdate) {
		this.cregdate = cregdate;
	}

	/**
	 * 用于获取用户住址
	 * 
	 * @return 用户住址
	 */
	public String getCaddress() {
		return caddress;
	}

	/**
	 * 用于设置用户住址
	 * 
	 * @param caddress
	 *            用户住址
	 */
	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}



	/**
	 * 用于获取用户Email地址
	 * 
	 * @return Email地址
	 */
	public String getCemail() {
		return cemail;
	}

	/**
	 * 用于设置用户Email地址
	 * 
	 * @param cemail
	 *            Email地址
	 */
	public void setCemail(String cemail) {
		this.cemail = cemail;
	}


	/**
	 * 用于获取用户姓名
	 * 
	 * @return 用户姓名
	 */
	public String getCname() {
		return cname;
	}

	/**
	 * 用于设置用户姓名
	 * 
	 * @param cname
	 *            用户姓名
	 */
	public void setCname(String cname) {
		this.cname = cname;
	}

	/**
	 * 用于获取用户电话号码
	 * 
	 * @return 电话号码
	 */
	public String getCphone() {
		return cphone;
	}

	/**
	 * 用于设置用户电话号码
	 * 
	 * @param cphone
	 *            电话号码
	 */
	public void setCphone(String cphone) {
		this.cphone = cphone;
	}

	/**
	 * 用于获取用户密码
	 * 
	 * @return 用户密码
	 */
	public String getCpwd() {
		return cpwd;
	}

	/**
	 * 用于设置用户密码
	 * 
	 * @param cpwd
	 *            用户密码
	 */
	public void setCpwd(String cpwd) {
		this.cpwd = cpwd;
	}

	/**
	 * 用于获取用户性别
	 * 
	 * @return 性别
	 */
	public String getCsex() {
		return csex;
	}

	/**
	 * 用于设置用户性别
	 * 
	 * @param csex
	 *            性别
	 */
	public void setCsex(String csex) {
		this.csex = csex;
	}

	/**
	 * 用于获取用户名
	 * 
	 * @return 用户名
	 */
	public String getCid() {
		return cid;
	}

	/**
	 * 用于设置用户名
	 * 
	 * @param cid
	 *            用户名
	 */
	public void setCid(String cid) {
		this.cid = cid;
	}


}
