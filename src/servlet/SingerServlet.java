package servlet;

import implement.BandImplement;
import implement.SingerImplement;
import implement.SongImplement;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Band;
import pojo.Singer;
import pojo.Song;

/**
 * Servlet implementation class SingerServlet
 */
@WebServlet("/SingerServlet")
public class SingerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SingerServlet() {
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
		SingerImplement singerImplement = new SingerImplement();
		BandImplement bandImplement = new BandImplement();
		SongImplement songImplement = new SongImplement();
		String flag = request.getParameter("flag");
		//当点击乐手/乐队时执行的查询
		if("singer".equals(flag)){
			int singerId= Integer.parseInt(request.getParameter("singerName"));
			ArrayList<Singer> singerList = singerImplement.querySingerById(singerId);
			Singer singerDetail = null;
			if(singerList.size()>0){
				singerDetail = singerList.get(0);
			}
			ArrayList<Song> songList = songImplement.querySongBySingerId(singerId,flag);
			request.setAttribute("singerDetail", singerDetail);
			request.setAttribute("songList", songList);
			request.getRequestDispatcher("/singerSong.jsp").forward(request, response);
		}else if("band".equals(flag)){
			int singerId= Integer.parseInt(request.getParameter("singerName"));
			ArrayList<Band> bandList =  bandImplement.queryBand(singerId);
			Band bandDetail = null;
			if(bandList.size()>0){
				bandDetail = bandList.get(0);
			}
			ArrayList<Song> songList = songImplement.querySongBySingerId(singerId,flag);
			request.setAttribute("bandDetail", bandDetail);
			request.setAttribute("songList", songList);
			request.getRequestDispatcher("/singerSong.jsp").forward(request, response);
		}else if("singerSort".equals(flag)){
			String gender = new String(request.getParameter("gender").getBytes("ISO-8859-1"),"UTF-8");
			int sortId = Integer.parseInt(request.getParameter("sortId"));
			ArrayList<Singer> singerList = singerImplement.querySinger(sortId,gender);
			request.setAttribute("singerList", singerList);
			request.getRequestDispatcher("/singerList.jsp").forward(request, response);
		}else if("bandSort".equals(flag)){
			int sortId = Integer.parseInt(request.getParameter("sortId"));
			ArrayList<Band> bandList = bandImplement.queryBandBySort(sortId);
			request.setAttribute("bandList", bandList);
			request.getRequestDispatcher("/singerList.jsp").forward(request, response);
		}else if("others".endsWith(flag)){
			int sortId = Integer.parseInt(request.getParameter("sortId"));
			ArrayList<Singer> singerList = singerImplement.queryOthers(sortId);
			ArrayList<Band> bandList = bandImplement.queryBandBySort(sortId);
			request.setAttribute("singerList", singerList);
			request.setAttribute("bandList", bandList);
			request.getRequestDispatcher("/singerList.jsp").forward(request, response);
		}else if("queryAll".equals(flag)){
			String keyWord = request.getParameter("keyWord");
//			ArrayList<Singer> singerList = singerImplement.queryKeyWord(keyWord);
//			ArrayList<Band> bandList = bandImplement.queryKeyWord(keyWord);
			ArrayList<Song> songList = songImplement.queryKeyWord(keyWord);
//			request.setAttribute("singerList", singerList);
//			request.setAttribute("bandList", bandList);
			request.setAttribute("songList", songList);
			request.getRequestDispatcher("/keyWordQuery.jsp").forward(request, response);
		}
		
	}

}
