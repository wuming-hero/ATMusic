package servlet;

import implement.UploadImplement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import pojo.Band;
import pojo.Singer;
import pojo.Song;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
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
		//contextPath=http://localhost:8080/ATMusic/
		String contextPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath()+"/"; 
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		ServletConfig config = this.getServletConfig();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddhhmmssSSSS");
		// 新建一个SmartUpload对象
		SmartUpload su = new SmartUpload();
		// 上传初始化
		su.initialize(config,request,response);
		// 设定上传限制
		// 1.限制每个上传文件的最大长度。10MB
//		su.setMaxFileSize(10485760);
		// 2.限制总上传数据的长度。
		// su.setTotalMaxFileSize(20000);
		// 3.设定允许上传的文件（通过扩展名限制）。
	    su.setAllowedFilesList("mp3,MP3,wav,WAV,wma,WMA,aac,AAC,mid,MID");
		// 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
		String extError = "";
		String extErrorPage = "extErrorPage.jsp";
		try {
			su.setDeniedFilesList("exe,bat,jsp,htm,html,,");
			su.upload();
		} catch (Exception e) {
			extError = "出错了,您所上传的文件格式不被支持,请上传正确格式的音乐文件";
			request.setAttribute("extErrorTip", extError);
			request.getRequestDispatcher(extErrorPage).forward(request, response);
		}
		// 所有参数都被封装到su对象里
		// 逐一提取上传文件信息，同时可保存文件。
		for (int i=0;i<su.getFiles().getCount();i++) {
			//type=file的文件被封装在su里.
			com.jspsmart.upload.File file = su.getFiles().getFile(i);
			if(file.getSize()>0){
				String newName = df.format(new Date()) + "." + file.getFileExt();
				try {
					file.saveAs("/song/upload/"+newName);
				} catch (SmartUploadException e) {
					e.printStackTrace();
				}
				// 若文件不存在则继续
				if (file.isMissing()) continue;
				String filePath = "song/upload/" + newName;
				//保存到数据库
				String singerName = su.getRequest().getParameter("singer");
				String sMark = su.getRequest().getParameter("sMark");
				String sortId = su.getRequest().getParameter("sort");
				String styleId = su.getRequest().getParameter("style");
				String mId = su.getRequest().getParameter("mId");
				if(sMark.equals("band")){
					//如果此音乐是乐队演唱,将该乐队的信息存入数据库,并取它的bandId作为song表的外键.
					Band band = new Band();
					band.setBandName(singerName);
					band.setSortId(Integer.parseInt(sortId));
					UploadImplement uploadImplement = new UploadImplement();
					uploadImplement.save(band);
					ArrayList<Band> bandList = uploadImplement.search(band);
					int bandId = 0 ;
					if(!bandList.isEmpty()){
						bandId = bandList.get(0).getBandId();
					}
					//将音乐信息存入数据库
					Song song = new Song();
					song.setSongName(file.getFileName()); //音乐文件名中不要有空格
					song.setBandId(bandId);
					song.setSongPath(filePath);
					song.setSortId(Integer.parseInt(sortId));
					song.setStyleId(Integer.parseInt(styleId));
					song.setmId(Integer.parseInt(mId));
					boolean flag = uploadImplement.saveSong(song);
					if(flag) { //上传成功!
						request.setAttribute("tips", "恭喜您,上传成功!");
						request.getRequestDispatcher("/upload.jsp").forward(request, response);
					}else {  //该音乐已被其它会员抢先上传,请选择其它音乐上传!
						request.setAttribute("tips", "该音乐已被其它会员抢先上传,请选择其它音乐上传!");
						request.getRequestDispatcher("/upload.jsp").forward(request, response);
					}
				}else {
					//如果此音乐是某位歌手演唱,将该歌手的信息存入数据库,并取它的singerId作为song表的外键.
					Singer singer = new Singer();
					singer.setSingerName(singerName);
					singer.setGender(sMark);
					singer.setSortId(Integer.parseInt(sortId));
					UploadImplement uploadImplement = new UploadImplement();
					uploadImplement.save(singer);
					ArrayList<Singer> singerList = uploadImplement.searchSinger(singer);
					int singerId = 0 ;
					if(!singerList.isEmpty()){
						singerId = singerList.get(0).getSingerId();
					}
					//将音乐信息存入数据库
					Song song = new Song();
					song.setSongName(file.getFileName()); //音乐文件名中不要有空格
					song.setSingerId(singerId);
					song.setSongPath(filePath);
					song.setSortId(Integer.parseInt(sortId));
					song.setStyleId(Integer.parseInt(styleId));
					song.setmId(Integer.parseInt(mId));
					boolean flag = uploadImplement.saveSong(song);
					if(flag) {
						//上传成功!
						request.setAttribute("tips", "恭喜您,上传成功!");
						request.getRequestDispatcher("/upload.jsp").forward(request, response);
					}else {
						//该音乐已被其它会员抢先上传,请选择其它音乐上传!
						request.setAttribute("tips", "该音乐已被其它会员抢先上传,请选择其它音乐上传!");
						request.getRequestDispatcher("/upload.jsp").forward(request, response);
					}
				}

			}
		}
	}

}
