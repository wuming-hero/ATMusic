package servlet;

import implement.SongImplement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.Song;

/**
 * Servlet implementation class SongServlet
 */
@WebServlet("/SongServlet")
public class SongServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SongServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		SongImplement songImplement = new SongImplement();
		PrintWriter out = response.getWriter();
		String style = request.getParameter("styleId");
		String type = request.getParameter("type");
		if(type.equals("style")){
			String styleName = new String(request.getParameter("styleName").getBytes("ISO-8859-1"),"UTF-8");
			int styleId = 0;
			ArrayList<Song> songs =null;
			if(style!=null && !style.equals("") && type!=null){
				styleId = Integer.parseInt(style);
				songs = songImplement.querySong(styleId,type);
			}
			request.setAttribute("songs",songs);
			request.setAttribute("styleName", styleName);
			request.getRequestDispatcher("/styleSong.jsp").forward(request, response);
		}else if("songManage".equals(type)){
			ArrayList<Song> songList = songImplement.querySongForManage();
			request.setAttribute("songList", songList);
			request.getRequestDispatcher("/admin/songManage.jsp").forward(request, response);
		}else if("delSong".equals(type)){
			String songId = request.getParameter("songId");
			if(songId.length()>0 && songId!=null){
				int id = Integer.parseInt(songId);
				int num = songImplement.delSong(id);
				if(num>0){
					out.print("{\"success\":\"true\"}");
				}
			}
			
		}
		
	}
}
