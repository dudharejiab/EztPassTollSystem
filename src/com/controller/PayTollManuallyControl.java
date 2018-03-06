package com.controller;
import java.io.IOException;
import java.io.PrintWriter;

//package for GenericServlet
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
//package for HttpServlet
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Account;
import com.model.Transaction;

public class PayTollManuallyControl extends HttpServlet {

	private String Username, Password, Re_enterPassword, CustomerName;
	private PrintWriter output;
	private Long EZTag;
	private String TollPlaza;
	private Double Amount;
	private Account Acc;
	private Transaction Tran;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		Username = new String("");
		Password = new String("");
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// obtains a character-based output stream that enables
		// text data to be sent to the client
		output = res.getWriter();

		res.setContentType("text/html");

		// returns the value associated with a parameter sent to
		// the servlet as part of a post request
		System.out.println(req.getParameter("EZTag"));
		System.out.println(req.getParameter("TollPlaza"));
		System.out.println(req.getParameter("Amount"));

		EZTag = Long.parseLong(req.getParameter("EZTag"));
		TollPlaza = req.getParameter("TollPlaza");
		Amount = Double.parseDouble(req.getParameter("Amount"));
		Acc = new Account(EZTag, Amount);
		StringBuffer Buf = new StringBuffer();
		Buf.append("<HTML><HEAD></HEAD>\n");
		Buf.append("<BODY bgcolor='#564e47'>\n");

		if (Acc.chargeAccount()) {
			Tran = new Transaction(EZTag, TollPlaza, Amount);
			if (Tran.insertTransaction()) {
				Buf.append("<h4 ALIGN='left'style='color:white' >Transaction is successfully!</h4>\n");
			} else {
				Buf.append("<h4 ALIGN='center'>Transaction is not successful!</h4>\n");
			}
		} else {
			Buf.append("<h4 ALIGN='center'>Insufficiant Balance!</h4>\n");
		}
		Buf.append("</BODY>\n");
		Buf.append("</HTML>\n");
		output.println(Buf.toString());
		/*
		 * Account Acct = new Account(Username, Password, Re_enterPassword,
		 * CustomerName); if (Acct.signUp()){ //RequestDispatcher rd =
		 * req.getRequestDispatcher("Login.html"); output = res.getWriter(); try
		 * { res.sendRedirect("/CSCI6810/Login.html"); } finally {
		 * output.close(); } showSuccess(); } else{ output.
		 * println("Account creation failed because of existing username or invalid username. Please try again!"
		 * );} }
		 */
		// this "cleanup" method is called when a servlet is terminated by the
		// server*/
	}
}
