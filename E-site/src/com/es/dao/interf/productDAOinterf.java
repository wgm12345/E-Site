package com.es.dao.interf;

import java.util.List;

import com.es.dao.bean.ProductBean;
/**
 * 操作商品详细信息对象.
 * 
 */
public interface productDAOinterf {
//fid,fname,fdescription,fprice,fimag,sid,ftype,fstatus,fpraise
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
	public List<ProductBean> selectProduct(String fid, String sid,String fname, double prstart, double prend,
			int ftype, int pastart, int paend) ;
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
	public List<ProductBean> selectProduct(String sid,String fname, double prstart, double prend, int ftype,
			int pastart, int paend);

	/**
	 * 查询商品详细信息.
	 * 
	 * @param fid
	 *            商品编号.
	 * 
	 * @return 商品对象.
	 */
	public ProductBean selectProduct(String fid);

	/**
	 * 获取商品总记录数.
	 * 
	 * @return 总记录数.
	 */
	public int getCount();

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
	public int getCount(String fid,String sid,String fname, double prstart, double prend, int ftype) ;

	/**
	 * 添加商品.
	 * 
	 * @param food
	 *            添加商品对象.
	 * @return 添加是否成功.
	 */
	public boolean insertProduct(ProductBean food);

	/**
	 * 删除商品.
	 * 
	 * @param fid
	 *            商品编号.
	 * @return 是否成功.
	 */
	public boolean deleteProduct(String fid);

	/**
	 * 修改商品.
	 * 
	 * @param food
	 *            商品对象.
	 * @return 修改是否成功.
	 */
	public boolean updateProduct(ProductBean food);
}