package com.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class searchcat
 */
@WebServlet("/searchcat.do")
public class searchcat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchcat() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cat_item=request.getParameter("item");
		HttpSession hs=request.getSession();
		if(cat_item.equalsIgnoreCase("none"))
		{
			request.setAttribute("errms", "<font color='red'>Please select the category and search<br/>");
			RequestDispatcher rd=request.getRequestDispatcher("lo.jsp");
			rd.forward(request, response);
		}
		else
		{
			hs.setAttribute("item",cat_item);
			RequestDispatcher rd=request.getRequestDispatcher("search.jsp");
			rd.forward(request, response);
		}
	}
}
