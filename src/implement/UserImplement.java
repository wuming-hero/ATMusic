package implement;

import java.sql.*;
import java.util.ArrayList;

import pojo.Member;

import db.DBConn;

public class UserImplement {

	public ArrayList<Member> loginCheck(String username, String userpass) {
		// TODO Auto-generated method stub
		ArrayList<Member> memberList = new ArrayList<Member>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select * from m_member where mName=? and mPass =?");
			pre.setString(1, username);
			pre.setString(2, userpass);
			rs = pre.executeQuery();
			while(rs.next()){
				Member member = new Member();
				member.setmId(rs.getInt("mId"));
				member.setmName(rs.getString("mName"));
				member.setmPass(rs.getString("mPass"));
				member.setEmail(rs.getString("email"));
				member.setmGender(rs.getString("mGender"));
				memberList.add(member);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberList;
	}
	/**
	 * 根据用户名查询此用户名是否可用
	 * @param name
	 * @return
	 */
	public boolean checkUser(String name) {
		
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		boolean flag = false;
		try {
			pre = con.prepareStatement("select * from m_member where mName=?");
			pre.setString(1, name);
			rs = pre.executeQuery();
			while(rs.next()){
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return flag;
	}
	/**
	 * 根据邮箱查询此邮箱地址是否可用
	 * @param email
	 * @return
	 */
	public boolean checkEmail(String email) {
		
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		boolean flag = false;
		try {
			pre = con.prepareStatement("select * from m_member where email=?");
			pre.setString(1, email);
			rs = pre.executeQuery();
			while(rs.next()){
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return flag;
	}
	/**
	 * 用户注册
	 * @param username
	 * @param userpass
	 * @param email
	 * @return
	 */
	public boolean save(String username, String userpass, String email) {
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		boolean flag = false;
		try {
			pre = con.prepareStatement("insert into m_member(mName,mPass,email) values(?,?,?)");
			pre.setString(1, username);
			pre.setString(2, userpass);
			pre.setString(3, email);
			int num = pre.executeUpdate();
			if(num>0){
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return flag;
	}

}
