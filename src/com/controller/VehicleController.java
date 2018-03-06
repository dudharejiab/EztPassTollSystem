package com.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Vehicle;

public class VehicleController extends HttpServlet {

	private String Username, Model, VehicleNumber;
	private Long EZtag, vehicleId;
	private Integer year;
	private Vehicle vehicle;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Username = (String) session.getAttribute("Username");

		if (req.getParameter("insert") != null) {
			Model = req.getParameter("model");
			EZtag = Long.valueOf(req.getParameter("EZTag"));
			year = Integer.valueOf(req.getParameter("year"));
			VehicleNumber = req.getParameter("VehicleNumber");
			vehicle = new Vehicle(Model, EZtag, year, VehicleNumber);
			if (vehicle.addVehicle()) {
				System.out.println("Vehicle Inserted");
			}
		}
		if (req.getParameter("delete") != null) {
			vehicleId = Long.valueOf(req.getParameter("delete"));
			vehicle = new Vehicle(vehicleId);
			if (vehicle.removeVehicle()) {
				System.out.println("Vehicle deleted");
			}
		}
		vehicle = new Vehicle(Username);
		List<List> ls = vehicle.getVehicle();
		req.setAttribute("vehicles", ls);
		RequestDispatcher rd = req.getRequestDispatcher("Vehicle.jsp");
		rd.include(req, res);
	}
}