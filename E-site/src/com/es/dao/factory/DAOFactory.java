package com.es.dao.factory;

import com.es.dao.impl.*;
import com.es.dao.interf.*;



/**
 * 工厂类,用于实例化接口实现类对象
 * 
 */
public class DAOFactory {

	/**
	 * 返回一个customerDAOImpl实例化对象
	 * 
	 * @return customerDAOImpl实例对象
	 */
	public static customerDAOinterf createCustomerDAO() {
		return new customerDAOImpl();
	}
	/**
	 * 返回一个managerDAOImpl实例化对象
	 * 
	 * @return managerDAOImpl实例对象
	 */
	public static managerDAOinterf createManagerDAO() {
		return new managerDAOImpl();
	}
	/**
	 * 返回一个sellerDAOImpl实例化对象
	 * 
	 * @return sellerDAOImpl实例对象
	 */
	public static sellerDAOinterf createSellerDAO() {
		return new sellerDAOImpl();
	}

	/**
	 * 返回一个foodDAOImpl实例化对象
	 * 
	 * @return foodDAOImpl实例对象
	 */
	public static productDAOinterf createProductDAO() {
		return new productDAOImpl();
	}

	/**
	 * 返回一个sale_promDAOImpl实例化对象
	 * 
	 * @return sale_promDAOImpl实例对象
	 */
	public static sale_promDAOinterf createSalePromDAO() {
		return new sale_promDAOImpl();
	}

	/**
	 * 返回一个ordersDAOImpl实例化对象
	 * 
	 * @return ordersDAOImpl实例对象
	 */
	public static ordersDAOinterf createOrdersDAO() {
		return new ordersDAOImpl();
	}

	/**
	 * 返回一个order_itemDAOImpl实例化对象
	 * 
	 * @return order_itemDAOImpl实例对象
	 */
	public static order_itemDAOinterf createOrderItemDAO() {
		return new order_itemDAOImpl();
	}
}
