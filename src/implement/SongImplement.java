package implement;

import java.sql.*;
import java.util.ArrayList;

import db.DBConn;

import pojo.Band;
import pojo.Singer;
import pojo.Song;

public class SongImplement {
	
	private int size = 20;
	
	public ArrayList<Song> querySong(int Id,String type) {
		String sql="";
		if(type.equals("style")){
			 sql="select m_song.*,m_singer.singerName,m_band.bandName from m_singer right join m_song on m_singer.singerId=m_song.singerId left join m_band on m_song.bandId = m_band.bandId where m_song.styleId=?";
			 System.out.println(sql);
		}else if(type.equals("sort")){
			sql="";
		}
		ArrayList<Song> songs = new ArrayList<Song>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement(sql);
			pre.setInt(1,Id);
			rs = pre.executeQuery();
			while(rs.next()) {
				Song song = new Song();
				song.setSongId(rs.getInt("songId"));
				song.setSongName(rs.getString("songName"));
				song.setSongPath(rs.getString("songPath"));
				song.setSortId(rs.getInt("sortId"));
				song.setStyleId(rs.getInt("styleId"));
				song.setSingerId(rs.getInt("singerId"));
				song.setAlbumId(rs.getInt("albumId"));
				song.setBandId(rs.getInt("bandId"));
				Singer singer = new Singer();
				singer.setSingerName(rs.getString("singerName"));
				song.setSinger(singer);
				Band band = new Band();
				band.setBandName(rs.getString("bandName"));
				song.setBand(band);
				songs.add(song);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return songs;
	}
	
	/**
	 * 分类查询音乐
	 * @param sortId
	 * @return
	 */
	public ArrayList<Song> querySong (int sortId) {
		
		ArrayList<Song> songs = new ArrayList<Song>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select top "+ size+" m_song.*,m_singer.singerName,m_band.bandName from m_singer right join m_song on m_singer.singerId=m_song.singerId left join m_band on m_song.bandId = m_band.bandId where m_song.sortId = ? and mId= 1 order by songId desc");
			pre.setInt(1,sortId);
			rs = pre.executeQuery();
			while(rs.next()) {
				Song song = new Song();
				song.setSongId(rs.getInt("songId"));
				song.setSongName(rs.getString("songName"));
				song.setSongPath(rs.getString("songPath"));
				song.setSortId(rs.getInt("sortId"));
				song.setStyleId(rs.getInt("styleId"));
				song.setSingerId(rs.getInt("singerId"));
				song.setAlbumId(rs.getInt("albumId"));
				song.setBandId(rs.getInt("bandId"));
				
				Singer singer = new Singer();
				singer.setSingerName(rs.getString("singerName"));
				song.setSinger(singer);
				Band band = new Band();
				band.setBandName(rs.getString("bandName"));
				song.setBand(band);
				
				songs.add(song);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return songs;
	}
	/**
	 * 根据id查询音乐
	 * @param songId
	 * @return
	 */
	public ArrayList<Song> querySongById(int songId) {
		
		ArrayList<Song> songs = new ArrayList<Song>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select  m_song.songName,m_song.songPath,m_singer.singerName,m_band.bandName from m_singer right join m_song on m_singer.singerId=m_song.singerId left join m_band on m_song.bandId = m_band.bandId where songId=?");
			pre.setInt(1,songId);
			rs = pre.executeQuery();
			while(rs.next()) {
				Song song = new Song();
				song.setSongName(rs.getString("songName"));
				song.setSongPath(rs.getString("songPath"));
				Singer singer = new Singer();
				singer.setSingerName(rs.getString("singerName"));
				song.setSinger(singer);
				Band band = new Band();
				band.setBandName(rs.getString("bandName"));
				song.setBand(band);
				songs.add(song);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return songs;
	}
	/**
	 * 查询歌手/乐队的音乐
	 * @param singerName
	 * @param flag
	 * @return
	 */
	public ArrayList<Song> querySongBySingerId(int singerId, String flag) {
		// TODO Auto-generated method stub
		ArrayList<Song> songList = new ArrayList<Song>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			if(flag.equals("singer")){
				pre = con.prepareStatement("select  m_song.songId,m_song.songName,m_song.songPath,m_singer.singerName,m_band.bandName from m_singer right join m_song on m_singer.singerId=m_song.singerId left join m_band on m_song.bandId = m_band.bandId where m_song.singerId=?");
			}else {
				pre = con.prepareStatement("select   m_song.songId,m_song.songName,m_song.songPath,m_singer.singerName,m_band.bandName from m_singer right join m_song on m_singer.singerId=m_song.singerId left join m_band on m_song.bandId = m_band.bandId where m_song.bandId=?");
			}
			pre.setInt(1, singerId);
			rs = pre.executeQuery();
			while(rs.next()){
				Song song = new Song();
				song.setSongId(rs.getInt("songId"));
				song.setSongName(rs.getString("songName"));
				song.setSongPath(rs.getString("songPath"));
				Singer singer = new Singer();
				singer.setSingerName(rs.getString("singerName"));
				song.setSinger(singer);
				Band band = new Band();
				band.setBandName(rs.getString("bandName"));
				song.setBand(band);
				songList.add(song);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return songList;
	}
	/**
	 * 查询会员上传的音乐
	 * @return
	 */
	public ArrayList<Song> querySongByMember() {
		// TODO Auto-generated method stub
		ArrayList<Song> songList = new ArrayList<Song>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select top "+ size +" m_song.*,m_singer.singerName,m_band.bandName from m_singer right join m_song on m_singer.singerId=m_song.singerId left join m_band on m_song.bandId = m_band.bandId where mId != '' and mId != 1 order by m_song.songId desc");
			rs = pre.executeQuery();
			while(rs.next()){
				Song song = new Song();
				song.setSongId(rs.getInt("songId"));
				song.setSongName(rs.getString("songName"));
				song.setSongPath(rs.getString("songPath"));
				song.setSortId(rs.getInt("sortId"));
				song.setStyleId(rs.getInt("styleId"));
				song.setSingerId(rs.getInt("singerId"));
				song.setAlbumId(rs.getInt("albumId"));
				song.setBandId(rs.getInt("bandId"));
				Singer singer = new Singer();
				singer.setSingerName(rs.getString("singerName"));
				song.setSinger(singer);
				Band band = new Band();
				band.setBandName(rs.getString("bandName"));
				song.setBand(band);
				songList.add(song);
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
		return songList;
	}
	/**
	 * 查询DJ/舞曲
	 * @return
	 */
	public ArrayList<Song> querySongByDance() {
		ArrayList<Song> songList = new ArrayList<Song>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select top "+ size +"  m_song.*,m_singer.singerName,m_band.bandName from m_singer right join m_song on m_singer.singerId=m_song.singerId left join m_band on m_song.bandId = m_band.bandId where (m_song.styleId=6 or m_song.styleId=12) and mId = 1 order by m_song.songId desc");
			rs = pre.executeQuery();
			while(rs.next()){
				Song song = new Song();
				song.setSongId(rs.getInt("songId"));
				song.setSongName(rs.getString("songName"));
				song.setSongPath(rs.getString("songPath"));
				song.setSortId(rs.getInt("sortId"));
				song.setStyleId(rs.getInt("styleId"));
				song.setSingerId(rs.getInt("singerId"));
				song.setAlbumId(rs.getInt("albumId"));
				song.setBandId(rs.getInt("bandId"));
				Singer singer = new Singer();
				singer.setSingerName(rs.getString("singerName"));
				song.setSinger(singer);
				Band band = new Band();
				band.setBandName(rs.getString("bandName"));
				song.setBand(band);
				songList.add(song);
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
		return songList;
	}
	/**
	 * 网络流行,新媒体,经典音乐查询
	 * @return
	 */
	public ArrayList<Song> querySongByStyle(int styleId) {
		ArrayList<Song> songList = new ArrayList<Song>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select top "+ size +"  m_song.*,m_singer.singerName,m_band.bandName from m_singer right join m_song on m_singer.singerId=m_song.singerId left join m_band on m_song.bandId = m_band.bandId where m_song.styleId=? and mId = 1 order by m_song.songId desc");
			pre.setInt(1, styleId);
			rs = pre.executeQuery();
			while(rs.next()){
				Song song = new Song();
				song.setSongId(rs.getInt("songId"));
				song.setSongName(rs.getString("songName"));
				song.setSongPath(rs.getString("songPath"));
				song.setSortId(rs.getInt("sortId"));
				song.setStyleId(rs.getInt("styleId"));
				song.setSingerId(rs.getInt("singerId"));
				song.setAlbumId(rs.getInt("albumId"));
				song.setBandId(rs.getInt("bandId"));
				Singer singer = new Singer();
				singer.setSingerName(rs.getString("singerName"));
				song.setSinger(singer);
				Band band = new Band();
				band.setBandName(rs.getString("bandName"));
				song.setBand(band);
				songList.add(song);
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
		return songList;
	}
	/**
	 * 根据albumId查询此专辑的全部歌曲
	 * @param albumId
	 * @return
	 */
	public ArrayList<Song> querySongByAlbumId(int albumId) {
		ArrayList<Song> songList = new ArrayList<Song>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select m_song.*,m_singer.singerName,m_band.bandName from m_singer right join m_song on m_singer.singerId=m_song.singerId left join m_band on m_song.bandId = m_band.bandId where m_song.albumId=?");
			pre.setInt(1, albumId);
			rs = pre.executeQuery();
			while(rs.next()){
				Song song = new Song();
				song.setSongId(rs.getInt("songId"));
				song.setSongName(rs.getString("songName"));
				song.setSongPath(rs.getString("songPath"));
				song.setSortId(rs.getInt("sortId"));
				song.setStyleId(rs.getInt("styleId"));
				song.setSingerId(rs.getInt("singerId"));
				song.setAlbumId(rs.getInt("albumId"));
				song.setBandId(rs.getInt("bandId"));
				Singer singer = new Singer();
				singer.setSingerName(rs.getString("singerName"));
				song.setSinger(singer);
				Band band = new Band();
				band.setBandName(rs.getString("bandName"));
				song.setBand(band);
				songList.add(song);
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
		return songList;
	}
	/**
	 * 查询全部会员上传的歌曲供管理
	 * @return
	 */
	public ArrayList<Song> querySongForManage() {
		
		ArrayList<Song> songList = new ArrayList<Song>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select m_song.*,m_singer.singerName,m_band.bandName from m_singer right join m_song on m_singer.singerId=m_song.singerId left join m_band on m_song.bandId = m_band.bandId where mId!='' order by m_song.songId desc");
			rs = pre.executeQuery();
			while(rs.next()){
				Song song = new Song();
				song.setSongId(rs.getInt("songId"));
				song.setSongName(rs.getString("songName"));
				song.setSongPath(rs.getString("songPath"));
				song.setSortId(rs.getInt("sortId"));
				song.setStyleId(rs.getInt("styleId"));
				song.setSingerId(rs.getInt("singerId"));
				song.setAlbumId(rs.getInt("albumId"));
				song.setBandId(rs.getInt("bandId"));
				Singer singer = new Singer();
				singer.setSingerName(rs.getString("singerName"));
				song.setSinger(singer);
				Band band = new Band();
				band.setBandName(rs.getString("bandName"));
				song.setBand(band);
				songList.add(song);
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
		return songList;
	}
	
	/**
	 * 根据songId从数据库删除音乐
	 * @param songId
	 * @return
	 */
	
	public int delSong(int songId) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		int num = 0;
		try {
			pre = con.prepareStatement("delete from m_song where songId = ?");
			pre.setInt(1, songId);
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

	public ArrayList<Song> queryKeyWord(String keyWord) {
		ArrayList<Song> songList = new ArrayList<Song>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select m_song.*,m_singer.singerName,m_band.bandName from m_singer right join m_song on m_singer.singerId=m_song.singerId left join m_band on m_song.bandId = m_band.bandId where songName like ? or singerName like ? or bandName like ?");
			pre.setString(1, "%"+keyWord+"%");
			pre.setString(2, "%"+keyWord+"%");
			pre.setString(3, "%"+keyWord+"%");
			rs = pre.executeQuery();
			while(rs.next()){
				Song song = new Song();
				song.setSongId(rs.getInt("songId"));
				song.setSongName(rs.getString("songName"));
				song.setSongPath(rs.getString("songPath"));
				song.setSortId(rs.getInt("sortId"));
				song.setStyleId(rs.getInt("styleId"));
				song.setSingerId(rs.getInt("singerId"));
				song.setAlbumId(rs.getInt("albumId"));
				song.setBandId(rs.getInt("bandId"));
				Singer singer = new Singer();
				singer.setSingerName(rs.getString("singerName"));
				song.setSinger(singer);
				Band band = new Band();
				band.setBandName(rs.getString("bandName"));
				song.setBand(band);
				songList.add(song);
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
		return songList;
	}
}
