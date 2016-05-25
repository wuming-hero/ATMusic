package implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DBConn;
import pojo.Band;
import pojo.Singer;
import pojo.Song;

public class UploadImplement {
	
	/**
	 * 保存乐队信息
	 * @param band
	 * @throws SQLException 
	 */
	public boolean save(Band band){
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns= new DBConn(); 
		con = conns.getConnection();
		try {
			pre = con.prepareStatement(" if NOT EXISTS (select 1 from m_band where bandName= ? and sortId = ?)insert into m_band values(?,?,?)");
			pre.setString(1, band.getBandName());
			pre.setInt(2, band.getSortId());
			pre.setString(3, band.getBandName());
			pre.setString(4, band.getBandPic());
			pre.setInt(5, band.getSortId());
			pre.executeUpdate();
			return true;
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
		return false;
	}
	/**
	 * 乐队查询
	 * @param band
	 * @return
	 * @throws SQLException 
	 */
	public ArrayList<Band> search(Band band){
		
		ArrayList<Band> bandList = new ArrayList<Band>();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pre = null;
		DBConn conns= new DBConn(); 
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select * from m_band where bandName=? and sortId=?");
			pre.setString(1, band.getBandName());
			pre.setInt(2, band.getSortId());
			rs = pre.executeQuery();
			while(rs.next()){
				band.setBandId(rs.getInt("bandId"));
				band.setBandName(rs.getString("bandName"));
				band.setBandPic(rs.getString("bandPic"));
				band.setSortId(rs.getInt("sortId"));
				bandList.add(band);
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
		
		return bandList;
	}
	/**
	 * 音乐信息保存到数据库
	 * @param song
	 */
	public boolean saveSong(Song song) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns= new DBConn(); 
		con = conns.getConnection();
		try {
			pre = con.prepareStatement(" if NOT EXISTS (select 1 from m_song where songName=? and bandId = ?)insert into m_song values(?,?,?,?,?,?,?,?)");
			pre.setString(1, song.getSongName());
			pre.setInt(2, song.getSingerId());
			pre.setString(3, song.getSongName());
			pre.setString(4, song.getSongPath());
			pre.setInt(5, song.getSortId());
			pre.setInt(6, song.getStyleId());
			pre.setInt(7, song.getSingerId());
			pre.setInt(8, song.getAlbumId());
			pre.setInt(9,song.getBandId());
			pre.setInt(10, song.getmId());
			pre.executeUpdate();
			return true;
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
		return false;
	}
	
	/**
	 * 保存歌手信息
	 * @param singer
	 * @return
	 */
	public boolean save(Singer singer) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pre = null ;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement(" if NOT EXISTS (select 1 from m_singer where singerName= ? and sortId = ?)insert into m_singer values(?,?,?,?)");
			pre.setString(1,singer.getSingerName());
			pre.setInt(2,singer.getSortId());
			pre.setString(3,singer.getSingerName());
			pre.setString(4,singer.getGender());
			pre.setString(5,singer.getSingerPic());
			pre.setInt(6,singer.getSortId());
			pre.executeUpdate();
			return true;
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
		return false;
	}
	
public ArrayList<Singer> searchSinger(Singer singer){
		
		ArrayList<Singer> singerList = new ArrayList<Singer>();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pre = null;
		DBConn conns= new DBConn(); 
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select * from m_singer where singerName=? and sortId=?");
			pre.setString(1,singer.getSingerName());
			pre.setInt(2,singer.getSortId());
			rs = pre.executeQuery();
			while(rs.next()){
				singer.setSingerId(rs.getInt("singerId"));
				singer.setSingerName(rs.getString("singerName"));
				singer.setGender(rs.getString("gender"));
				singer.setSingerPic(rs.getString("singerPic"));
				singer.setSortId(rs.getInt("sortId"));
				singerList.add(singer);
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
		
		return singerList;
	}
}
