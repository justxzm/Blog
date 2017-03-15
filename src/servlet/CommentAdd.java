package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.ConnDb;

/**
 * Servlet implementation class CommentAdd
 */
@WebServlet("/CommentAdd")
public class CommentAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=new String(request.getParameter("id").getBytes("iso-8859-1"),"utf-8");
		int id2=Integer.parseInt(id);
		String comment=new String(request.getParameter("comment").getBytes("iso-8859-1"),"utf-8");
		ConnDb cdb=new ConnDb();
		Date day=new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=df.format(day);
		cdb.insertComment(date, comment, id2);
		response.sendRedirect("front_develop/articleContent.jsp?id="+id);	
	}

}
