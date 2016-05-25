package servlet;

import implement.AlbumImplement;
import implement.NoticeImplement;
import implement.SingerImplement;
import implement.SongImplement;
import implement.StyleImplement;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Album;
import pojo.Notice;
import pojo.Singer;
import pojo.Song;
import pojo.Style;

/**
 * Servlet implementation class InitServlet
 */
@WebServlet("/InitServlet")
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) 
			throws ServletException {
		
		//服务器打开时要初始化的数据
		//1,初始化全部"曲风"
		StyleImplement styleImplement = new StyleImplement();
		// TODO Auto-generated method stub
		ArrayList<Style> styles =  styleImplement.queryStyle("");
		ServletContext app = config.getServletContext();
		app.setAttribute("styles", styles);
		//初始化歌曲
		SongImplement songImplement = new SongImplement();
		ArrayList<Song> songs = songImplement.querySong(1);			//国语音乐初始化
		ArrayList<Song> newoumeisongs = songImplement.querySong(3);	//欧美歌曲初始化
		ArrayList<Song> newrihansongs = songImplement.querySong(2);  //日韩歌曲初始化
		ArrayList<Song> popsongs =songImplement.querySongByStyle(2); //网络流行初始化
		ArrayList<Song> classicssongs = songImplement.querySongByStyle(1);	//经典音乐
		ArrayList<Song> membersongs = songImplement.querySongByMember();	//会员推荐
		ArrayList<Song> dancesongs = songImplement.querySongByDance();		//DJ/舞曲	
		ArrayList<Song> newpopsongs = songImplement.querySongByStyle(5);		//新媒体流行
		
		//System.out.println(songs.size());
		app.setAttribute("songs", songs);
		app.setAttribute("newoumeisongs", newoumeisongs);
		app.setAttribute("newrihansongs", newrihansongs);
		app.setAttribute("popsongs", popsongs);
		app.setAttribute("classicssongs", classicssongs);
		app.setAttribute("membersongs", membersongs);
		app.setAttribute("dancesongs", dancesongs);
		app.setAttribute("newpopsongs", newpopsongs);
		
		AlbumImplement albumImplement = new AlbumImplement();
		ArrayList<Album> albums = albumImplement.queryAlbum(1,"nice");//专辑排行榜
		ArrayList<Album> guoyuAlbums = albumImplement.queryAlbum(1,"guoyu");//国语专辑
		ArrayList<Album> oumeiAlbums = albumImplement.queryAlbum(3,"oumei");//欧美专辑
		ArrayList<Album> rihanAlbums = albumImplement.queryAlbum(2,"rihan");//日韩专辑
		app.setAttribute("albums", albums);
		app.setAttribute("guoyuAlbums", guoyuAlbums);
		app.setAttribute("oumeiAlbums", oumeiAlbums);
		app.setAttribute("rihanAlbums", rihanAlbums);
		
		//System.out.println(albums.size());
		//初始化歌手
		SingerImplement singerImplement = new SingerImplement();
		ArrayList<Singer> singers = singerImplement.querySinger(1);
		ArrayList<Singer> oumeiSingers = singerImplement.querySinger(3);	//欧美歌手
		ArrayList<Singer> rihanSingers = singerImplement.querySinger(2);	//日韩歌手
		app.setAttribute("singers", singers);
		app.setAttribute("oumeiSingers", oumeiSingers);
		app.setAttribute("rihanSingers", rihanSingers);
		//System.out.println(singers.size());
		//初始化新闻公告
		NoticeImplement noticeImplement = new NoticeImplement();
		ArrayList<Notice> noticeList = noticeImplement.queryNotice();
		app.setAttribute("noticeList", noticeList);
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
		
	}

}
