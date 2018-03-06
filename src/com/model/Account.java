package com.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Account {
	private String Username, Password, Password1, Name;
	private long EZTagCode;
	private Double Amount, Balance;

	public Account(String UN, String PassW, String PassW1, String NM, Double Balance) {
		Username = UN;
		Password = PassW;
		Password1 = PassW1;
		Name = NM;
		this.Balance = Balance;
	}

	public Account(String UN, String PassW) {
		Username = UN;
		Password = PassW;
	}

	public Account(long EZT, double Amt) {
		EZTagCode = EZT;
		Amount = Amt;
	}

	public boolean signUp() {
		boolean done = !Username.equals("") && !Password.equals("") && !Password1.equals("")
				&& Password.equals(Password1);
		try {
			if (done) {
				DBConnection ToDB = new DBConnection(); // Have a connection to
														// the DB
				Connection DBConn = ToDB.openConn();
				Statement Stmt = DBConn.createStatement();
				String SQL_Command = "SELECT Username FROM Account WHERE Username ='" + Username + "'"; // SQL
				ResultSet Rslt = Stmt.executeQuery(SQL_Command); // Inquire if
																	// the
																	// username
																	// exsits.
				done = done && !Rslt.next();
				if (done) {
					SQL_Command = "INSERT INTO Account(Username, Password, Name,Balance) VALUES ('" + Username + "','"
							+ Password + "','" + Name + "'," + Balance + ")"; // Save
																				// the
					// username,
					// password and
					// Name
					System.out.println(SQL_Command);
					Stmt.executeUpdate(SQL_Command);
				}
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

	public String signIn() {
		boolean done = !Username.equals("") && !Password.equals("");
		String Uname = "";
		try {
			if (done) {

				DBConnection ToDB = new DBConnection(); // Have a connection to
														// the DB
				Connection DBConn = ToDB.openConn();
				Statement Stmt = DBConn.createStatement();
				String SQL_Command = "SELECT Username FROM Account WHERE Username ='" + Username + "' and Password = '"
						+ Password + "'"; // SQL query command
				ResultSet Rslt = Stmt.executeQuery(SQL_Command);
				done = done && Rslt.next();
				if (done) {
					Uname = Rslt.getString("Username");
				}
				Stmt.close();
				ToDB.closeConn();
				return Uname;
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
		return Uname;
	}

	public boolean changePassword(String NewPassword) { // 5
		boolean done = false;
		try { // 20
			DBConnection ToDB = new DBConnection(); // Have a connection to the
													// DB
			Connection DBConn = ToDB.openConn();
			Statement Stmt = DBConn.createStatement();
			String SQL_Command = "SELECT * FROM Account WHERE Username ='" + Username + "'AND Password ='" + Password
					+ "'"; // SQL query command
			ResultSet Rslt = Stmt.executeQuery(SQL_Command); // Inquire if the
																// username
																// exsits.
			if (Rslt.next()) {
				SQL_Command = "UPDATE Account SET Password='" + NewPassword + "' WHERE Username ='" + Username + "'"; // Save
																														// the
																														// username,
																														// password
																														// and
																														// Name
				Stmt.executeUpdate(SQL_Command);
				Stmt.close();
				ToDB.closeConn();
				done = true;
				System.out.println("Password Updated Sucessfully!");
			}
		} catch (java.sql.SQLException e) // 5
		{
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

	public boolean chargeAccount() {// 5
		boolean done = false;
		int Ano;
		double bal1;
		try { // 20
			DBConnection ToDB = new DBConnection(); // Have a connection to the
													// DB
			Connection DBConn = ToDB.openConn();
			Statement Stmt = DBConn.createStatement();
			// String SQL_Command = "UPDATE Account SET Balance = bal -
			// '"+Amount+"' ADD CONSTRAINT C1 CHECK (SELECT Balance bal FROM
			// Account A LEFT JOIN EZTag E on A.Account_No == E.Account_No WHERE
			// E.EZ_Tag = '" + EZTagCode + "')"; //SQL query command
			String SQL_Command = "SELECT A.Balance, A.Account_No FROM Account A LEFT JOIN EZTag E on A.Account_No = E.Account_No WHERE E.EZ_Tag = "
					+ EZTagCode + "";
			System.out.println(SQL_Command);
			ResultSet Rslt = Stmt.executeQuery(SQL_Command); // Inquire if the
																// username
																// exsits.
			if (Rslt.next()) {
				Ano = Rslt.getInt("Account_No");
				bal1 = Rslt.getDouble("Balance");
				if (bal1 >= Amount) {
					bal1 = bal1 - Amount;
					SQL_Command = "UPDATE Account SET Balance='" + bal1 + "' WHERE Account_No ='" + Ano + "'"; // Update
																												// Amount
																												// balance
																												// in
																												// DB
					System.out.println(SQL_Command);
					Stmt.executeUpdate(SQL_Command);
					done = true;
				}
				Stmt.close();
				ToDB.closeConn();
			}
		} catch (java.sql.SQLException e) // 5
		{
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

	public Long getAccountNo(String Username) {
		boolean done = true;
		Long AccNo = null;
		try {
			if (done) {

				DBConnection ToDB = new DBConnection(); // Have a connection to
														// the DB
				Connection DBConn = ToDB.openConn();
				Statement Stmt = DBConn.createStatement();
				String SQL_Command = "SELECT Account_No as AccNo FROM Account WHERE Username ='" + Username + "' "; // SQL
																													// query
																													// command
				ResultSet Rslt = Stmt.executeQuery(SQL_Command);
				done = done && Rslt.next();
				if (done) {
					AccNo = Rslt.getLong("AccNo");
				}
				Stmt.close();
				ToDB.closeConn();
				return AccNo;
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
		return AccNo;

	}

	public List getUserInfo() {
		String SQL_Command = "";

		List<Object> ls = new ArrayList<Object>();
		try {
			DBConnection ToDB = new DBConnection(); // Have a connection to
													// the DB
			Connection DBConn = ToDB.openConn();
			Statement Stmt = DBConn.createStatement();
			SQL_Command = " SELECT [Account_No] as acno " + "       ,[Username] as uname " + "       ,[Name] as name "
					+ "       ,[Balance] as bal " + "       ,[isActive] as status "
					+ "   FROM [JavaClass].[dbo].[Account] where Username = '" + Username + "'; ";
			System.out.println(SQL_Command);
			ResultSet rs = Stmt.executeQuery(SQL_Command);
			while (rs.next()) {
				ls.add(rs.getLong("acno"));
				ls.add(rs.getString("uname"));
				ls.add(rs.getString("name"));
				ls.add(rs.getDouble("bal"));
				ls.add(rs.getInt("status"));
				return ls;
			}
			Stmt.close();
			ToDB.closeConn();
			return ls;
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

	public boolean updateBal(Double bal, String name) { // 5
		boolean done = false;
		try { // 20
			DBConnection ToDB = new DBConnection(); // Have a connection to the
			Connection DBConn = ToDB.openConn();
			Statement Stmt = DBConn.createStatement();
			String SQL_Command = "UPDATE Account SET Balance='" + bal + "',Name ='" + name + "' WHERE Username ='"
					+ Username + "'"; // Save
			Stmt.executeUpdate(SQL_Command);
			Stmt.close();
			ToDB.closeConn();
			done = true;
			System.out.println("Balance Updated Sucessfully!");

		} catch (java.sql.SQLException e) // 5
		{
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