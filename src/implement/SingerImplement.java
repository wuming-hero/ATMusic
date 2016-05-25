package implement;

import java.sql.*;
import java.util.ArrayList;

import db.DBConn;

import pojo.Singer;

public class SingerImplement {
	/**
	 * 根据sortId查询歌手信息
	 * @param sortId
	 * @return
	 */
	public ArrayList<Singer> querySinger(int sortId) {
		
		ArrayList<Singer> singers = new ArrayList<Singer>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns .getConnection();
		try {
			pre = con.prepareStatement("select top(12)* from m_singer where sortId = ? order by singerId desc");
			pre.setInt(1, sortId);
			rs = pre.executeQuery();
			while(rs.next()) {
				Singer singer = new Singer();
				singer.setSingerId(rs.getInt("singerId"));
				singer.setSingerName(rs.getString("singerName"));
				singer.setGender(rs.getString("gender"));
				singer.setSingerPic(rs.getString("singerPic"));
				singers.add(singer);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return singers;
	}
	/**
	 * 根据歌手名字查询歌手信息
	 * @param singerName
	 * @return
	 */
	public ArrayList<Singer> querySingerById(int singerId) {
		// TODO Auto-generated method stub
		ArrayList<Singer> singerDetail = new ArrayList<Singer>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select * from m_singer where singerId=?");
			pre.setInt(1,singerId);
			rs = pre.executeQuery();
			while(rs.next()){
				Singer singer = new Singer();
				singer.setSingerId(rs.getInt("singerId"));
				singer.setSingerName(rs.getString("singerName"));
				singer.setGender(rs.getString("gender"));
				singer.setSingerPic(rs.getString("singerPic"));
				singerDetail.add(singer);
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
		
		return singerDetail;
	}
	/**
	 * 分类查询乐手
	 * @param sortId
	 * @param gender
	 * @return
	 */
	public ArrayList<Singer> querySinger(int sortId, String gender) {
		ArrayList<Singer> singerDetail = new ArrayList<Singer>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select * from m_singer where sortId=? and gender=?");
			pre.setInt(1,sortId);
			pre.setString(2, gender);
			rs = pre.executeQuery();
			while(rs.next()){
				Singer singer = new Singer();
				singer.setSingerId(rs.getInt("singerId"));
				singer.setSingerName(rs.getString("singerName"));
				singer.setGender(rs.getString("gender"));
				singer.setSingerPic(rs.getString("singerPic"));
				singerDetail.add(singer);
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
		return singerDetail;
	}
	public ArrayList<Singer> queryOthers(int sortId) {
		ArrayList<Singer> singers = new ArrayList<Singer>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns .getConnection();
		try {
			pre = con.prepareStatement("select * from m_singer where sortId = ?");
			pre.setInt(1, sortId);
			rs = pre.executeQuery();
			while(rs.next()) {
				Singer singer = new Singer();
				singer.setSingerId(rs.getInt("singerId"));
				singer.setSingerName(rs.getString("singerName"));
				singer.setGender(rs.getString("gender"));
				singer.setSingerPic(rs.getString("singerPic"));
				singers.add(singer);
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
		return singers;
	}
	public ArrayList<Singer> queryKeyWord(String keyWord) {
		ArrayList<Singer> singers = new ArrayList<Singer>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns .getConnection();
		try {
			pre = con.prepareStatement("select * from m_singer where singerName like ?");
			pre.setString(1, "%"+keyWord+"%");
			rs = pre.executeQuery();
			while(rs.next()) {
				Singer singer = new Singer();
				singer.setSingerId(rs.getInt("singerId"));
				singer.setSingerName(rs.getString("singerName"));
				singer.setGender(rs.getString("gender"));
				singer.setSingerPic(rs.getString("singerPic"));
				singers.add(singer);
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
		return singers;
	}
}
