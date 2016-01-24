package com.es.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.es.dao.bean.customerBean;
import com.es.dao.interf.customerDAOinterf;
import com.es.dao.mysql.Conn;
import com.es.dao.pub.PublicGetDate;

public class customerDAOImpl implements customerDAOinterf {

	/**
	 * 删除用户.
	 * 
	 * @param cid
	 *            用户名.
	 * @return 删除是否成功.
	 */
	@Override
	public boolean deleteUser(String cid) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			PreparedStatement ps = null;
			StringBuffer sql = new StringBuffer("delete from customer where 1=1");
			if (cid != null && !cid.equals("")) {
				sql.append(" and cid='");
				sql.append(cid);
				sql.append("'");
			}
			try {
				ps = con.prepareStatement(sql.toString());
				count = ps.executeUpdate();
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
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 获取用户总数.
	 * 
	 * @return 用户总数.
	 */
	@Override
	public int getCount() {
		return getCount(null, null);
	}

	/**
	 * 获取用户总数.
	 * 
	 * @param cid
	 *            注册用户名(精确查) (null:表无此条件).
	 * @param cname
	 *            用户姓名(模糊查) (null:表无此条件).
	 * @return 用户总数.
	 */
	@Override
	public int getCount(String cid, String cname) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"select count(0) as count from customer where 1=1");
			if (cid != null && !cid.equals(""))
				sql.append(" and cid='" + cid + "'");
			if (cname != null && !cname.equals(""))
				sql.append(" and cname like '%" + cname + "%'");
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
	 * 注册用户.
	 * 
	 * @param userBean
	 *            用户对象.
	 * @return 添加是否成功.
	 */
	@Override
	public boolean insertUser(customerBean userBean) {
		Connection con = Conn.getConn();
		PublicGetDate date=new PublicGetDate();
		String sysdate= PublicGetDate.getDateTime();
		int count = 0;
		if (con != null) {
			PreparedStatement ps = null;
			String sql = "insert into customer(cid,cpwd,cname,csex,cemail,cphone,"
					+ "caddress,cregdate,clastdate) values "
					+ "(?,?,?,?,?,?,?,'"+sysdate+"','"+sysdate+"')";
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, userBean.getCid());
				ps.setString(2, userBean.getCpwd());
				ps.setString(3, userBean.getCname());
				ps.setString(4, userBean.getCsex());
				ps.setString(5, userBean.getCemail());
				ps.setString(6, userBean.getCphone());
				ps.setString(7, userBean.getCaddress());
				count = ps.executeUpdate();
			} catch (SQLException e1) {
				e1.printStackTrace();
			} finally {
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
		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}

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
	@Override
	public List<customerBean> searchUser(String cid, String cname, int pastart, int paend) {
		Connection con = Conn.getConn();
		List<customerBean> list = new ArrayList<customerBean>();
		if (con != null) {
			StringBuffer sql = new StringBuffer();
			sql.append("select cid,cpwd,cname,csex,cemail,cphone,caddress,cregdate");
			sql.append(",clastdate from customer where 1=1");
			if (cid != null && !cid.equals(""))
				sql.append(" and cid='" + cid + "'");
			if (cname != null && !cname.equals(""))
				sql.append(" and cname like '%" + cname + "%'");
			sql.append(" limit " + (pastart-1));
			sql.append("," + (paend-pastart+1));

			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				while (rs.next()) {
					//cid,cpwd,cname,csex,cemail,cphone,caddress,cregdate,clastdate
					customerBean userBean = new customerBean();
					userBean.setCid(rs.getString("cid"));
					userBean.setCpwd(rs.getString("cpwd"));
					userBean.setCname(rs.getString("cname"));
					userBean.setCsex(rs.getString("csex"));
					userBean.setCemail(rs.getString("cemail"));
					userBean.setCphone(rs.getString("cphone"));
					userBean.setCaddress(rs.getString("caddress"));
					userBean.setCregdate(rs.getString("cregdate"));
					userBean.setClastdate(rs.getString("clastdate"));
					list.add(userBean);
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
	 * 查询用户.
	 * 
	 * @param cid
	 *            注册用户名(精确查).
	 * @return 用户对象.
	 */
	@Override
	public customerBean searchUser(String cid) {
		Connection con = Conn.getConn();
		customerBean userBean = null;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"select cid,cpwd,cname,csex,cemail,cphone,caddress,cregdate,clastdate from customer where 1=1");
			if (cid != null && !cid.equals(""))
				sql.append(" and cid='" + cid + "'");
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				while (rs.next()) {
					userBean = new customerBean();
					userBean.setCid(rs.getString("cid"));
					userBean.setCpwd(rs.getString("cpwd"));
					userBean.setCname(rs.getString("cname"));
					userBean.setCsex(rs.getString("csex"));
					userBean.setCemail(rs.getString("cemail"));
					userBean.setCphone(rs.getString("cphone"));
					userBean.setCaddress(rs.getString("caddress"));
					userBean.setCregdate(rs.getString("cregdate"));
					userBean.setClastdate(rs.getString("clastdate"));
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
		return userBean;
	}

	/**
	 * 修改用户基础信息 (根据cid修改cpwd,cname,csex,cemail,cphone,caddress,cregdate,clastdate字段的值).
	 * 
	 * @param userBean
	 *            用户对象.
	 * @return 修改是否成功.
	 */
	@Override
	public boolean updateUser(customerBean userBean) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer();
			sql.append("update customer set cname=?,csex=?,cemail=?,cphone=?,caddress=?");
			sql.append(",clastdate=? where cid='"
					+ userBean.getCid() + "'");

			PreparedStatement ps = null;
			try {
				ps = con.prepareStatement(sql.toString());
				ps.setString(1, userBean.getCname());
				ps.setString(2, userBean.getCsex());
				ps.setString(3, userBean.getCemail());
				ps.setString(4, userBean.getCphone());
				ps.setString(5, userBean.getCaddress());
				ps.setString(6, userBean.getClastdate());
				count = ps.executeUpdate();
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
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}


	/**
	 * 修改密码.
	 * 
	 * @param cid
	 *            注册用户名.
	 * @param cpwd
	 *            密码.
	 * @return 修改是否成功.
	 */
	@Override
	public boolean updateUserForPWD(String cid, String cpwd) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"update customer set cpwd='" + cpwd
					+ "' where cid='" + cid + "'");
			PreparedStatement ps = null;
			try {
				ps = con.prepareStatement(sql.toString());
				count = ps.executeUpdate();
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
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}



}
