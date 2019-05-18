package filter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter{
	
	PrintWriter writer;
		
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Book market log system is started_file");
		String filename = filterConfig.getInitParameter("filename");
		
		if(filename == null) 
			throw new ServletException("파일이 존재하지 않습니다..");
		
		
		try {
			writer = new PrintWriter(new FileWriter(filename,true),true);
			
		}catch(IOException e) {
			throw new ServletException("파일 핸들러가 정상적으로 만들어지지 않았습니다.");
			
		}
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		writer.println("접속 시도 IP : " + request.getRemoteAddr());
		long start = System.currentTimeMillis();
		writer.println("접속 URL 경로 : " + getURLPath(request));
		writer.println("현재 시간 : " + getCurrentTime());
		
		chain.doFilter(request,response);
		
		long end = System.currentTimeMillis();
		writer.println("처리 완료 시간 : " + getCurrentTime());
		writer.println("경과 시간 : " + (end - start) + "ms ");
		writer.println("===========================================");
	}
	
	public void destroy() {
		writer.close();
	}
	
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath ="";
		String queryString ="";
		if(request instanceof HttpServletRequest) {
			req = (HttpServletRequest) request;
			currentPath = req.getRequestURI();
			queryString = req.getQueryString();
			queryString = queryString == null? "" : "?"+queryString;
		}
		return currentPath + queryString;
	}
	
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());
	}
	
}
