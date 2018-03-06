package com.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EZTag {
	private Long EZTagCode, AccountNo;
	private String Username, type;

	public EZTag(Long EZTagId, String Username, String type, Long AccountNo) {
		this.EZTagCode = EZTagId;
		this.Username = Username;
		this.type = type;
		this.AccountNo = AccountNo;
	}

	public boolean addEZTag() {
		boolean done = true;
		String SQL_Command = "";
		try {
			if (done) {
				DBConnection ToDB = new DBConnection(); // Have a connection to
														// the DB
				Connection DBConn = ToDB.openConn();
				Statement Stmt = DBConn.createStatement();
				SQL_Command = "INSERT INTO [JavaClass].[dbo].[EZTag](EZ_Tag,Type,Account.Account_No,status) VALUES ('"
						+ EZTagCode + "','" + type + "','" + AccountNo + "',1)";
				System.out.println(SQL_Command);
				Stmt.executeUpdate(SQL_Command);
				Stmt.close();
				ToDB.closeConn();
				System.out.println("EZTag deleted");
			}
		} catch (java.sql.SQLException e) {
			done = false;
			System.out.println("SQLException: " + e);
			while (e != null) {
				System.out.println("SQLState: " + e.getSQLState());
				System.out.println("Message: " + e.getMessage());
				System.out.println("Vendor: " + e.getErrorCode());
				e = e.getNextException();
				System.out.println("");
			}
		} catch (java.lang.Exception e) {
			done = false;
			System.out.println("Exception: " + e);
			e.printStackTrace();
		}
		return done;
	}

	public List getEZTag() {
		String SQL_Command = "";

		List<List> ls1 = new ArrayList<List>();
		Map<String, Object> mp = new HashMap<String, Object>();
		try {
			DBConnection ToDB = new DBConnection(); // Have a connection to
													// the DB
			Connection DBConn = ToDB.openConn();
			Statement Stmt = DBConn.createStatement();
			SQL_Command = "  SELECT e.EZ_Tag as eztag,  " + " 		e.Type as type  "
					+ "  FROM   [JavaClass].[dbo].[EZTag] e   " + "         LEFT JOIN [JavaClass].[dbo].[account] a   "
					+ "                ON e.account_no = a.account_no   " + "  WHERE  e.status = 1 AND a.username = '"
					+ Username + "'  ";
			System.out.println(SQL_Command);
			ResultSet rs = Stmt.executeQuery(SQL_Command);
			while (rs.next()) {
				List<Object> ls = new ArrayList<Object>();
				ls.add(rs.getLong("eztag"));
				ls.add(rs.getString("type"));
				ls1.add(ls);
			}
			Stmt.close();
			ToDB.closeConn();
			return ls1;
		} catch (java.sql.SQLException e) {
			System.out.println("SQLException: " + e);
			while (e != null) {
				System.out.println("SQLState: " + e.getSQLState());
				System.out.println("Message: " + e.getMessage());
				System.out.println("Vendor: " + e.getErrorCode());
				e = e.getNextException();
				System.out.println("");
			}
		} catch (java.lang.Exception e) {
			System.out.println("Exception: " + e);
			e.printStackTrace();
		}
		return null;
	}

	public boolean removeEZTag() {
		boolean done = true;
		String SQL_Command = "";
		try {
			if (done) {
				DBConnection ToDB = new DBConnection(); // Have a connection to
														// the DB
				Connection DBConn = ToDB.openConn();
				Statement Stmt = DBConn.createStatement();
				SQL_Command = "UPDATE [JavaClass].[dbo].[EZTag] set status = 0 where EZ_Tag =" + EZTagCode;
				System.out.println(SQL_Command);
				Stmt.executeUpdate(SQL_Command);
				Stmt.close();
				ToDB.closeConn();
				System.out.println("EZTag deleted");
			}
		} catch (java.sql.SQLException e) {
			done = false;
			System.out.println("SQLException: " + e);
			while (e != null) {
				System.out.println("SQLState: " + e.getSQLState());
				System.out.println("Message: " + e.getMessage());
				System.out.println("Vendor: " + e.getErrorCode());
				e = e.getNextException();
				System.out.println("");
			}
		} catch (java.lang.Exception e) {
			done = false;
			System.out.println("Exception: " + e);
			e.printStackTrace();
		}
		return done;
	}
}
