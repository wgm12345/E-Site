package com.es.bo;

import java.io.Serializable;

import com.es.dao.bean.ProductBean;

/**
 * 购物车商品类别项
 * 
 */
public class Mc implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 商品类
	 */
	private ProductBean mcBean = null;
	
	/**
	 * 单件商品购买数量
	 */
	private int count = 0;

	/**
	 * 获取单件商品数量
	 * 
	 * @return 单件商品数量
	 */
	public int getCount() {
		return count;
	}

	/**
	 * 设置单件商品数量
	 * 
	 * @param count
	 * 			商品数量
	 */
	public void setCount(int count) {
		this.count = count;
	}

	/**
	 * 获取商品类
	 * 
	 * @return 商品类
	 */
	public ProductBean getMcBean() {
		return mcBean;
	}

	/**
	 * 设置商品类
	 * 
	 * @param mcBean
	 * 			商品类
	 */
	public void setMcBean(ProductBean mcBean) {
		this.mcBean = mcBean;
	}
	
	

}
