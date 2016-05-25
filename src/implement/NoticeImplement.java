package implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DBConn;

import pojo.Notice;

public class NoticeImplement {
	
	/**
	 * 初始化notice(查询最新的三条)
	 * @return
	 */
	
	public ArrayList<Notice> queryNotice() {
		ArrayList<Notice> noticeList = new ArrayList<Notice>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns  = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select top 5 *  from m_notice order by noticeDate desc");
			rs = pre.executeQuery();
			while(rs.next()){
				Notice notice = new Notice();
				notice.setNoticeId(rs.getInt("noticeId"));
				notice.setNoticeName(rs.getString("noticeName"));
				notice.setNoticeContent(rs.getString("noticeContent"));
				notice.setNoticeDate(rs.getTimestamp("noticeDate"));
				notice.setmName(rs.getString("mName"));
				noticeList.add(notice);
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
		return noticeList;
		// TODO Auto-generated method stub
		
	}
	
	/**
	 * 根据noticeId查询notice详情
	 * @param noticeId
	 * @return
	 */
	
	public Notice queryNoticeById(int noticeId) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns  = new DBConn();
		con = conns.getConnection();
		Notice notice = new Notice();
		try {
			pre = con.prepareStatement("select *  from m_notice where noticeId=?");
			pre.setInt(1, noticeId);
			rs = pre.executeQuery();
			while(rs.next()){
				notice.setNoticeId(rs.getInt("noticeId"));
				notice.setNoticeName(rs.getString("noticeName"));
				notice.setNoticeContent(rs.getString("noticeContent"));
				notice.setNoticeDate(rs.getTimestamp("noticeDate"));
				notice.setmName(rs.getString("mName"));
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
		return notice;
	}
	/**
	 * 添加新闻
	 * @param noticeName
	 * @param noticeContent
	 * @param mName
	 * @return
	 */
	public int saveNotice(String noticeName, String noticeContent, String mName) {
		
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns  = new DBConn();
		con = conns.getConnection();
		int num = 0;
		try {
			pre = con.prepareStatement("insert into m_notice (noticeName,noticeContent,noticeDate,mName) values (?,?,getDate(),?)");
			pre.setString(1, noticeName);
			pre.setString(2, noticeContent);
			pre.setString(3, mName);
			num = pre.executeUpdate();
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
		return num;
	}
	
	/**
	 * 查询全部notice并根据时间倒序
	 * @return
	 */
	
	public ArrayList<Notice> queryAllNotice() {
		ArrayList<Notice> noticeList = new ArrayList<Notice>();
		
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns  = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select *  from m_notice order by noticeDate desc");
			rs = pre.executeQuery();
			while(rs.next()){
				Notice notice = new Notice();
				notice.setNoticeId(rs.getInt("noticeId"));
				notice.setNoticeName(rs.getString("noticeName"));
				notice.setNoticeContent(rs.getString("noticeContent"));
				notice.setNoticeDate(rs.getTimestamp("noticeDate"));
				notice.setmName(rs.getString("mName"));
				noticeList.add(notice);
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
		return noticeList;
	}

	public int delete(int noticeId) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		int num = 0;
		try {
			pre = con.prepareStatement("delete from m_notice where noticeId=?");
			pre.setInt(1, noticeId);
			num = pre.executeUpdate();
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
		return num;
	}

}
