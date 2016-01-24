package com.es.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.es.dao.bean.ordersBean;
import com.es.dao.interf.ordersDAOinterf;
import com.es.dao.mysql.Conn;
import com.es.dao.pub.PublicGetDate;

public class ordersDAOImpl implements ordersDAOinterf {
	

	/**
	 * 订单审核.
	 * 
	 * @param orderBean
	 *            订单对象.
	 * 
	 * @return 操作是否成功.
	 */
	@Override
	public boolean auditingOrder(ordersBean orderBean) {
		int count = 0;
		//oid,cid,sid,osize,ototalprice,orderdate,opaytype,ostatus,oname,oaddress,ophone,oemail
		Connection conn = Conn.getConn();
		String sql = "update orders set ostatus=? where oid=?";
		PreparedStatement pstmt = Conn.prepare(conn, sql);
		try {
			pstmt.setInt(1, orderBean.getOstatus());
			pstmt.setInt(2,orderBean.getOid());
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
	@Override
	public int getCount(int oid, String cid, String sid, int ostatus,String startDate, String endDate) {
		if(searchOrder(oid, cid, sid, ostatus, startDate, endDate, -1, -1) != null) {
			return searchOrder(oid, cid, sid, ostatus, startDate, endDate ,-1, -1).size();
		} else {

			return 0;
		}
	}

	/**
	 * 获取订单总数.
	 * 
	 * @return 订单总数.
	 */
	@Override
	public int getCount() {
		
		Connection con = Conn.getConn();
		int oid = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"SELECT MAX(oid) FROM orders");

			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				if(rs.next()) {
					oid = rs.getInt(1);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return oid;
	}

	/**
	 * 获取订单编号.
	 * 
	 * @return 订单编号.
	 */
	@Override
	public int getOrderId() {
		Connection con = Conn.getConn();
		int oid = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"select oid from orders");

			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				if(rs.next()) {
					oid = rs.getInt(1);
					oid = Integer.parseInt(PublicGetDate.getDateFileName() + oid);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return oid;
	}

	/**
	 * 添加订单.
	 * 
	 * @param orderBean
	 *            订单对象.
	 * @return 添加是否成功.
	 */
	@Override
	public boolean insertOrder(ordersBean orderBean) {
		int count = 0;
		//oid,cid,sid,osize,ototalprice,orderdate,opaytype,ostatus,oname,oaddress,ophone,oemail	
		Connection conn = Conn.getConn();
		String sql = "insert into orders(oid,cid,sid,osize,ototalprice,orderdate,opaytype,ostatus,oname,oaddress,ophone,oemail"
				+ ") values (?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = Conn.prepare(conn, sql);
		try {
			pstmt.setInt(1, orderBean.getOid());
			pstmt.setString(2, orderBean.getCid());
			pstmt.setString(3, orderBean.getSid());
			pstmt.setInt(4,orderBean.getOsize());
			pstmt.setDouble(5,orderBean.getOtotalprice());
			pstmt.setString(6,orderBean.getOrderdate());
			pstmt.setInt(7,orderBean.getOpaytype());
			pstmt.setInt(8,orderBean.getOstatus());
			pstmt.setString(9,orderBean.getOname());
			pstmt.setString(10,orderBean.getOaddress());
			pstmt.setString(11,orderBean.getOphone());
			pstmt.setString(12,orderBean.getOemail());
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
	@Override
	public List<ordersBean> searchOrder(int oid, String cid, String sid,
			int ostatus, String startDate, String endDate, int pastart, int paend){
		Connection con = Conn.getConn();
		List<ordersBean> list = new ArrayList<ordersBean>();
		StringBuffer sql = new StringBuffer();
		sql.append("select oid,cid,sid,osize,ototalprice,orderdate,"
				+"opaytype,ostatus,oname,oaddress,ophone,oemail from orders where 1=1");
		if (oid != -1)
			sql.append(" and oid=" + oid);
		if (cid != null && !cid.equals(""))
			sql.append(" and cid='" + cid + "'");
		if (sid != null && !sid.equals(""))
			sql.append(" and sid='" + sid + "'");
		if (ostatus!=-1)
			sql.append(" and ostatus='" + ostatus + "'");
		if(startDate != null && !startDate.equals(""))
			sql.append(" and orderdate>=" + startDate);
		if(endDate != null && !endDate.equals(""))
			sql.append(" and orderdate<=" + endDate);
		if (pastart!=-1&&paend!=-1){
			sql.append(" limit " + (pastart-1));
			sql.append("," + (paend-pastart+1));
		}
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql.toString());
			rs = ps.executeQuery();
			while (rs.next()) {
				//oid,cid,sid,osize,ototalprice,orderdate,opaytype,ostatus,oname,oaddress,ophone,oemail
				ordersBean orderBean = new ordersBean();
				orderBean.setOid(rs.getInt("oid"));
				orderBean.setCid(rs.getString("cid"));
				orderBean.setSid(rs.getString("sid"));
				orderBean.setOsize(rs.getInt("osize"));
				orderBean.setOtotalprice(rs.getDouble("ototalprice"));
				orderBean.setOrderdate(rs.getString("orderdate"));
				orderBean.setOpaytype(rs.getInt("opaytype"));
				orderBean.setOstatus(rs.getInt("ostatus"));
				orderBean.setOname(rs.getString("oname"));
				orderBean.setOaddress(rs.getString("oaddress"));
				orderBean.setOphone(rs.getString("ophone"));
				orderBean.setOemail(rs.getString("oemail"));
				list.add(orderBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
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
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}


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
	@Override
	public List<ordersBean> searchOrder(int oid, String cid, String sid,int ostatus){
		return searchOrder(oid, cid, sid, ostatus, null, null, -1, -1);
	}

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
	@Override
	public List<ordersBean> searchOrder(String cid, int ostatus, int pastart,int paend){
		return searchOrder(-1, cid, null, ostatus, null, null, pastart, paend);
	}

	/**
	 * 获取所有订单.
	 * 
	 * @param cid
	 *            下单人(精确查) (null:表无此条件).
	 * @param ostatus
	 *            审核状态 (null:表无此条件).
	 * @return 订单集合.
	 */
	@Override
	public List<ordersBean> searchOrder(String cid, int ostatus) {
		return searchOrder(-1, cid, null, ostatus, null, null, -1, -1);
	}

	/**
	 * 获取订单对象.
	 * 
	 * @param oid
	 *            订单编号.
	 * @return 订单对象.
	 */
	@Override
	public ordersBean searchOrder(int oid) {
		Connection con = Conn.getConn();
		ordersBean orderBean = null;
		if (con != null) {
			StringBuffer sql = new StringBuffer();
			sql.append("select  oid,cid,sid,osize,ototalprice,orderdate,");
			sql.append("opaytype,ostatus,oname,oaddress,ophone,oemail");
			sql.append(" from orders where 1=1");
			if (oid != -1)
				sql.append(" and oid=" + oid);
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				while (rs.next()) {
					orderBean = new ordersBean();
					orderBean.setOid(rs.getInt("oid"));
					orderBean.setCid(rs.getString("cid"));
					orderBean.setSid(rs.getString("sid"));
					orderBean.setOsize(rs.getInt("osize"));
					orderBean.setOtotalprice(rs.getDouble("ototalprice"));
					orderBean.setOrderdate(rs.getString("orderdate"));
					orderBean.setOpaytype(rs.getInt("opaytype"));
					orderBean.setOstatus(rs.getInt("ostatus"));
					orderBean.setOname(rs.getString("oname"));
					orderBean.setOaddress(rs.getString("oaddress"));
					orderBean.setOphone(rs.getString("ophone"));
					orderBean.setOemail(rs.getString("oemail"));
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
		return orderBean;
	}

	/**
	 * 获取所有订单.
	 * 
	 * @return 订单集合.
	 */
	@Override
	public List<ordersBean> searchOrder() {
		return searchOrder(-1, null, null, -1, null, null, -1, -1);
	}

	/**
	 * 修改订单.
	 * 
	 * @param orderBean
	 *            订单对象.
	 * @return 添加是否成功.
	 */
	@Override
	public boolean updateOrder(ordersBean orderBean) {
		int count = 0;

		Connection conn = Conn.getConn();
		String sql = "update orders set opaytype=?,osname=?,oaddress=?,ophone=?,oemail=? where oid=?";
		PreparedStatement pstmt = Conn.prepare(conn, sql);
		try {
			pstmt.setInt(1,orderBean.getOpaytype());
			pstmt.setString(2,orderBean.getOname());
			pstmt.setString(3,orderBean.getOaddress());
			pstmt.setString(4,orderBean.getOphone());
			pstmt.setString(5,orderBean.getOemail());
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

}
