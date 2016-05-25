package servlet;

import implement.CommentImplement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.Comment;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
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
		PrintWriter out = response.getWriter();
		String flag = request.getParameter("flag");
		String id = request.getParameter("singerId");
		String action = request.getParameter("action");
		String mName = request.getParameter("session");
		String content = request.getParameter("commentContent");
		CommentImplement commentImplement = new CommentImplement();
		if("query".equals(action)){
			if("singer".equals(flag)){
				if(id!=null && id.length()>0){
					int singerId = Integer.parseInt(id);
					ArrayList<Comment> commentList = commentImplement.queryComment(singerId,"singer");
					request.setAttribute("commentList", commentList);
					request.setAttribute("singerId", singerId);
					request.getRequestDispatcher("/comment.jsp").forward(request, response);
				}
			}else if("band".equals(flag)){
				if(id!=null && id.length()>0){
					int bandId = Integer.parseInt(id);
					ArrayList<Comment> commentList = commentImplement.queryComment(bandId,"band");
					request.setAttribute("commentList", commentList);
					request.setAttribute("bandId", bandId);
					request.getRequestDispatcher("/comment.jsp").forward(request, response);
				}
			}
		}else if("save".equals(action)){
			if(id!=null && id.length()>0){
				int singerId = Integer.parseInt(id);
				commentImplement.save(mName,content,singerId,flag);
				if("singer".equals(flag)){
					ArrayList<Comment> commentList = commentImplement.queryComment(singerId,"singer");
					request.setAttribute("commentList", commentList);
					request.setAttribute("singerId", singerId);
					request.getRequestDispatcher("/comment.jsp").forward(request, response);
				}else{
					ArrayList<Comment> commentList = commentImplement.queryComment(singerId,"band");
					request.setAttribute("commentList", commentList);
					request.setAttribute("bandId", singerId);
					request.getRequestDispatcher("/comment.jsp").forward(request, response);
				
				}
			}
		}else if("queryAll".equals(action)){
			ArrayList<Comment> commentList = commentImplement.queryAllComment();
			request.setAttribute("commentList", commentList);
			request.getRequestDispatcher("admin/commentList.jsp").forward(request, response);
		}else if("del".equals(action)){
			int commentId = Integer.parseInt(request.getParameter("commentId"));
			int num = commentImplement.del(commentId);
			if(num>0){
				out.print("{\"success\":\"true\"}");
			}
			
		}
		
	}

}
