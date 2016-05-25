package implement;

import java.sql.*;
import java.util.ArrayList;

import db.DBConn;

import pojo.Album;
import pojo.Band;
import pojo.Singer;

public class AlbumImplement {
	private int size = 10;
	public ArrayList<Album> queryAlbum(int id,String status) {
	    
		String sql = "";
		if(status.equals("nice")) {
			sql = "select top "+ size +" m_album.*,m_singer.singerId,m_singer.singerName,m_band.bandId,m_band.bandName from m_singer right join m_album on m_singer.singerId = m_album.singerId left join m_band on m_album.bandId = m_band.bandId where nice = ? order by albumId desc";
		}else {
			sql = "select top "+ size +" m_album.*,m_singer.singerId,m_singer.singerName,m_band.bandId,m_band.bandName from m_singer right join m_album on m_singer.singerId = m_album.singerId left join m_band on m_album.bandId = m_band.bandId where m_album.sortId = ? order by albumId desc" ;
		}
		ArrayList<Album> albums = new ArrayList<Album>();
		
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement(sql);
			pre.setInt(1,id);
			rs = pre.executeQuery();
			while (rs.next()) {
				Album album = new Album();
				album.setAlbumId(rs.getInt("albumId"));
				album.setAlbumName(rs.getString("albumName"));
				album.setAlbumPic(rs.getString("albumPic"));
				album.setIssueDate(rs.getString("issueDate").substring(0,10));
				album.setRecCompany(rs.getString("recCompany"));
				album.setSingerId(rs.getInt("singerId"));
				album.setBandId(rs.getInt("bandId"));
				album.setSortId(rs.getInt("sortId"));
				album.setStyleId(rs.getInt("styleId"));
				album.setNice(rs.getInt("nice"));
				
				Singer singer = new Singer();
				singer.setSingerId(rs.getInt("singerId"));
				singer.setSingerName(rs.getString("singerName"));
				Band band = new Band();
				band.setBandId(rs.getInt("bandId"));
				band.setBandName(rs.getString("bandName"));
				album.setSinger(singer);
				album.setBand(band);
				albums.add(album);
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
		return albums;
		
	}
	
	/**
	 * 根据albumId查询专辑详情
	 * @param albumId
	 * @return
	 */
	
	public ArrayList<Album> queryAlbumById(int albumId) {
		
		ArrayList<Album> albums = new ArrayList<Album>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select m_album.*,m_singer.singerId,m_singer.singerName,m_singer.singerPic,m_band.bandId,m_band.bandName,m_band.bandPic from m_singer right join m_album on m_singer.singerId = m_album.singerId left join m_band on m_album.bandId = m_band.bandId where m_album.albumId=?");
			pre.setInt(1,albumId);
			rs = pre.executeQuery();
			while (rs.next()) {
				Album album = new Album();
				album.setAlbumId(rs.getInt("albumId"));
				album.setAlbumName(rs.getString("albumName"));
				album.setAlbumPic(rs.getString("albumPic"));
				album.setIssueDate(rs.getString("issueDate").substring(0,10));
				album.setRecCompany(rs.getString("recCompany"));
				album.setSingerId(rs.getInt("singerId"));
				album.setBandId(rs.getInt("bandId"));
				album.setSortId(rs.getInt("sortId"));
				album.setStyleId(rs.getInt("styleId"));
				album.setNice(rs.getInt("nice"));
				
				Singer singer = new Singer();
				singer.setSingerId(rs.getInt("singerId"));
				singer.setSingerName(rs.getString("singerName"));
				singer.setSingerPic(rs.getString("singerPic"));
				Band band = new Band();
				band.setBandId(rs.getInt("bandId"));
				band.setBandName(rs.getString("bandName"));
				band.setBandPic(rs.getString("bandPic"));
				album.setSinger(singer);
				album.setBand(band);
				albums.add(album);
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
		return albums;
	}

}
