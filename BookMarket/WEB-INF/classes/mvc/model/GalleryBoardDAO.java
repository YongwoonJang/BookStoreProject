package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class GalleryBoardDAO {
	
	private static GalleryBoardDAO instance = null;
	
	public GalleryBoardDAO() {
	
	}
	
	public static GalleryBoardDAO getInstance() {
		if(instance == null) {
			instance = new GalleryBoardDAO();
		}
		return instance;
	}
	
	public void insertGalleryBoard(GalleryBoardDTO dto) throws SQLException, ClassNotFoundException {
		
		String sql = null;
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		int num = 0;
		
		try {
			//Num setting
			sql = "select count(*) from galleryboard";
			
			conn = DBConnection.getConnection();
			ptmt = conn.prepareStatement(sql);
			rs = ptmt.executeQuery();
			
			rs.next();
			num = Integer.parseInt(rs.getString("count(*)"));
			num = num + 1;
			dto.setNum(num);
			
			//Insert data.
			sql = "insert into galleryboard values ("
					+ dto.getNum()
					+ ",'"
					+ dto.getId()
					+ "','"
					+ dto.getName()
					+ "','"
					+ dto.getSubject()
					+ "','"
					+ dto.getContent()
					+ "','"
					+ dto.getRegist_day()
					+ "',"
					+ dto.getHit()
					+ ",'"
					+ dto.getIp()
					+ "','"
					+ dto.getFilename()
					+ "',"
					+ dto.getFilesize()
					+ ")";
				
			System.out.println("GalleryBoardDAO.java 70 lines sql : "+sql);
			ptmt = conn.prepareStatement(sql);
			ptmt.executeUpdate();
			
			
		}catch(SQLException|ClassNotFoundException e) {
			e.printStackTrace();
			
		}
		
		if(rs !=null)
			rs.close();
		
		if(ptmt != null)
			ptmt.close();
		
		if(conn!=null)
			conn.close();
		
		
		
	}
	
	public static String getLoginNameById(String id) throws SQLException, ClassNotFoundException {
		
		String name = null; 
		String sql = null;
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;

		id = "장용운";
		
		try {
			System.out.println("WEB-INF.classes.mvc.model.GalleryBoardDAO line 102 id : "+id);
			
			sql = "select name from member where id = ?";
			conn = DBConnection.getConnection();
			ptmt = conn.prepareStatement(sql);
			
			ptmt.setString(1, id);
			rs = ptmt.executeQuery();
			
			rs.next();
		        System.out.printf("WEB-INF.classes.mvc.model.GalleryBoardDAO line 114");	
			if(rs != null){
				name = rs.getString("name");

			}else{
				name = "장용운";

			}

		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		if(rs !=null)
			rs.close();
		
		if(ptmt != null)
			ptmt.close();
		
		if(conn!=null)
			conn.close();
		
		
		
		return name;
		
	}
	
	public ArrayList<GalleryBoardDTO> getGalleryList(int pageNum, int limit, String items, String text) throws SQLException, ClassNotFoundException {
		
		//TODO Page 변수를 사용하여 조회될 수 있는 체계를 만들어야함. 
		ArrayList<GalleryBoardDTO> data = new ArrayList<GalleryBoardDTO>();
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ptmt = null;
		
		String findThing = items;
		String findDetail = text; 
		
		if(findThing==null) {
			findThing="context";
			findDetail="";
		}
		
		String sql = "select * from galleryboard where ? like '%" + findDetail + "%' order by num limit ?,?";
		
		
		try {
			conn = DBConnection.getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, findThing);
			ptmt.setInt(2, (pageNum-1)*limit);
			ptmt.setInt(3, (pageNum)*limit);
			
			System.out.println("GalleryBoardDAO.java line 136 ptmt is"+ptmt);
			
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				
				GalleryBoardDTO temp = new GalleryBoardDTO();
				
				temp.setFilesize(Long.parseLong(rs.getString("filesize")));
				temp.setFilename(rs.getString("filename"));
				temp.setIp(rs.getString("ip"));
				temp.setHit(rs.getInt("hit"));
				temp.setRegist_day(rs.getString("regist_day"));
				temp.setContent(rs.getString("content"));
				temp.setSubject(rs.getString("subject"));
				temp.setName(rs.getString("name"));
				temp.setId(rs.getString("id"));
				temp.setNum(Integer.parseInt(rs.getString("num")));
				
				data.add(temp);
				
			}
			
		}catch(SQLException|ClassNotFoundException e) {
			e.printStackTrace();
			
		}
		
		if(rs !=null)
			rs.close();
		
		if(ptmt != null)
			ptmt.close();
		
		if(conn!=null)
			conn.close();
		
		return data;
		
	}
	
	public GalleryBoardDTO getGalleryBoardByNum(int num, int page) {
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		GalleryBoardDTO data = null;
		
		try {
			
			data = new GalleryBoardDTO();
			conn = DBConnection.getConnection();
			
			ptmt = conn.prepareStatement("update galleryboard set hit = hit + 1 where num = ?");
			ptmt.setString(1, Integer.toString(num));
			ptmt.executeUpdate();
			
			ptmt = conn.prepareStatement("select * from galleryboard where num = ?");
			ptmt.setString(1, Integer.toString(num));
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				data.setFilesize(Long.parseLong(rs.getString("filesize")));
				data.setFilename(rs.getString("filename"));
				data.setIp(rs.getString("ip"));
				data.setHit(rs.getInt("hit"));
				data.setRegist_day(rs.getString("regist_day"));
				data.setContent(rs.getString("content"));
				data.setSubject(rs.getString("subject"));
				data.setName(rs.getString("name"));
				data.setId(rs.getString("id"));
				data.setNum(Integer.parseInt(rs.getString("num")));
				
			}
	
			if(rs!=null)
				rs.close();
			
			if(ptmt!=null)
				ptmt.close();
			
			if(conn!=null)
				conn.close();
						
		}catch(SQLException | ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		
		
		return data;
	}
	
	public void deleteGalleryBoard(int num) {
		Connection conn = null;
		PreparedStatement ptmt = null;
		
		try {
			conn = DBConnection.getConnection();
			ptmt = conn.prepareStatement("delete from galleryboard where num = ?");
			ptmt.setString(1, Integer.toString(num));
			ptmt.executeUpdate();
		
		}catch(SQLException | ClassNotFoundException e1) {
			e1.printStackTrace();
			
		}
		
	}
	
	public void updateGalleryBoard(GalleryBoardDTO data) {
		Connection conn = null;
		PreparedStatement ptmt = null;

		//TODO 파일 이름이 없으면 기존 파일 명을 사용하게 분기처리 해야함.
		try {
					
			conn = DBConnection.getConnection();
			ptmt = conn.prepareStatement("update galleryboard set "
					+ "id = ?, name = ?, subject = ?, "
					+ "content = ?, regist_day = ?, ip = ?,"
					+ "filename = ?, filesize= ? "
					+ "where num = ?");
		
			ptmt.setString(1, data.getId());
			ptmt.setString(2, data.getName());
			ptmt.setString(3, data.getSubject());
			ptmt.setString(4, data.getContent());
			ptmt.setString(5, data.getRegist_day());
			ptmt.setString(6, data.getIp());
			ptmt.setString(7, data.getFilename());
			ptmt.setLong(8, data.getFilesize());
			ptmt.setInt(9, data.getNum());
			
			System.out.println("the real query is "+ptmt+" /n");
			ptmt.executeUpdate();
			
			if(ptmt!=null)
				ptmt.close();
			
			if(conn!=null)
				conn.close();
						
		}catch(SQLException | ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
	}
	
}
