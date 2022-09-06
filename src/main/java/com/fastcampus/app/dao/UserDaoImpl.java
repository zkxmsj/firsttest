package com.fastcampus.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import com.fastcampus.app.domain.User;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	DataSource ds;
	final int FAIL = 0;
	@Override
	public User selectUser(String id) {
		User user = null;
		String sql = "select * from user where userid = ?";
		try(
				Connection conn=DataSourceUtils.getConnection(ds);
				PreparedStatement pstmt = conn.prepareStatement(sql);
			
		){
			pstmt.setString(1,id);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(conn);
			if(rs.next()) {
				user = new User();
				user.setId(rs.getString(1));
				user.setPwd(rs.getString(2));
				user.setName(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setBirth(rs.getTimestamp(5));
				user.setSns(rs.getString(6));
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		// TODO Auto-generated method stub
		return user;
	}

	@Override
	public int insertUser(User user) {
		String sql = "insert into user(userid,userpwd,username,useremail,userbirth,usersns)"
				+ "values (?,?,?,?,?,?)";
		try(
				Connection conn=DataSourceUtils.getConnection(ds);
				PreparedStatement pstmt = conn.prepareStatement(sql);
		){
			System.out.println(conn);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getEmail());
			pstmt.setDate(5,new java.sql.Date(user.getBirth().getTime()));
			pstmt.setString(6, user.getSns());
			
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			return FAIL;
		}
		// TODO Auto-generated method stub
		
		
	}

	@Override
	public int deleteUser(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void seleteAll() {
		// TODO Auto-generated method stub
		
	}
	
	
}
