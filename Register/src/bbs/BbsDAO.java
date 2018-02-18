package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() 
	{
		try
		{
			String dbURL = "jdbc:mysql://localhost:3306/BBS?autoReconnect=true&useSSL=false";
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
	public String getDate() {
		String SQL= "SELECT NOW()";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs= pstmt.executeQuery();
			if (rs.next())
			{
				return rs.getString(1);
			}
		}
		
		catch ( Exception e )
		{
			//������ �߻��Ұ��
			e.printStackTrace();
		}
		return "";
	}

	public int getNext() {
		String SQL= "SELECT bbsId FROM BBS ORDER BY bbsId DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs= pstmt.executeQuery();
			if (rs.next())
			{
				return rs.getInt(1)+1;
			}
			return 1; //ù��° �Խù� �ϰ��
		}
		
		catch ( Exception e )
		{
			//������ �߻��Ұ��
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String bbsTitle, String userId, String bbsContent) {
		String SQL= "INSERT INTO BBS VALUES(?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
			
		}
		
		catch ( Exception e )
		{
			//������ �߻��Ұ��
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL = "SELECT * FROM BBS WHERE bbsId < ? AND bbsAvailable = 1 ORDER BY bbsId DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			// ���� �Խñ��� 1�������� 10����
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				Bbs bbs = new Bbs();
				bbs.setBbsId(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserId(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				
				list.add(bbs);
			}
			
		}
		
		catch ( Exception e )
		{
			//������ �߻��Ұ��
			e.printStackTrace();
		}
		return list;
	}
	
	
	// ���� ����¡ ó�� �Լ�
	public boolean nextPage(int pageNumber)
	{
		String SQL = "SELECT * FROM BBS WHERE bbsId < ? AND bbsAvailable = 1 ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			// ���� �Խñ��� 1�������� 10����
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				return true;
			}
			
		}
		
		catch ( Exception e )
		{
			//������ �߻��Ұ��
			e.printStackTrace();
		}
		return false;
	}
	
	
	public Bbs getBbs(int bbsId) {
		String SQL = "SELECT * FROM BBS WHERE bbsId = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			// ���� �Խñ��� 1�������� 10����
			pstmt.setInt(1, bbsId);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				Bbs bbs = new Bbs();
				bbs.setBbsId(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserId(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
			
		}
		
		catch ( Exception e )
		{
			//������ �߻��Ұ��
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int bbsId, String bbsTitle, String bbsContent)
	{
		String SQL= "UPDATE BBS SET bbsTitle =? , bbsContent=? WHERE bbsId=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsId);
			return pstmt.executeUpdate();
			
		}
		
		catch ( Exception e )
		{
			//������ �߻��Ұ��
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int bbsId)
	{
		String SQL= "UPDATE BBS SET bbsAvailable = 0  WHERE bbsId=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsId);

			return pstmt.executeUpdate();
			
		}
		
		catch ( Exception e )
		{
			//������ �߻��Ұ��
			e.printStackTrace();
		}
		return -1;
	}
}
