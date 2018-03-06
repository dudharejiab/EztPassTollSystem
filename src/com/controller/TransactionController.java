package com.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
//package for GenericServlet
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
//package for HttpServlet
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Transaction;

public class TransactionController extends HttpServlet {
	private String Username;

	private Transaction tran;

	// a method called automatically to initialize the servlet
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// Username = new String("");
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Username = (String) session.getAttribute("Username");
		tran = new Transaction(Username);
		List<List> ls = tran.getTransaction(Username);
		req.setAttribute("trans", ls);
		RequestDispatcher rd = req.getRequestDispatcher("transactions.jsp");
		rd.include(req, res);
	}
}