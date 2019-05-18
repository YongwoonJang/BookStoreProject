package filter;

import java.io.IOException;
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

public class LogFilter implements Filter{

	public void init(FilterConfig filterConfig) {
		System.out.println("Book market log system is started_console");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		
		System.out.println("접속 시도 IP" + request.getRemoteAddr());
		
		long start = System.currentTimeMillis();
		System.out.println("접속 URL 경로 : " + getURLPath(request));
		System.out.println("현재시간 : "+ getCurrentTime());
		filterChain.doFilter(request,response);
		
		long end = System.currentTimeMillis();
		System.out.println("처리 완료 시간 : " + getCurrentTime());
		System.out.println("처리 경과 시간 : " + (end-start)+"ms");
		System.out.println("==============================================");
		
		
	}
	
	public void destroy() {
		
	}
	
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req = null;
		String url = "";
		String query = "";
		if(request instanceof HttpServletRequest) {
			req = (HttpServletRequest) request;
			url = req.getRequestURI();
			query = req.getQueryString();
			query = query == null ? "" : "?"+query;
		}
		return url + query;
	}
	
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());

	}

}
