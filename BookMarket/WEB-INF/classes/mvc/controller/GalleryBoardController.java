package mvc.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import java.util.*;

import mvc.model.GalleryBoardDAO;
import mvc.model.GalleryBoardDTO;

public class GalleryBoardController extends HttpServlet {
	
	private static final long servialVersionUID = 1L;
	static final int LISTCOUNT = 9;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		//request.setCharacterEncoding("euc-kr");
		//response.setContentType("text/html; charset=euc-kr");

                System.out.println("GalleryBoardController.java 35 lines : "+request.getParameter("title"));	        
	
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		System.out.println("mvc.GalleryBoardController.java 39 lines : "+command);
		int semiColon = command.indexOf(";");
		if(semiColon > 0){
			command = command.substring(0,semiColon);
		}
		System.out.println("mvc.GalleryBoardController.java 43 lines : "+command);		
	
		if(command.equals("/GalleryBoardListAction.do")) {
			requestGalleryBoardList(request);
			request.setAttribute("pageNum", "1");
			RequestDispatcher rd = request.getRequestDispatcher("./galleryboard/list.jsp");
			rd.forward(request, response);
			
		}else if(command.equals("/GalleryBoardWriteForm.do")) {
			requestLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("./galleryboard/writeForm.jsp");
			rd.forward(request, response);
			
		}else if(command.equals("/GalleryBoardWriteAction.do")) {
			requestGalleryBoardWrite(request);
			request.setAttribute("pageNum", "1");
			RequestDispatcher rd = request.getRequestDispatcher("/GalleryBoardListAction.do");
			rd.forward(request, response);
			
		}else if(command.equals("/GalleryBoardViewAction.do")) {
			requestGalleryBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/galleryboard/view.jsp");
			rd.forward(request, response);
			
		}else if(command.equals("/GalleryBoardDeleteAction.do")) {
			requestGalleryBoardDelete(request);
			System.out.println("GalleryBoardController line 66");
			RequestDispatcher rd = request.getRequestDispatcher("/GalleryBoardListAction.do");
			rd.forward(request, response);
		
		}else if(command.equals("/GalleryBoardUpdateAction.do")) {
			requestGalleryBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/GalleryBoardListAction.do");
			rd.forward(request, response);
			
		}
	}
	
	public void requestGalleryBoardUpdate(HttpServletRequest request) {
		long time = System.currentTimeMillis();
		long fileSize = 0;
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		String filename="";
		String realFolder = request.getServletContext().getRealPath("/resources/images/");
		String encType = "utf-8";
		int maxSize = 5 * 1024 * 1024;
		MultipartRequest multi = null;
	
		System.out.println("GalleryBoardController 97 line before MultipartRequest");	
		//file creationg and uploading
		try {
			multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		//get File real name..
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		File file = multi.getFile(fname);
		
		System.out.println("GalleryBoardController 102 line filename: "+fileName);
		
		if(fileName == null){
			fileName = multi.getParameter("originfilename");
			fileSize = Long.parseLong(multi.getParameter("originfilesize"));

		}else{
			fileSize = file.length();

		}
		
		//And save to DTO
		GalleryBoardDTO dto = new GalleryBoardDTO();
		dto.setContent(multi.getParameter("content"));	
		dto.setNum(Integer.parseInt(multi.getParameter("num")));
		dto.setIp(request.getRemoteAddr()); 
		dto.setName(multi.getParameter("name"));
		dto.setRegist_day(multi.getParameter("registDay"));
		dto.setSubject(multi.getParameter("title"));
		dto.setId(multi.getParameter("id"));
		dto.setFilename(fileName);
		dto.setFilesize(fileSize);

		System.out.println("GalleryBoardController 137 line Null pointer exception is solved");
		System.out.println("File name is "+fileName);
		System.out.println("File size is "+fileSize);
		
		GalleryBoardDAO.getInstance().updateGalleryBoard(dto);
		
	}
	
	public void requestGalleryBoardDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		GalleryBoardDAO.getInstance().deleteGalleryBoard(num);
		
	}
	
	public void requestGalleryBoardView(HttpServletRequest request) throws IOException {
		int page = 1;
		System.out.println("GalleryBoardController 138 lines error name check num value is "+request.getParameter("num"));
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		System.out.println("GalleryBoardController 156 lines pageNum is "+!pageNum.equals("null"));
		if(!pageNum.equals("null") && pageNum.length() > 0){
			page = Integer.parseInt(request.getParameter("pageNum"));
		}	

		GalleryBoardDTO data = GalleryBoardDAO.getInstance().getGalleryBoardByNum(num, page);
		request.setAttribute("data", data);
		request.setAttribute("pageNum", page);
	}
	
	public void requestGalleryBoardWrite(HttpServletRequest request) throws IOException {
		String filename="";
		String realFolder = request.getServletContext().getRealPath("/resources/images/");
		String encType = "utf-8";
		int maxSize = 5 * 1024 * 1024;
		MultipartRequest multi = null;
		
		//file creationg..
		try {
			multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			
		}catch(Exception e) {
			System.out.print("GalleryBoardController 68 line error");
			e.printStackTrace();
			
		}
		
		//get File real name..
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		File file = multi.getFile(fname);

		System.out.println("GalleryBoardController 165 lines content "+multi.getParameter("content"));	
	
		//And save to DTO
		GalleryBoardDTO dto = new GalleryBoardDTO();
		dto.setContent(multi.getParameter("content"));	
		dto.setNum(0);
		dto.setHit(0);
		dto.setIp(request.getRemoteAddr()); 
		dto.setName(multi.getParameter("name"));
		dto.setRegist_day(multi.getParameter("registDay"));
		dto.setSubject(multi.getParameter("title"));
		dto.setId(multi.getParameter("id"));
		dto.setFilename(fileName);
		if(file != null){
			dto.setFilesize(file.length());
		}else{
			dto.setFilesize(0);
		}
		
		try {
			GalleryBoardDAO.getInstance().insertGalleryBoard(dto);

		} catch (ClassNotFoundException|SQLException e) {

			e.printStackTrace();
		} 
		
	}
	
	public void requestLoginName(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("GalleryBoardController 185 line id : " + id);
		String name = null;
		
		try {
			name = GalleryBoardDAO.getLoginNameById(id);
			
		} catch (ClassNotFoundException|SQLException e) {	
			e.printStackTrace();
			
		} 
		
		request.setAttribute("name", name);
		
	}
	
	public void requestGalleryBoardList(HttpServletRequest request){
		String pageNum = (String)request.getAttribute("pageNum");
		if(pageNum == null){
			pageNum = request.getParameter("pageNum");
		}
		if(pageNum == null){
			pageNum = "1";
		}
		String listCount = Integer.toString(LISTCOUNT);
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		ArrayList<GalleryBoardDTO> data = null;
			
		try {
			data = GalleryBoardDAO.getInstance().getGalleryList(Integer.parseInt(pageNum), Integer.parseInt(listCount), items, text);
		
		} catch (NumberFormatException|ClassNotFoundException|SQLException e) {
			e.printStackTrace();
			
		}
		
		request.setAttribute("data", data);
		
	}
}
