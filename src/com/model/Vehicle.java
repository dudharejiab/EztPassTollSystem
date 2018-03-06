package com.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Vehicle {

	private String Username, Model, VehicleNumber;
	private Long VehicleId, EZTag;
	private Integer Year;

	public Vehicle(String Model, Long EZtag, int year, String VehicleNumber) {
		this.Model = Model;
		this.Year = year;
		this.EZTag = EZtag;
		this.VehicleNumber = VehicleNumber;
	}

	public Vehicle(String Username) {
		this.Username = Username;
	}

	public Vehicle(Long vid) {
		this.VehicleId = vid;
	}

	public boolean addVehicle() {
		boolean done = true;
		String SQL_Command = "";
		try {
			if (done) {
				DBConnection ToDB = new DBConnection(); // Have a connection to
														// the DB
				Connection DBConn = ToDB.openConn();
				Statement Stmt = DBConn.createStatement();
				SQL_Command = "INSERT INTO [JavaClass].[dbo].[Vehicle](Model, EZ_Tag,Year,Status,Vehicle_Number) VALUES ('"
						+ Model + "','" + EZTag + "','" + Year + "',1,'" + VehicleNumber + "')";
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

	public List getVehicle() {
		String SQL_Command = "";

		List<List> ls1 = new ArrayList<List>();
		Map<String, Object> mp = new HashMap<String, Object>();
		try {
			DBConnection ToDB = new DBConnection(); // Have a connection to
													// the DB
			Connection DBConn = ToDB.openConn();
			Statement Stmt = DBConn.createStatement();
			SQL_Command = " SELECT v.Vehicle_Id as vid, " + " v.Model as model,  " + " v.EZ_Tag as eztag,  "
					+ " v.Year as year, v.Vehicle_Number as VehicleNumber " + " FROM   [JavaClass].[dbo].[Vehicle] v  "
					+ " LEFT JOIN [JavaClass].[dbo].[eztag] e  " + " ON v.EZ_Tag = e.EZ_Tag "
					+ " LEFT JOIN [JavaClass].[dbo].[account] a  " + " ON e.account_no = a.account_no  "
					+ " WHERE  a.username = '" + Username + "' and v.Status = 1;  ";
			System.out.println(SQL_Command);
			ResultSet rs = Stmt.executeQuery(SQL_Command);
			while (rs.next()) {
				List<Object> ls = new ArrayList<Object>();
				ls.add(rs.getLong("vid"));
				ls.add(rs.getString("model"));
				ls.add(rs.getLong("eztag"));
				ls.add(rs.getInt("year"));
				ls.add(rs.getString("VehicleNumber"));
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

	public boolean removeVehicle() {
		boolean done = true;
		String SQL_Command = "";
		try {
			if (done) {
				DBConnection ToDB = new DBConnection(); // Have a connection to
														// the DB
				Connection DBConn = ToDB.openConn();
				Statement Stmt = DBConn.createStatement();
				SQL_Command = "UPDATE [JavaClass].[dbo].[Vehicle] set status = 0 where Vehicle_Id =" + VehicleId;
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
}
