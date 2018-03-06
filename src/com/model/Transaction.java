package com.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Transaction {
	private String TollPlaza, Username;
	private long EZTagCode;
	private double Amount = 0.00;

	public Transaction(long EZT, String TP, double Amt) {
		EZTagCode = EZT;
		Amount = Amt;
		TollPlaza = TP;
	}

	public Transaction(String Username) {
		this.Username = Username;
	}

	public boolean insertTransaction() {
		boolean done = !TollPlaza.equals("");
		String SQL_Command = "";
		try {
			if (done) {
				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				Date date = new Date();
				DBConnection ToDB = new DBConnection(); // Have a connection to
														// the DB
				Connection DBConn = ToDB.openConn();
				Statement Stmt = DBConn.createStatement();
				SQL_Command = "INSERT INTO [JavaClass].[dbo].[Transaction](T_DateTime, Amount, Type,Plaza, EZ_Tag) VALUES ('"
						+ date + "','" + Amount + "','Manual','" + TollPlaza + "','" + EZTagCode + "')";
				System.out.println(SQL_Command);
				Stmt.executeUpdate(SQL_Command);
				Stmt.close();
				ToDB.closeConn();
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

	public List getTransaction(String UserName) {
		String SQL_Command = "";

		List<List> ls1 = new ArrayList<List>();
		Map<String, Object> mp = new HashMap<String, Object>();
		try {
			DBConnection ToDB = new DBConnection(); // Have a connection to
													// the DB
			Connection DBConn = ToDB.openConn();
			Statement Stmt = DBConn.createStatement();
			SQL_Command = "SELECT t.t_id as tId, " + "t.t_datetime as date, " + "t.amount as amount, "
					+ "t.plaza as plaza, " + "t.type as type, " + "t.ez_tag as eztag "
					+ "FROM   [JavaClass].[dbo].[transaction] t " + "LEFT JOIN [JavaClass].[dbo].[eztag] e "
					+ "ON t.ez_tag = e.ez_tag " + "LEFT JOIN [JavaClass].[dbo].[account] a "
					+ "ON e.account_no = a.account_no " + "WHERE  a.username = '" + UserName + "'; ";
			System.out.println(SQL_Command);
			ResultSet rs = Stmt.executeQuery(SQL_Command);
			while (rs.next()) {
				List<Object> ls = new ArrayList<Object>();
				ls.add(rs.getLong("tId"));
				ls.add(rs.getString("date"));
				ls.add(rs.getInt("amount"));
				ls.add(rs.getString("plaza"));
				ls.add(rs.getLong("eztag"));
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

}
