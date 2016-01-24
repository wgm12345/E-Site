﻿package com.es.dao.interf;

import java.util.List;

import com.es.dao.bean.ordersBean;
public interface ordersDAOinterf {

	/**
	 * 获取订单编号.
	 * 
	 * @return 订单编号.
	 */
	public int getOrderId();
    //oid,cid,sid,osize,ototalprice,orderdate,opaytype,ostatus,oname,oaddress,ophone,oemail
	/**
	 * 
	 * 获取订单总数.
	 * 
	 * @param oid
	 *            订单编号 (-1:表无此条件).
	 * @param cid
	 *            下单人(精确查) (null:表无此条件).
	 * @param sid
	 *            商家(精确查) (null:表无此条件).
	 * @param ostatus
	 *            审核状态 (null:表无此条件).
	 * @param startDate
	 * 			  下单日期(小值).
	 * @param endDate
	 * 			  下单日期(大值).
	 * @return 订单总数.
	 */
	public int getCount(int oid, String cid, String sid, int ostatus,String startDate, String endDate);

	/**
	 * 获取订单总数.
	 * 
	 * @return 订单总数.
	 */
	public int getCount();
	   //oid,cid,sid,osize,ototalprice,orderdate,opaytype,ostatus,oname,oaddress,ophone,oemail
	/**
	 * 添加订单.
	 * 
	 * @param orderBean
	 *            订单对象.
	 * @return 添加是否成功.
	 */
	public boolean insertOrder(ordersBean orderBean);

	/**
	 * 修改订单.
	 * 
	 * @param orderBean
	 *            订单对象.
	 * @return 添加是否成功.
	 */
	public boolean updateOrder(ordersBean orderBean);

	/**
	 * 订单审核.
	 * 
	 * @param orderBean
	 *            订单对象.
	 * 
	 * @return 操作是否成功.
	 */
	public boolean auditingOrder(ordersBean orderBean);
	   //oid,cid,sid,osize,ototalprice,orderdate,opaytype,ostatus,oname,oaddress,ophone,oemail
	/**
	 * 获取所有订单.
	 * 
	 * @param oid
	 *            订单编号 (-1:表无此条件).
	 * @param cid
	 *            下单人(精确查) (null:表无此条件).
	 * @param sid
	 *            商家(精确查) (null:表无此条件).
	 * @param ostatus
	 *            审核状态 (null:表无此条件).
	 * @param startDate
	 * 			  下单日期(小值).
	 * @param endDate
	 * 			  下单日期(大值).
	 * @param pastart
	 *            记录 开始行 (-1:表无此条件).
	 * @param paend
	 *            记录 结束行 (-1:表无此条件).
	 * 
	 * @return 订单集合.
	 */
	public List<ordersBean> searchOrder(int oid, String cid, String sid,
			int ostatus, String startDate, String endDate, int pastart, int paend);

	/**
	 * 获取所有订单.
	 * 
		 * @param oid
	 *            订单编号 (-1:表无此条件).
	 * @param cid
	 *            下单人(精确查) (null:表无此条件).
	 * @param sid
	 *            商家(精确查) (null:表无此条件).
	 * @param ostatus
	 *            审核状态 (null:表无此条件).
	 * @return 订单集合.
	 */
	public List<ordersBean> searchOrder(int oid, String cid, String sid,int ostatus);

	/**
	 * 获取所有订单.
	 * 
	 * @param cid
	 *            下单人(精确查) (null:表无此条件).
	 * @param ostatus
	 *            审核状态 (null:表无此条件).
	 * @param pastart
	 *            记录 开始行 (-1:表无此条件).
	 * @param paend
	 *            记录 结束行 (-1:表无此条件).
	 * 
	 * @return 订单集合.
	 */
	public List<ordersBean> searchOrder(String cid, int ostatus, int pastart,int paend);

	/**
	 * 获取所有订单.
	 * 
	 * @param cid
	 *            下单人(精确查) (null:表无此条件).
	 * @param ostatus
	 *            审核状态 (null:表无此条件).
	 * @return 订单集合.
	 */
	public List<ordersBean> searchOrder(String cid, int ostatus);

	/**
	 * 获取订单对象.
	 * 
	 * @param oid
	 *            订单编号.
	 * @return 订单对象.
	 */
	public ordersBean searchOrder(int oid);

	/**
	 * 获取所有订单.
	 * 
	 * @return 订单集合.
	 */
	public List<ordersBean> searchOrder();

}