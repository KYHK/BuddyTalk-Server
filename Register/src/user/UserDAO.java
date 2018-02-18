package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	
	public UserDAO() 
	{
		try
		{
			String dbURL = "jdbc:mysql://localhost:3306/REGISTER?autoReconnect=true&useSSL=false";
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
	
	public int registerCheck(String userId)
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM USER WHERE userId = ?";
		try 
		{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if ( rs.next() || userId.equals("")) 
			{
				return 0; // 이미 존재하는 회원
			}
			
			else
			{
				return 1; // 가입 가능한 아이디
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		finally
		{
			try
			{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}
			
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return -1; // 데이터베이스 오류
	}
	
	public int register(String userId, String userPassword, String userName, String userDepartment_num, String userDepartment, String userPhone_num, String userEmail)
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?,?,?)";
		try 
		{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, userName);
			pstmt.setString(4, userDepartment_num);
			pstmt.setString(5, userDepartment);
			pstmt.setString(6, userPhone_num);
			pstmt.setString(7, userEmail);
			// 실제로 데이터 값을 리턴으로 반환하여 업데이트 반영
			return pstmt.executeUpdate();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		finally
		{
			try
			{
				if (rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}
			
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return -1; // 데이터베이스 오류
	}
	
	
	// db로그인 기능 
	public int login(String userId, String userPassword)
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT userPassword FROM USER WHERE userId = ?";
		try
		{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if( rs.next())
			{
				if (rs.getString(1).equals(userPassword))
				{
					return 1; // 비밀번호 일치
				}
				else
				{
					return 0; // 비밀번호 불일치
				}
			}
			return -1; // 아이디 존재 x
		}
		
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return -2; //db오류
		
	}
}
