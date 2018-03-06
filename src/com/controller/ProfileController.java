package com.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Account;
import com.model.EZTag;

public class ProfileController extends HttpServlet {

	private EZTag ezz;
	private Double balance;
	private Account acc;
	private String Username, type, psw, npsw,fullName;
	private Long EZTagId, AccId;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Username = (String) session.getAttribute("Username");
		acc = new Account(Username, null);
		List uinfo = acc.getUserInfo();
		req.setAttribute("uinfo", uinfo);

		if (req.getParameter("insert") != null) {
			EZTagId = Long.valueOf(req.getParameter("EZTag"));
			type = req.getParameter("type");
			AccId = acc.getAccountNo(Username);
			ezz = new EZTag(EZTagId, Username, type, AccId);
			if (ezz.addEZTag()) {
				System.out.println("EZTag Inserted");
			}
		}
		if (req.getParameter("delete") != null) {
			EZTagId = Long.valueOf(req.getParameter("EZTag"));
			ezz = new EZTag(EZTagId, null, null, null);
			if (ezz.removeEZTag()) {
				System.out.println("EZTag deleted");
			}
		}
		if (req.getParameter("oldPassword") != null) {
			psw = req.getParameter("oldPassword");
			npsw = req.getParameter("newPassword");
			acc = new Account(Username, psw);
			acc.changePassword(npsw);
			
		}
		if(req.getParameter("balance") != null) {
			balance = Double.valueOf(req.getParameter("balance"));
			fullName= req.getParameter("name") ;
			acc.updateBal(balance, fullName);
			
			
		}
		ezz = new EZTag(null, Username, null, null);
		List<List> ls = ezz.getEZTag();
		req.setAttribute("EZTag", ls);
		RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");
		rd.include(req, resp);
	}
}
