package com.es.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.es.dao.bean.sale_promBean;
import com.es.dao.interf.sale_promDAOinterf;
import com.es.dao.mysql.Conn;

public class sale_promDAOImpl implements sale_promDAOinterf {

	/**
	 * 删除
	 * 
	 * @param pid
	 *            编号.
	 * @return 操作是否成功.
	 */
	@Override
	public boolean deleteSP(int pid) {
		int count = 0;
		Connection con = Conn.getConn();
		if (con != null) {
			String sql = "update sales_promotion set pstatus=0 where pid=" + pid ;
			Statement pesmt = null;
			try {
				pesmt = con.createStatement();
				pesmt.executeUpdate(sql);
				count = 1;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (pesmt != null) {
					try {
						pesmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			}
		}
		if (count != 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 添加.
	 * 
	 * @param sale_p
	 *            对象.
	 * @return 添加是否成功.
	 */
	@Override
	public boolean insertSP(sale_promBean sale_p) {
		int count = 0;
		//pid,pname,pstartime,pendtime,pdescription
		Connection conn = Conn.getConn();
		String sql = "insert into sales_promotion(pname,pstartime,pendtime,pdescription,pstatus) values (?,?,?,?,1)";
		PreparedStatement pstmt = Conn.prepare(conn, sql);
		try {
			pstmt.setString(1, sale_p.getPname());
			pstmt.setString(2, sale_p.getPstartime());
			pstmt.setString(3, sale_p.getPendtime());
			pstmt.setString(4, sale_p.getPdescription());
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
	 * 查询信息.
	 * 
	 * @param pid
	 *            (精确查)编号
	 * @param pname
	 *            (模糊查)名
	 *            	 * @param pastart
	 *            记录 开始行 
	 * @param paend
	 *            记录 结束行 
	 * @return 集合.
	 */
	@Override
	public List<sale_promBean> searchSP(int pid, String pname,int pastart, int paend) {
		Connection con = Conn.getConn();
		List<sale_promBean> list = new ArrayList<sale_promBean>();
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"select pid,pname,pstartime,pendtime,pdescription from sales_promotion where 1=1");
			if (pid != -1)
				sql.append(" and pid=" + pid);
			sql.append(" and pstatus=1");
			if (pname != null && !pname.equals(""))
				sql.append(" and pname like '%" + pname + "%'");
			sql.append(" limit " + (pastart-1));
			sql.append("," + (paend-pastart+1));
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				while (rs.next()) {
					sale_promBean sp = new sale_promBean();
					sp.setPid(rs.getInt("pid"));
					sp.setPname(rs.getString("pname"));
					sp.setPstartime(rs.getString("pstartime"));
					sp.setPendtime(rs.getString("pendtime"));
					sp.setPdescription(rs.getString("pdescription"));
					list.add(sp);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
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
		return list;
	}

	/**
	 * 查询信息.
	 * 
	 * @param pid
	 *            (精确查)编号
	 * @return 集合.
	 */
	@Override
	public sale_promBean searchSP(int pid) {
		Connection con = Conn.getConn();
		sale_promBean sp = null;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"select pid,pname,pstartime,pendtime,pdescription from sales_promotion where 1=1");
			if (pid != -1)
				sql.append(" and pid=" + pid);
			sql.append(" and pstatus=1");
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				while (rs.next()) {
					sp = new sale_promBean();
					sp.setPid(rs.getInt("pid"));
					sp.setPname(rs.getString("pname"));
					sp.setPstartime(rs.getString("pstartime"));
					sp.setPendtime(rs.getString("pendtime"));
					sp.setPdescription(rs.getString("pdescription"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
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
		return sp;
	}


	/**
	 * 修改
	 * 
	 * @param sale_p
	 *            商品类别对象.
	 * @return 修改是否成功.
	 */
	@Override
	public boolean updateSP(sale_promBean sale_p){
		int count = 0;
		//pid,pname,pstartime,pendtime,pdescription
		Connection conn = Conn.getConn();
		String sql = "update sales_promotion set pname=?,pendtime=?,pdescription=? where pid="+ sale_p.getPid();
		PreparedStatement pstmt = Conn.prepare(conn, sql);
		try {
			pstmt.setString(1, sale_p.getPname());
			pstmt.setString(2, sale_p.getPstartime());
			pstmt.setString(3, sale_p.getPendtime());
			pstmt.setString(4, sale_p.getPdescription());
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
	 * 获取公告总数.
	 * 
	 * @return 公告总数.
	 */
	@Override
	public int getCount() {
		return getCount(-1, null);
	}

	/**
	 * 获取用户总数.
	 * 
	 * @param pid
	 *            公告号(精确查) (null:表无此条件).
	 * @param pname
	 *            公告名(模糊查) (null:表无此条件).
	 * @return 公告总数.
	 */
	@Override
	public int getCount(int pid, String pname) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"select count(0) as count from sales_promotion where 1=1");
			if (pid != -1 )
				sql.append(" and pid='" + pid + "'");
			sql.append(" and pstatus=1");
			if (pname != null && !pname.equals(""))
				sql.append(" and pname like '%" + pname + "%'");
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


}
