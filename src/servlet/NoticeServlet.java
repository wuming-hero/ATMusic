package servlet;

import implement.NoticeImplement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Notice;

/**
 * Servlet implementation class NoticeServlet
 */
@WebServlet("/NoticeServlet")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeServlet() {
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
		NoticeImplement noticeImplement = new NoticeImplement();
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		String id = request.getParameter("noticeId");
		String mName = request.getParameter("userName");
		String noticeName = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		if("queryById".equals(action)){
			if(id!="" && id!=null){
				int noticeId = Integer.parseInt(id);
				Notice noticeDetail = noticeImplement.queryNoticeById(noticeId);
				request.setAttribute("noticeDetail", noticeDetail);
				request.getRequestDispatcher("/noticeShow.jsp").forward(request, response);
			}
		}else if("save".equals(action)){
			//保存后查询出来
			int num = noticeImplement.saveNotice(noticeName,noticeContent,mName);
			ArrayList<Notice> noticeList = noticeImplement.queryAllNotice();
			request.setAttribute("noticeList", noticeList);
			request.getRequestDispatcher("/admin/noticeList.jsp").forward(request, response);
		}else if("queryAll".equals(action)){
			ArrayList<Notice> noticeList = noticeImplement.queryAllNotice();
			request.setAttribute("noticeList", noticeList);
			request.getRequestDispatcher("/admin/noticeList.jsp").forward(request, response);
		}else if("delete".equals(action)){
			if(id!="" && id!=null){
				int noticeId = Integer.parseInt(id);
				int num = noticeImplement.delete(noticeId);
				if(num>0){
					out.print("{\"success\":\"true\"}");
				}else{
					out.print("{\"success\":\"false\"}");
				}
			}
		}
	}

}
