package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnDb {
	private String getDriver="com.mysql.jdbc.Driver";
	private String getConnection="jdbc:mysql://localhost:3306/blog";
	private String getName="";
	private String getPwd="";
	static Connection con;
	static PreparedStatement preStat;
	static ResultSet rs=null;
	
	public ConnDb(){
		try {
			Class.forName(getDriver);
			con=DriverManager.getConnection(getConnection,getName,getPwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
	}
	public ResultSet getSelect(String sql){
		try {
			preStat=con.prepareStatement(sql);
			rs=preStat.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet getLoginSelect(String username,String password){
		try {
			String sql="select * from admin where username=? and password=?";
			preStat=con.prepareStatement(sql);
			preStat.setString(1, username);
			preStat.setString(2, password);
			rs=preStat.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public void updateAdmin(String oldUserName,String userName,String password,String email){
		try {
			preStat=con.prepareStatement("update admin set userName=?,password=?,email=? where userName='"+oldUserName+"'");
			preStat.setString(1, userName );
			preStat.setString(2, password );
			preStat.setString(3, email);
			preStat.executeUpdate();
			closeAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateArticle(String id,String date,String title,String author,String content){
		try {
			preStat=con.prepareStatement("update article set newDate=?,title=?,author=?,content=? where id='"+id+"'");
			preStat.setString(1, date );
			preStat.setString(2, title );
			preStat.setString(3, author);
			preStat.setString(4, content);
			preStat.executeUpdate();
			closeAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void insertArticle(String date,String title,String author,String content){
		try {
			preStat=con.prepareStatement("insert into article(newDate,title,author,content,commentNumber) values(?,?,?,?,?)");
			preStat.setString(1, date );
			preStat.setString(2, title );
			preStat.setString(3, author);
			preStat.setString(4, content);
			preStat.setInt(5, 0);
			preStat.executeUpdate();
			closeAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void insertComment(String date,String comment,int articleId){
		try {
			preStat=con.prepareStatement("insert into comment(date,content,articleId) values(?,?,?)");
			preStat.setString(1, date );
			preStat.setString(2, comment );
			preStat.setInt(3, articleId);
			preStat.executeUpdate();
			addArticleCommentNumber(articleId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void addArticleCommentNumber(int articleId){
		rs=getSelect("select * from article where id='"+articleId+"'");
		try {
			int commentNumber=0;
			if(rs.next()){
				commentNumber=rs.getInt("commentNumber");
			}
			int newCommentNumber=commentNumber+1;
			preStat = con.prepareStatement("update article set commentNumber=? where id='"+articleId+"'");
			preStat.setInt(1, newCommentNumber);
			preStat.executeUpdate();
			closeAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void delete(String id){
		try {
			preStat = con.prepareStatement("delete from article where id='"+id+"'");
			preStat.executeUpdate();
			preStat = con.prepareStatement("delete from comment where articleId='"+id+"'");
			preStat.executeUpdate();
			closeAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void deleteComment(String id){
		try {
			rs=getSelect("select * from comment where id='"+id+"'");
			int articleId=0;
			if(rs.next()){
				articleId=rs.getInt("articleId");
			}
			reduceArticleCommentNumber(articleId);
			preStat = con.prepareStatement("delete from comment where id='"+id+"'");
			preStat.executeUpdate();
			closeAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void reduceArticleCommentNumber(int articleId){
		rs=getSelect("select * from article where id='"+articleId+"'");
		try {
			int commentNumber=0;
			if(rs.next()){
				commentNumber=rs.getInt("commentNumber");
			}
			int newCommentNumber=commentNumber-1;
			preStat = con.prepareStatement("update article set commentNumber=? where id='"+articleId+"'");
			preStat.setInt(1, newCommentNumber);
			preStat.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void closeAll(){
		try {
			if(rs!=null){
				rs.close();
			}
			if(preStat.isClosed()==false){
				preStat.close();
			}
			if(con.isClosed()==false){
				con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
