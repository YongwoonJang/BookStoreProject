package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class LoginCheckDAO {
	
	private static LoginCheckDAO instance = null;
	
	public LoginCheckDAO() {
	
	}
	
	public static LoginCheckDAO getInstance() {
		if(instance == null) {
			instance = new LoginCheckDAO();
		}
		return instance;
	}
	
	public String checkIdDuplicate(String id) throws SQLException, ClassNotFoundException {
		
		Connection conn = null;
		String sql = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		String result = null;
		
		try {
			
			conn = DBConnection.getConnection();
			sql = "select id from member where id = ?";
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, id);
			rs = ptmt.executeQuery();
			
			rs.next();
			result = rs.getString("id");
			
		}catch(SQLException|ClassNotFoundException e) {
			e.printStackTrace();
			
		}
		
		if(rs != null)
			rs.close();
		
		if(ptmt != null)
			ptmt.close();
		
		if(conn != null)
			conn.close();
		
		return result;
	
	}
		
}