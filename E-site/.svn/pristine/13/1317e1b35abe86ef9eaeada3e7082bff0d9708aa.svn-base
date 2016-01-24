/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wy.tools;

import java.sql.*;

import javax.sql.DataSource;

/**
 * 
 * @author Administrator
 */
public class JDBConnection
    {
	  private final String dbDriver = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
	    private final String url = "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_register";
	    private final String userName = "sa";
	    private final String password = "";
	    private Connection con = null;

	    public JDBConnection() {
	        try {
	            Class.forName(dbDriver).newInstance();
	        } catch (Exception ex) {
	            System.out.println(" ˝æ›ø‚º”‘ÿ ß∞‹");
	        }
	    }

	    private boolean createConnection() {
	        try {
	            con = DriverManager.getConnection(url, userName, password);
	            con.setAutoCommit(true);
	        } catch (SQLException e) {
	            System.out.println(e.getMessage());
	        }
	        return true;
	    }


	
	public boolean executeUpdate(String sql)
	    {
		if (null == con)
		    this.createConnection();
		try
		    {
			Statement stmt = con.createStatement();
			stmt.executeUpdate(sql);
			return true;
		    } catch (SQLException e)
		    {
			System.out.println(e.getMessage());
			return false;
		    }
	    }
	
	public ResultSet executeQuery(String sql)
	    {
		ResultSet rs;
		if (null == con)
		    this.createConnection();
		try
		    {			
			Statement stmt = con.createStatement();
			try
			    {
				rs = stmt.executeQuery(sql);
			    } catch (SQLException e)
			    {
				System.out.println(e.getMessage());
				return null;
			    }
		    } catch (SQLException e)
		    {
			System.out.println(e.getMessage());
			return null;
		    }
		return rs;
	    }
	
	public void closeConnection()
	    {
		if (con != null)
		    {
			try
			    {
				con.close();
			    } catch (SQLException e)
			    {
			    } finally
			    {
				con = null;
			    }
		    }
	    }
    }
