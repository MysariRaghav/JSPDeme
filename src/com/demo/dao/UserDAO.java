/**
 * 
 */
package com.demo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.model.User;
import com.demo.util.*;


//import com.demo.model.User;

/**
 * @author Nanda
 *
 */
public class UserDAO {
	public static int count=0;
	private Connection con;
	 
    public UserDAO() {
        con = DBUtil.getConnection();
    }
	
	/*public UserDAO() {
		
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection
					("jdbc:mysql://localhost:3306/userlist","root","password");
//			?autoReconnect=true&useSSL=false
			System.out.println("Hi");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}*/
	
	public int deleteUser(String id) {
		int x = 0;
		try{
			con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("delete from user where uname=?");
			ps.setString(1, id);
			x = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.closeConnection(con);
		}
		return x;
	}
	
	public int updateUser(String uname, String password, String id) {
		int x = 0;
		try{
			con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("update user set uname=?, password=? where uname=?");
			ps.setString(1, uname);
			ps.setString(2, password);
			ps.setString(3, id);
			x = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.closeConnection(con);
		}
		return x;
	}
	
	public int insertUser(User user) {
		int x = 0;
		try{
			con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into user values(?,?)");//(uname,password)
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			x = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.closeConnection(con);
		}
		return x;
	}
	
	
	public List<User> getAllusers()
	{
		ArrayList<User> users= new ArrayList<>();
		
		try {
			con = DBUtil.getConnection();
			ResultSet rs= con.createStatement().executeQuery("select * from user");
			while(rs.next()) {
				System.out.println("Hello");
				User user= new User();
				user.setUsername(rs.getString(1));
				user.setPassword(rs.getString(2));
				users.add(user);				
			}
			return users;
			//ArrayList<User> ub;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally {
			DBUtil.closeConnection(con);
		}
		
	}

}
