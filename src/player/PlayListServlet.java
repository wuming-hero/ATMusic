package player;

import implement.SongImplement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.DocumentException;

import pojo.Song;

/**
 * Servlet implementation class PlayListServlet
 */
@WebServlet("/PlayListServlet")
public class PlayListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlayListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;utf-8");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		XmlAccess xml = null;
		if (!StringUtility.isNull(action) && !"addmore".equals(action) && !"albumPlay".equals(action)) {
			try {
				xml = new XmlAccess(request.getSession().getServletContext().getRealPath("/")+"player/playlist.xml");
			} catch (DocumentException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		
			if ("add".equals(action)) {
//				String singer = request.getParameter("singerName");
//				String name = request.getParameter("songName");
//				String url = request.getParameter("songPath");
				//解决中文乱码
				String singer = new String(request.getParameter("singerName").getBytes("ISO-8859-1"),"UTF-8");
				String name = new String(request.getParameter("songName").getBytes("ISO-8859-1"),"UTF-8");
				String url = new String(request.getParameter("songPath").getBytes("ISO-8859-1"),"UTF-8");
				
				Map<String, String> value = new HashMap<String, String>();
				value.put("singer", singer);
				value.put("name", name);
				value.put("url", url);
				
				try {
					xml.addNode("/", "music", value);
				} catch (Exception e) {
					e.printStackTrace();
				}
				response.sendRedirect("/ATMusic/player.jsp");
			} else if ("delete".equals(action)) {
				String[] index = request.getParameter("index").split("#");
				for (int i = 0; i < index.length; i++) {
					try {
						xml.removeNode("/music/", Integer.valueOf(index[i]) - i);
					} catch (NumberFormatException e) {
						e.printStackTrace();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}else if("addmore".equals(action)){
			try {
				xml = new XmlAccess(request.getSession().getServletContext().getRealPath("/")+"player/playlist.xml");
			} catch (DocumentException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			//得到songId
			String songId = request.getParameter("tid");
			System.out.print(songId);
			SongImplement songImplement = new SongImplement();
			//根据songId得到音乐信息
			ArrayList<Song> songList = songImplement.querySongById(Integer.parseInt(songId));
			String songName = songList.get(0).getSongName();
			String songPath = songList.get(0).getSongPath();
			String singerName = songList.get(0).getSinger().getSingerName();
			String bandName = songList.get(0).getBand().getBandName();
			String singer = "";
			if(singerName!="" && singerName!="NULL" && singerName!=null && singerName.length()>0){
				singer = singerName;
			}else {
				singer = bandName;
			}
			
			Map<String, String> value = new HashMap<String, String>();
			value.put("singer", singer);
			value.put("name", songName);
			value.put("url", songPath);
			try {
				xml.addNode("/", "music", value);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//不跳转!!
			response.sendRedirect("/player.jsp");
//			response.sendRedirect("www.baidu.com");
		}else if("albumPlay".equals(action)){
			String album = request.getParameter("albumId");
			SongImplement songImplement = new SongImplement();
			if(album!=null && album.length()>0){
				int albumId = Integer.parseInt(album);
				ArrayList<Song> albumSongList = songImplement.querySongByAlbumId(albumId);
				for(int i=0;i<albumSongList.size();i++){
					try {
						xml = new XmlAccess(request.getSession().getServletContext().getRealPath("/")+"player/playlist.xml");
					} catch (DocumentException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					String songName = albumSongList.get(i).getSongName();
					String singerName = albumSongList.get(i).getSinger().getSingerName();
					String bandName = albumSongList.get(i).getBand().getBandName();
					String singer = "";
					if(singerName!="" && singerName!="NULL" && singerName!=null && singerName.length()>0){
						singer = singerName;
					}else {
						singer = bandName;
					}
					String songPath = albumSongList.get(i).getSongPath();
					Map<String, String> value = new HashMap<String, String>();
					value.put("singer", singer);
					value.put("name", songName);
					value.put("url", songPath);
					try {
						xml.addNode("/", "music", value);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			response.sendRedirect("/ATMusic/player.jsp");	
		}
	}

}
