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
			//������ �߻��Ұ��
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
				return 0; // �̹� �����ϴ� ȸ��
			}
			
			else
			{
				return 1; // ���� ������ ���̵�
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
		return -1; // �����ͺ��̽� ����
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
			// ������ ������ ���� �������� ��ȯ�Ͽ� ������Ʈ �ݿ�
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
		return -1; // �����ͺ��̽� ����
	}
	
	
	// db�α��� ��� 
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
					return 1; // ��й�ȣ ��ġ
				}
				else
				{
					return 0; // ��й�ȣ ����ġ
				}
			}
			return -1; // ���̵� ���� x
		}
		
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return -2; //db����
		
	}
}
