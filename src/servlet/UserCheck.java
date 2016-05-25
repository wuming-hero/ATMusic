package servlet;

import implement.UserImplement;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserCheck
 */
@WebServlet("/UserCheck")
public class UserCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCheck() {
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
		UserImplement userImplement = new UserImplement();
		PrintWriter out = response.getWriter();
		String flag = request.getParameter("flag");
		if("name".equals(flag)){
			String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
			if(name!=null && name.length()>0){
				boolean success = userImplement.checkUser(name);
				out.print("{\"success\":\""+success+"\"}");
			}
		}else{
			String email = request.getParameter("email");
			boolean success = userImplement.checkEmail(email);
			out.print("{\"success\":\""+success+"\"}");
			
		}
	}

}
