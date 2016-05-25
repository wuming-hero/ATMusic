package implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DBConn;

import pojo.Style;

public class StyleImplement {
	
	public ArrayList<Style> queryStyle(String styleName) {
		ArrayList<Style> styles = new ArrayList<Style>();
		Connection con = null;
		PreparedStatement pre = null;
		DBConn conns= new DBConn(); 
		con = conns.getConnection();
		ResultSet rs = null;
		try {
			pre = con.prepareStatement("SELECT * FROM m_style WHERE styleName like ?");
			pre.setString(1,"%" + styleName + "%");
			rs = pre.executeQuery();
			while (rs.next()) {
				Style style = new Style ();
				style.setStyleId(rs.getInt("styleId"));
				style.setStyleName(rs.getString("styleName"));
				styles.add(style);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return styles;
		
	}

}
