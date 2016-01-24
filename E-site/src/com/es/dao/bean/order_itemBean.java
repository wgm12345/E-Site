package com.es.dao.bean;

import java.io.Serializable;

public class order_itemBean implements Serializable {

	/**
	 * 生成serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 编号
	 */
	private int nid;

	/**
	 * 所属订单
	 */
	private int oid;

	/**
	 * 订购商品ID
	 */
	private int fid;

	/**
	 * 商品名
	 */
	private String fname;

	/**
	 * 商品简述
	 */
	private String fdescription;
	/**
	 * 商品单价
	 */
	private double fprice;

	/**
	 * 商品图片
	 */
	private String fimg;

	/**
	 * 商品数
	 */
	private int ncount;

	/**
	 * 小计
	 */
	private double ntotalprice;

	/**
	 * 获取商品数
	 * 
	 * @return 商品数
	 */
	public int getNcount() {
		return ncount;
	}

	/**
	 * 设置商品数
	 * 
	 * @param ncount
	 *            商品数
	 */
	public void setNcount(int ncount) {
		this.ncount = ncount;
	}

	/**
	 * 获取编号
	 * 
	 * @return 编号
	 */
	public int getNid() {
		return nid;
	}

	/**
	 * 设置编号
	 * 
	 * @param nid
	 *            编号
	 */
	public void setNid(int nid) {
		this.nid = nid;
	}

	/**
	 * 获取订购商品ID
	 * 
	 * @return 订购商品ID
	 */
	public int getFid() {
		return fid;
	}

	/**
	 * 设置订购商品ID
	 * 
	 * @param nmcid
	 *            订购商品ID
	 */
	public void setFid(int fid) {
		System.out.println("商品id"+fid);
		this.fid = fid;
	}

	/**
	 * 获取所属订单
	 * 
	 * @return 所属订单
	 */
	public int getOid() {
		return oid;
	}

	/**
	 * 设置所属订单
	 * 
	 * @param norderid
	 *            所属订单
	 */
	public void setOid(int oid) {
		this.oid = oid;
	}

	/**
	 * 获取商品单价
	 * 
	 * @return 商品单价
	 */
	public double getFprice() {
		return fprice;
	}

	/**
	 * 设置商品单价
	 * 
	 * @param nprice
	 *            商品单价
	 */
	public void setFprice(double fprice) {
		this.fprice = fprice;
	}

	/**
	 * 获取小计
	 * 
	 * @return 小计
	 */
	public double getNtotalprice() {
		return ntotalprice;
	}

	/**
	 * 设置小计
	 * 
	 * @param ntotalprice
	 *            小计
	 */
	public void setNtotalprice(double ntotalprice) {
		this.ntotalprice = ntotalprice;
	}

	/**
	 * 获取商品简述
	 * 
	 * @return 商品简述
	 */
	public String getFdescription() {
		return fdescription;
	}

	/**
	 * 设置商品简述
	 * 
	 * @param sdescription
	 *            商品简述
	 */
	public void setFdescription(String fdescription) {
		this.fdescription = fdescription;
	}

	/**
	 * 获取商品图片
	 * 
	 * @return 商品图片
	 */
	public String getFimg() {
		return fimg;
	}

	/**
	 * 设置商品图片
	 * 
	 * @param simg
	 *            商品图片
	 */
	public void setFimg(String fimg) {
		this.fimg = fimg;
	}

	/**
	 * 获取商品名
	 * 
	 * @return 商品名
	 */
	public String getFname() {
		return fname;
	}

	/**
	 * 设置商品名
	 * 
	 * @param smcname
	 *            商品名
	 */
	public void setFname(String fname) {
		this.fname = fname;
	}
}
