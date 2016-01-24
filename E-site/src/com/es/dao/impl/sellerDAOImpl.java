package com.es.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.es.dao.bean.sellerBean;
import com.es.dao.interf.sellerDAOinterf;
import com.es.dao.mysql.Conn;
import com.es.dao.pub.PublicGetDate;
public class sellerDAOImpl implements sellerDAOinterf {

	/**
	 * 删除用户.
	 * 
	 * @param sid
	 *            用户名.
	 * @return 删除是否成功.
	 */
	@Override
	public boolean deleteUser(String sid) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			PreparedStatement ps = null;
			StringBuffer sql = new StringBuffer("delete from seller where 1=1");
			if (sid != null && !sid.equals("")) {
				sql.append(" and sid='");
				sql.append(sid);
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
	 * @param sid
	 *            注册用户名(精确查) (null:表无此条件).
	 * @param sname
	 *            用户姓名(模糊查) (null:表无此条件).
	 * @return 用户总数.
	 */
	@Override
	public int getCount(String sid, String sname){
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"select count(0) as count from seller where 1=1");
			if (sid != null && !sid.equals(""))
				sql.append(" and sid='" + sid + "'");
			if (sname != null && !sname.equals(""))
				sql.append(" and sname like '%" + sname + "%'");
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
	//sid,spwd,sname,sphone,saddress,sdescription,semail,spraise,sregdate,slastdate
	@Override
	public boolean insertUser(sellerBean userBean){
		Connection con = Conn.getConn();
		PublicGetDate date=new PublicGetDate();
		String sysdate= PublicGetDate.getDateTime();
		int count = 0;
		if (con != null) {
			PreparedStatement ps = null;
			String sql = "insert into seller(sid,spwd,sname,sphone,saddress,sdescription,semail,"
					+ "spraise,sregdate,slastdate) values "
					+ "(?,?,?,?,?,?,?,0,'"+sysdate+"','"+sysdate+"')";
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, userBean.getSid());
				ps.setString(2, userBean.getSpwd());
				ps.setString(3, userBean.getSname());
				ps.setString(4, userBean.getSphone());
				ps.setString(5, userBean.getSaddress());
				ps.setString(6, userBean.getSdescription());
				ps.setString(7, userBean.getSemail());
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
	 * @param sid
	 *            注册用户名(精确查) (null:表无此条件).
	 * @param sname
	 *            用户姓名(模糊查) (null:表无此条件).
	 * @param pastart
	 *            记录 开始行 (-1:表无此条件).
	 * @param paend
	 *            记录 结束行 (-1:表无此条件).
	 * @return 用户对象集.
	 */
	@Override
	public List<sellerBean> searchUser(String sid, String sname,int pastart, int paend){
		Connection con = Conn.getConn();
		List<sellerBean> list = new ArrayList<sellerBean>();
		if (con != null) {
			StringBuffer sql = new StringBuffer();
			sql.append("select sid,spwd,sname,sphone,saddress,sdescription,semail,spraise,");
			sql.append("sregdate,slastdate");
			sql.append(" from seller where 1=1"); 
			if (sid != null && !sid.equals(""))
				sql.append(" and sid='" + sid + "'");
			if (sname != null && !sname.equals(""))
				sql.append(" and sname like '%" + sname + "%'");
			sql.append(" order by `spraise` desc");
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
					sellerBean userBean = new sellerBean();
					userBean.setSid(rs.getString("sid"));
					userBean.setSpwd(rs.getString("spwd"));
					userBean.setSname(rs.getString("sname"));
					userBean.setSphone(rs.getString("sphone"));
					userBean.setSaddress(rs.getString("saddress"));
					userBean.setSdescription(rs.getString("sdescription"));
					userBean.setSemail(rs.getString("semail"));
					userBean.setSpraise(rs.getInt("spraise"));
					userBean.setSregdate(rs.getString("sregdate"));
					userBean.setSlastdate(rs.getString("slastdate"));
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
	 * @param sid
	 *            注册用户名(精确查).
	 * @return 用户对象.
	 */
	@Override
	public sellerBean searchUser(String sid){
		Connection con = Conn.getConn();
		sellerBean userBean = null;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"select sid,spwd,sname,sphone,saddress,sdescription,semail,spraise,sregdate,slastdate from seller where 1=1");
			if (sid != null && !sid.equals(""))
				sql.append(" and sid='" + sid + "'");
			sql.append(" order by `spraise` desc");
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				while (rs.next()) {
					userBean = new sellerBean();
					userBean.setSid(rs.getString("sid"));
					userBean.setSpwd(rs.getString("spwd"));
					userBean.setSname(rs.getString("sname"));
					userBean.setSphone(rs.getString("sphone"));
					userBean.setSaddress(rs.getString("saddress"));
					userBean.setSdescription(rs.getString("sdescription"));
					userBean.setSemail(rs.getString("semail"));
					userBean.setSpraise(rs.getInt("spraise"));
					userBean.setSregdate(rs.getString("sregdate"));
					userBean.setSlastdate(rs.getString("slastdate"));
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
	 * 修改用户基础信息 (根据sid修改spwd,sname,sphone,saddress,sdescription,semail,spraise,sregdate,slastdate字段的值).
	 * 
	 * @param userBean
	 *            用户对象.
	 * @return 修改是否成功.
	 */
	@Override
	public boolean updateUser(sellerBean userBean){
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer();
			sql.append("update seller set spwd=?,sname=?,sphone=?,saddress=?,sdescription=?,semail=?,spraise=?,");
			sql.append("slastdate=? where sid='"
							+ userBean.getSid() + "'");

			PreparedStatement ps = null;
			try {
				ps = con.prepareStatement(sql.toString());
				ps.setString(1, userBean.getSpwd());
				ps.setString(2, userBean.getSname());
				ps.setString(3, userBean.getSphone());
				ps.setString(4, userBean.getSaddress());
				ps.setString(5, userBean.getSdescription());
				ps.setString(6, userBean.getSemail());
				ps.setInt(7, userBean.getSpraise());
				ps.setString(8, userBean.getSlastdate());
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
	 * @param sid
	 *            注册用户名.
	 * @param spwd
	 *            密码.
	 * @return 修改是否成功.
	 */
	@Override
	public boolean updateUserForPWD(String sid, String spwd){
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"update seller set spwd='" + spwd
							+ "' where sid='" + sid + "'");
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
