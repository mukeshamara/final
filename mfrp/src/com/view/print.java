package com.view;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class print
 */
@WebServlet("/print.do")
public class print extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public print() {
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
		/*String quan=request.getParameter("quantity");
		for(int i=0;i<6;i++)
		{
			System.out.println(quan);
		}*/
		String bo[]=request.getParameterValues("quantity");
		if(bo.length>0)
		{
		for(int i=0;i<bo.length;i++)
		{
			System.out.println(bo[i]);
		}
		}
		else
		{
			System.out.println("no value");
		}
	}
		

}
