package com.es.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.es.dao.bean.order_itemBean;
import com.es.dao.interf.order_itemDAOinterf;
import com.es.dao.mysql.Conn;

public class order_itemDAOImpl implements order_itemDAOinterf {

	/**
	 * 获取订单条目总数.
	 * 
	 * @return 订单条目总数.
	 */
	@Override
	public int getCount() {
		return getCount(-1);
	}

	/**
	 * 获取订单条目总数.
	 * 
	 * @param oid
	 *            订单号.
	 * @return 订单条目总数.
	 */
	@Override
	public int getCount(int oid) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"select count(0) as count from order_item where 1=1");
			if (oid != -1)
				sql.append(" and oid=" + oid);
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				while (rs.next()) {
					count = rs.getInt("count");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (ps != null) {
					try {
						ps.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return count;
	}

	/**
	 * 添加订单条目.
	 * 
	 * @param orderItemBean
	 *            订单条目对象.
	 * @return 添加是否成功.
	 */
	@Override
	public boolean insertOrderItem(order_itemBean orderItemBean) {
		int count = 0;
		
		Connection conn = Conn.getConn();
		String sql = "insert into order_item(oid,fid,fname,fdescription,fprice,fimg,ncount,ntotalprice)"
				+ " values (?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = Conn.prepare(conn, sql);
		try {
			pstmt.setInt(1, orderItemBean.getOid());
			pstmt.setInt(2, orderItemBean.getFid());
			pstmt.setString(3, orderItemBean.getFname());
			pstmt.setString(4, orderItemBean.getFdescription());
			pstmt.setDouble(5, orderItemBean.getFprice());
			pstmt.setString(6, orderItemBean.getFimg());
			pstmt.setInt(7, orderItemBean.getNcount());
			pstmt.setDouble(8, orderItemBean.getNtotalprice());
			count=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Conn.close(pstmt);
			Conn.close(conn);
		}
		if (count != 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 根据订单号查询所有订单条目.
	 * 
	 * @param oid
	 *            订单号.
	 * @param pastart
	 *            结果 开始行(-1:表无此条件).
	 * @param paend
	 *            结果 结束行(-1:表无此条件).
	 * @return 订单条目集.
	 */
	@Override
	public List<order_itemBean> searchOrderItem(int oid, int pastart, int paend) {
		Connection con = Conn.getConn();
		List<order_itemBean> list = null;
		if (con != null) {
			StringBuffer sql = new StringBuffer();
			sql.append("select nid,oid,fid,fname,fdescription,fprice,fimg,ncount,ntotalprice from order_item where oid=");
			sql.append(oid);
			if (pastart!=-1&&paend!=-1){
				sql.append(" limit " + (pastart-1));
				sql.append("," + (paend-pastart+1));
			}
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				list = new ArrayList<order_itemBean>();
				while (rs.next()) {
					order_itemBean orderItem = new order_itemBean();
					orderItem.setNid(rs.getInt("nid"));
					orderItem.setOid(rs.getInt("oid"));
					orderItem.setFid(rs.getInt("fid"));
					orderItem.setFname(rs.getString("fname"));
					orderItem.setFdescription(rs.getString("fdescription"));
					orderItem.setFprice(rs.getDouble("fprice"));
					orderItem.setFimg(rs.getString("fimg"));
					orderItem.setNcount(rs.getInt("ncount"));
					orderItem.setNtotalprice(rs.getInt("ntotalprice"));
					list.add(orderItem);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (ps != null) {
					try {
						ps.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return list;
	}

	/**
	 * 根据订单号查询所有订单条目.
	 * 
	 * @param oid
	 *            订单号.
	 * @return 订单条目集.
	 */
	@Override
	public List<order_itemBean> searchOrderItem(int oid) {
		return searchOrderItem(oid, -1, -1);
	}

}
