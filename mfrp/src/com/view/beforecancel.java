package com.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CancelDAO;
import com.model.User;

/**
 * Servlet implementation class beforecancel
 */
@WebServlet("/beforecancel.do")
public class beforecancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public beforecancel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession hs=request.getSession();
		User x=(User)hs.getAttribute("xyz");
		CancelDAO dao=new CancelDAO();
		try
		{
		int y=dao.checktheorder(Long.toString(x.getUserid()));
		if(y>0)
		{
			RequestDispatcher rd=request.getRequestDispatcher("cancel.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("msg","<font color='red'>You did not order any book. Please order the book.<br/>");
			RequestDispatcher rd=request.getRequestDispatcher("userincart.jsp");
			rd.forward(request, response);
		}
		}catch(Exception ex)
		{
			System.out.println(ex);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
