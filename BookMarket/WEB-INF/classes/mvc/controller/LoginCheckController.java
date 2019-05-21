package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.LoginCheckDAO;

public class LoginCheckController extends HttpServlet{
	
	private static final long servialVersionUID = 1L;
	static final int LISTCOUNT = 9;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		System.out.println("tLoginCheckContoller.do 40 lines : executing");
		System.out.println("tLoginCheckContoller.do 41 lines : executing");
		System.out.println("tLoginCheckContoller.do 42 lines"+command);
		
		if(command.equals("/checkIdDuplicate.do")) {
			System.out.println("tLoginCheckContoller.do 43 lines : executing");
			String isDup = checkIdDuplicate(request);

			PrintWriter pw = response.getWriter();
			pw.write("Hello world");
			pw.flush();
			
		}
	}
	
	public String checkIdDuplicate(HttpServletRequest request) throws IOException {
		String isDup = null;
		String id = request.getParameter("id");
		
		System.out.println("LoginCheckController.do 52 lines : executing "+id);
		
		try {
			isDup = LoginCheckDAO.getInstance().checkIdDuplicate(id);
			
		} catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
			
		}
		
		System.out.println("LoginCheckController.do 62 lines : executing "+isDup);
		
		return isDup;
	}

}
