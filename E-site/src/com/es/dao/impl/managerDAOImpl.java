package com.es.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.es.dao.bean.managerBean;
import com.es.dao.interf.managerDAOinterf;
import com.es.dao.mysql.Conn;

public class managerDAOImpl implements managerDAOinterf {

	/**
	 * 删除用户.
	 * 
	 * @param mid
	 *            用户名.
	 * @return 删除是否成功.
	 */
	@Override
	public boolean deleteUser(String mid) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			PreparedStatement ps = null;
			StringBuffer sql = new StringBuffer("delete from manager where 1=1");
			if (mid != null && !mid.equals("")) {
				sql.append(" and mid='");
				sql.append(mid);
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
	 * @param mid
	 *            注册用户名(精确查) (null:表无此条件).
	 * @param mname
	 *            用户姓名(模糊查) (null:表无此条件).
	 * @return 用户总数.
	 */
	@Override
	public int getCount(String mid, String mname) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"select count(0) as count from manager where 1=1");
			if (mid != null && !mid.equals(""))
				sql.append(" and mid='" + mid + "'");
			if (mname != null && !mname.equals(""))
				sql.append(" and mname like '%" + mname + "%'");
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
	public boolean insertUser(managerBean userBean) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			PreparedStatement ps = null;
			String sql = "insert into manager(mid,mpwd,mname,msex,mphone,maddress,memail,mlevel) values"
					+ "(?,?,?,?,?,?,?,0)";
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, userBean.getMid());
				ps.setString(2, userBean.getMpwd());
				ps.setString(3, userBean.getMname());
				ps.setString(4, userBean.getMsex());
				ps.setString(5, userBean.getMphone());
				ps.setString(6, userBean.getMaddress());
				ps.setString(7, userBean.getMemail());
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
	 * @param mid
	 *            注册用户名(精确查) (null:表无此条件).
	 * @param mname
	 *            用户姓名(模糊查) (null:表无此条件).
	 * @param pastart
	 *            记录 开始行 
	 * @param paend
	 *            记录 结束行 
	 * @return 用户对象集.
	 */
	@Override
	public List<managerBean> searchUser(String mid, String mname,int pastart, int paend) {
		Connection con = Conn.getConn();
		List<managerBean> list = new ArrayList<managerBean>();
		if (con != null) {
			StringBuffer sql = new StringBuffer();
			sql.append("select mid,mpwd,mname,msex,mphone,maddress,memail,mlevel");
			sql.append(" from manager where 1=1");
			if (mid != null && !mid.equals(""))
				sql.append(" and mid='" + mid + "'");
			if (mid != null && !mname.equals(""))
				sql.append(" and mname like '%" + mname + "%'");
			sql.append(" limit " + (pastart-1));
			sql.append("," + (paend-pastart+1));

			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				while (rs.next()) {
					managerBean userBean = new managerBean();
					userBean.setMid(rs.getString("mid"));
					userBean.setMpwd(rs.getString("mpwd"));
					userBean.setMname(rs.getString("mname"));
					userBean.setMsex(rs.getString("msex"));
					userBean.setMphone(rs.getString("mphone"));
					userBean.setMaddress(rs.getString("maddress"));
					userBean.setMemail(rs.getString("memail"));
					userBean.setMlevel(rs.getInt("mlevel"));
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
	 * @param mid
	 *            注册用户名(精确查).
	 * @return 用户对象.
	 */
	//mid,mpwd,mname,msex,mphone,maddress,memail
	@Override
	public managerBean searchUser(String mid) {
		Connection con = Conn.getConn();
		managerBean userBean = null;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"select mid,mpwd,mname,msex,mphone,maddress,memail,mlevel from manager where 1=1");
			if (mid != null && !mid.equals(""))
				sql.append(" and mid='" + mid + "'");
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				while (rs.next()) {
					userBean = new managerBean();
					userBean.setMid(rs.getString("mid"));
					userBean.setMpwd(rs.getString("mpwd"));
					userBean.setMname(rs.getString("mname"));
					userBean.setMsex(rs.getString("msex"));
					userBean.setMphone(rs.getString("mphone"));
					userBean.setMaddress(rs.getString("maddress"));
					userBean.setMemail(rs.getString("memail"));
					userBean.setMlevel(rs.getInt("mlevel"));
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
	 *修改用户基础信息 (根据mid修改mpwd,mname,msex,mphone,maddress,memail字段的值).
	 * 
	 * @param userBean
	 *            用户对象.
	 * @return 修改是否成功.
	 */
	@Override
	public boolean updateUser(managerBean userBean) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer();
			sql.append("update manager set mpwd=?,mname=?,msex=?,mphone=?,maddress=?,memail=?");
			sql.append(" where mid='"
					+ userBean.getMid() + "'");

			PreparedStatement ps = null;
			try {
				ps = con.prepareStatement(sql.toString());
				ps.setString(1, userBean.getMpwd());
				ps.setString(2, userBean.getMname());
				ps.setString(3, userBean.getMsex());
				ps.setString(4, userBean.getMphone());
				ps.setString(5, userBean.getMaddress());
				ps.setString(6, userBean.getMemail());
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
	 * @param mid
	 *            注册用户名.
	 * @param mpwd
	 *            密码.
	 * @return 修改是否成功.
	 */
	@Override
	public boolean updateUserForPWD(String mid, String mpwd) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"update manager set mpwd='" + mpwd
					+ "' where mid='" + mid + "'");
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
