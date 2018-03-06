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
import javax.servlet.http.HttpSession;

import com.model.Account;

public class LoginServlet extends HttpServlet {
	private String Username, Password;
	private Account Acct;

	// a method called automatically to initialize the servlet
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		Username = new String("");
		Password = new String("");
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		if (req.getParameter("log") != null) {
			HttpSession session = req.getSession();
			session.invalidate();
			res.sendRedirect("Login.jsp");

		}
		// doPost(req, res);
	}

	// a method included in class HttpServlet to respond
	// to post requests from a client.
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Username = req.getParameter("Username");
		Password = req.getParameter("Password");
		Acct = new Account(Username, Password);
		String CustomerName = Acct.signIn();

		if (!CustomerName.equals("")) {
			System.out.println("successful!");
			HttpSession session = req.getSession();
			session.setAttribute("Username", Username);

			PrintWriter out = res.getWriter();
			try {
				res.sendRedirect("home.jsp");
			} finally {
				out.close();
			}
		}

	}
	// this "cleanup" method is called when a servlet is terminated by the
	// server
}