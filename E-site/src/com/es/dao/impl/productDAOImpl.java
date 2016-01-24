package com.es.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.es.dao.bean.ProductBean;
import com.es.dao.interf.productDAOinterf;
import com.es.dao.mysql.Conn;


public class productDAOImpl implements productDAOinterf {

	/**
	 * 删除商品.
	 * 
	 * @param fid
	 *            商品编号.
	 * @return 是否成功.
	 */
	@Override
	public boolean deleteProduct(String fid) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer("update product set fstatus=? where fid="
					+ fid);
			PreparedStatement ps = null;
			try {
				ps = con.prepareStatement(sql.toString());
				ps.setString(1, "0");
				count = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if (ps != null) {
					try {
						ps.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (con != null) {
					try {
						con.close();
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
	 * 获取商品总记录数.
	 * 
	 * @return 总记录数.
	 */
	@Override
	public int getCount() {
		return getCount(null,null,null, -1, -1, -1);
	}

	/**
	 * 获取商品总记录数.
	 * 
	 * @param fid
	 *            编号 
	 * @param sid
	 *            编号 
	 * @param fname
	 *            名
	 * @param prstart
	 *            按单价查询 起始单价 (-1:表无此条件).
	 * @param prend
	 *            按单价查询 终止单价 (-1:表无此条件).
	 * @param ftype
	 *            类 (-1:表无此条件).
	 * @return 总记录数.
	 */
	//fid,fname,fdescription,fprice,fimag,sid,ftype,fstatus,fpraise
	@Override
	public int getCount(String fid,String sid,String fname, double prstart, double prend, int ftype) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			StringBuffer sql = new StringBuffer();
			sql.append("select count(0) as count from product where 1=1");
			sql.append(" and fstatus=1");
			if (fid != null && !fid.equals(""))
				sql.append(" and fid =" + fid);
			if (sid != null && !sid.equals(""))
				sql.append(" and sid ='" + sid+"'");
			if (fname != null && !fname.equals(""))
				sql.append(" and fname like '%" + fname + "%'");
			if (prstart != -1)
				sql.append(" and fprice>=" + prstart);
			if (prend != -1)
				sql.append(" and fprice<=" + prend);
			if (ftype != -1)
				sql.append(" and ftype=" + ftype);
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				while (rs.next()) {
					count = rs.getInt("count");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
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
		return count;
	}

	/**
	 * 添加商品.
	 * 
	 * @param product
	 *            添加商品对象.
	 * @return 添加是否成功.
	 */
	@Override
	public boolean insertProduct(ProductBean product) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			//fid,fname,fdescription,fprice,fimag,sid,ftype,fstatus,fpraise
			String sql = "insert into product(fname,fdescription,fprice,fimg,sid,ftype,fstatus,fpraise) values (?,?,?,?,?,?,1,0)";
			PreparedStatement ps = null;
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, product.getFname());
				ps.setString(2, product.getFdescription());
				ps.setString(3, product.getFprice());
				ps.setString(4, product.getFimg());
				ps.setString(5, product.getSid());
				ps.setString(6, product.getFtype());
				count = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if (ps != null) {
					try {
						ps.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (con != null) {
					try {
						con.close();
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
	 * 查询商品详细信息.
	 * 
	 * @param fid
	 *            商品编号 (-1:表无此条件).
	 * @param sid
	 *            编号 
	 * @param fname
	 *            商品名.
	 * @param prstart
	 *            按单价查询 起始单价 (-1:表无此条件).
	 * @param prend
	 *            按单价查询 终止单价 (-1:表无此条件).
	 * @param ftype
	 *            类 (-1:表无此条件).
	 * @param pastart
	 *            记录行号 起始行 (-1:表无此条件).
	 * @param paend
	 *            记录行号 终止行 (-1:表无此条件).
	 * @return 商品集合.
	 */
	@Override
	public List<ProductBean> selectProduct(String fid, String sid,String fname, double prstart, double prend,
			int ftype, int pastart, int paend) {
		Connection con = Conn.getConn();
		List<ProductBean> list = new ArrayList<ProductBean>();
		if (con != null) {
			StringBuffer sql = new StringBuffer();
			sql.append("select fid,fname,fdescription,fprice,fimg,sid,ftype,fstatus,fpraise from product where 1=1");
			if (fid != null&&!fid.equals(""))
				sql.append(" and fid=" + fid);
			if (sid != null && !sid.equals(""))
				sql.append(" and sid ='" + sid+"'");
			sql.append(" and fstatus=1");
			if (fname != null && !fname.equals(""))
				sql.append(" and fname like '%" + fname + "%'");
			if (prstart != -1)
				sql.append(" and fprice>=" + prstart);
			if (prend != -1)
				sql.append(" and fprice<=" + prend);
			if (ftype != -1)
				sql.append(" and ftype=" + ftype);
			sql.append(" order by `fpraise` desc");
			sql.append(" limit " + (pastart-1));
			sql.append("," + (paend-pastart+1));

			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				while (rs.next()) {
					//fid,fname,fdescription,fprice,fimag,sid,ftype,fstatus,fpraise
					ProductBean mcBean = new ProductBean();
					mcBean.setFid(rs.getString("fid"));
					mcBean.setFname(rs.getString("fname"));
					mcBean.setFdescription(rs.getString("fdescription"));
					mcBean.setFprice(rs.getString("fprice"));
					mcBean.setFimg(rs.getString("fimg"));
					mcBean.setSid(rs.getString("sid"));
					mcBean.setFtype(rs.getString("ftype"));
					mcBean.setFstatus(rs.getString("fstatus"));
					mcBean.setFpraise(rs.getString("fpraise"));
					list.add(mcBean);
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
	//fid,fname,fdescription,fprice,fimag,sid,ftype,fstatus,fpraise
	/**
	 * 查询商品详细信息.
	 * @param sid
	 *            编号 
	 * @param fname
	 *            商品名.
	 * @param prstart
	 *            按单价查询 起始单价 (-1:表无此条件).
	 * @param prend
	 *            按单价查询 终止单价 (-1:表无此条件).
	 * @param ftype
	 *            类 (-1:表无此条件).
	 * @param pastart
	 *            记录行号 起始行 (-1:表无此条件).
	 * @param paend
	 *            记录行号 终止行 (-1:表无此条件).
	 * @return 商品集合.
	 */
	@Override
	public List<ProductBean> selectProduct(String sid,String fname, double prstart, double prend, int ftype,
			int pastart, int paend) {
		return selectProduct(null,sid,fname, prstart, prend, ftype, pastart, paend);
	}

	/**
	 * 查询商品详细信息.
	 * 
	 * @param fid
	 *            商品编号.
	 * 
	 * @return 商品对象.
	 */
	@Override
	public ProductBean selectProduct(String fid) {
		Connection con = Conn.getConn();
		ProductBean mcBean = null;
		if (con != null) {
			StringBuffer sql = new StringBuffer(
					"select fid,fname,fdescription,fprice,fimg,sid,ftype,fstatus,fpraise from product where 1=1");
			if (fid != null&&!fid.equals(""))
				sql.append(" and fid=" + fid);
			sql.append(" and fstatus=1");
			sql.append(" order by `fpraise` desc");
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				while (rs.next()) {
					mcBean = new ProductBean();
					mcBean.setFid(rs.getString("fid"));
					mcBean.setFname(rs.getString("fname"));
					mcBean.setFdescription(rs.getString("fdescription"));
					mcBean.setFprice(rs.getString("fprice"));
					mcBean.setFimg(rs.getString("fimg"));
					mcBean.setSid(rs.getString("sid"));
					mcBean.setFtype(rs.getString("ftype"));
					mcBean.setFstatus(rs.getString("fstatus"));
					mcBean.setFpraise(rs.getString("fpraise"));
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
		return mcBean;
	}

	/**
	 * 修改商品.
	 * 
	 * @param product
	 *            商品对象.
	 * @return 修改是否成功.
	 */
	@Override
	public boolean updateProduct(ProductBean product) {
		Connection con = Conn.getConn();
		int count = 0;
		if (con != null) {
			String sql = "update product set fname=?,fdescription=?,fprice=?,fimg=?,sid=?,ftype=?,fstatus=?,fpraise=? where fid="
					+ product.getFid();
			PreparedStatement ps = null;
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, product.getFname());
				ps.setString(2, product.getFdescription());
				ps.setString(3, product.getFprice());
				ps.setString(4, product.getFimg());
				ps.setString(5, product.getSid());
				ps.setString(6, product.getFtype());
				ps.setString(7, product.getFstatus());
				ps.setString(8, product.getFpraise());
				count = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if (ps != null) {
					try {
						ps.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (con != null) {
					try {
						con.close();
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


}
