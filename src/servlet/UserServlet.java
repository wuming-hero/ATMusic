package servlet;

import implement.UserImplement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.Member;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
		HttpSession session = request.getSession();
//		response.setContentType("text/html;utf-8");
		response.setContentType("application/json;charset=utf-8");//传送json格式的数据
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		String email =request.getParameter("useremail");
		UserImplement userImplement = new UserImplement();
		boolean flag = false;
		if(email!=null && username!=null && userpass!=null){
			flag = userImplement.save(username,userpass,email);
			if(flag){
				response.sendRedirect("/ATMusic/index.jsp");
			}
			
		}else{
			if(username!=null && userpass!=null){
				ArrayList<Member> memberList = userImplement.loginCheck(username,userpass);
				if(memberList!=null && memberList.size()>0){
					session.setAttribute("user", memberList.get(0));
					session.setAttribute("userName", memberList.get(0).getmName());
					flag = true;
					out.print("{\"success\":\""+flag+"\"}");
					out.flush();
					out.close();
				}else{
					out.print("{\"success\":\""+flag+"\"}");
					out.flush();
					out.close();
				}
			}else{
				
				session.removeAttribute("user");
				session.removeAttribute("userName");
	//			session.invalidate();
				flag = true;
				out.print("{\"success\":\""+flag+"\"}");
				out.flush();
				out.close();
			}	
		}
	}

}
