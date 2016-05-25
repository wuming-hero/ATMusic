package implement;

import java.sql.*;
import java.util.ArrayList;

import db.DBConn;

import pojo.Comment;
import pojo.Member;

public class CommentImplement {

	public ArrayList<Comment> queryComment(int singerId, String singer) {
		ArrayList<Comment> commentList = new ArrayList<Comment>();
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		String sql = "";
		if("singer".equals(singer)){
			sql = "select m_comment.*from m_comment where singerId ="+ singerId +"";
		}else{
			sql= "select m_comment.* from m_comment where bandId = "+ singerId+ "";
		}
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()){
				Comment comment = new Comment();
				comment.setCommentContent(rs.getString("commentContent"));
				comment.setCommentDate(rs.getTimestamp("commentDate"));
				comment.setmName(rs.getString("mName"));
				commentList.add(comment);
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
		return commentList;
	}
	
	/**
	 * 保存评论内容
	 * @param mName
	 * @param content
	 * @param singerId
	 * @param flag
	 */
	public void save(String mName, String content, int singerId, String flag) {
		
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		String sql = "";
		if("singer".equals(flag)){
			sql = "insert into m_comment(commentContent,commentDate,mName,singerId)values('"+content+"',getDate(),'"+mName+"',"+singerId+")";
		}else{
			sql= "insert into m_comment(commentContent,commentDate,mName,bandId)values('"+content+"',getDate(),'"+mName+"',"+singerId+")";
		}
		try {
			pre = con.prepareStatement(sql);
			pre.executeUpdate();
			
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
		
	}
	
	/**
	 *查询出全部评论并按时间倒序(管理员操作)
	 * @return
	 */
	
	public ArrayList<Comment> queryAllComment() {
		ArrayList<Comment> commentList = new ArrayList<Comment>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select m_comment.* from m_comment order by commentDate desc");
			rs = pre.executeQuery();
			while(rs.next()){
				Comment comment = new Comment();
				comment.setCommentId(rs.getInt("commentId"));
				comment.setCommentContent(rs.getString("commentContent"));
				comment.setCommentDate(rs.getTimestamp("commentDate"));
				comment.setmName(rs.getString("mName"));
				commentList.add(comment);
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
		return commentList;
	}
	/**
	 * 根据commentId删除comment
	 * @param commentId
	 * @return
	 */
	public int del(int commentId) {
		
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		int num = 0;
		try {
			pre = con.prepareStatement("delete from m_comment where commentId = ?");
			pre.setInt(1, commentId);
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
