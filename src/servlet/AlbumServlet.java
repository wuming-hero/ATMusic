package servlet;

import implement.AlbumImplement;
import implement.SongImplement;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Album;
import pojo.Song;

/**
 * Servlet implementation class AlbumServlet
 */
@WebServlet("/AlbumServlet")
public class AlbumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlbumServlet() {
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
		AlbumImplement albumImplement = new AlbumImplement();
		SongImplement songImplement = new SongImplement();
		String album = request.getParameter("albumId");
		if(album!=null && album.length()>0){
			int albumId = Integer.parseInt(album);
			ArrayList<Album> albumList = albumImplement.queryAlbumById(albumId);
			Album albumDetail = albumList.get(0);
			ArrayList<Song> albumSongList = songImplement.querySongByAlbumId(albumId);
			request.setAttribute("albumDetail", albumDetail);
			request.setAttribute("albumSongList", albumSongList);
			request.getRequestDispatcher("/albumDetail.jsp").forward(request, response);
		}
	}

}
