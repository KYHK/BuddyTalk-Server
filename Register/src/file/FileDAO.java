package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class FileDAO {
	private Connection conn;
	
	public FileDAO() 
	{
		try
		{
			String dbURL = "jdbc:mysql://localhost:3306/FILE?autoReconnect=true&useSSL=false";
			String dbID = "root";
			String dbPassword = "kyh8900a";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}
		catch ( Exception e )
		{
			//오류가 발생할경우
			e.printStackTrace();
		}
	}
	
	public int upload(String fileName, String fileRealName)
	{
		String SQL= "INSERT INTO FILE VALUES(?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			return pstmt.executeUpdate();
			
		}
		
		catch ( Exception e )
		{
			//오류가 발생할경우
			e.printStackTrace();
		}
		return -1;
	}
}
