package implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DBConn;

import pojo.Band;

public class BandImplement {

	public ArrayList<Band> queryBand(int bandId) {
		// TODO Auto-generated method stub
		ArrayList<Band> bandDetail = new ArrayList<Band>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs =null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select * from m_band where bandId=?");
			pre.setInt(1, bandId);
			rs = pre.executeQuery();
			while(rs.next()){
				Band band = new Band();
				band.setBandId(rs.getInt("bandId"));
				band.setBandName(rs.getString("bandName"));
				band.setBandPic(rs.getString("bandPic"));
				bandDetail.add(band);
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
		return bandDetail;
	}
	/**
	 * 分类查询band
	 * @param sortId
	 * @param gender
	 * @return
	 */
	public ArrayList<Band> queryBandBySort(int sortId) {
		ArrayList<Band> bandDetail = new ArrayList<Band>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs =null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select * from m_band where sortId=?");
			pre.setInt(1, sortId);
			rs = pre.executeQuery();
			while(rs.next()){
				Band band = new Band();
				band.setBandId(rs.getInt("bandId"));
				band.setBandName(rs.getString("bandName"));
				band.setBandPic(rs.getString("bandPic"));
				bandDetail.add(band);
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
		return bandDetail;
	}
	public ArrayList<Band> queryKeyWord(String keyWord) {
		ArrayList<Band> bandDetail = new ArrayList<Band>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs =null;
		DBConn conns = new DBConn();
		con = conns.getConnection();
		try {
			pre = con.prepareStatement("select * from m_band where bandName like ?");
			pre.setString(1, "%"+keyWord+"%");
			rs = pre.executeQuery();
			while(rs.next()){
				Band band = new Band();
				band.setBandId(rs.getInt("bandId"));
				band.setBandName(rs.getString("bandName"));
				band.setBandPic(rs.getString("bandPic"));
				bandDetail.add(band);
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
		return bandDetail;
	}

}
