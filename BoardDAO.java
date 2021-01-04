package board.mvc.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import mvc.domain.Board;

import static board.mvc.model.BoardSQL.*;

class BoardDAO {
	private DataSource ds;
	
	BoardDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {}
	}
	ArrayList<Board> content(int seq) {
		ArrayList<Board> dtos = new ArrayList<Board>();
		String sql = CONTENT;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String writer = rs.getString(2);
				String email = rs.getString(3);
				String subject = rs.getString(4);
				String content = rs.getString(5);
				Date rdate = rs.getDate(6);
				dtos.add(new Board(seq,writer,email,subject,content,rdate));
			}
		}catch(SQLException se) {
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException sse) {}
		}
		return dtos;
	}
	
	ArrayList<Board> list(int cp,int ps){
		ArrayList<Board> dtos = new ArrayList<Board>();
		String sql = LIST;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			int r1 = (cp-1)*ps;
			int r2 = cp*ps;
			pstmt.setInt(1, r1);
			pstmt.setInt(2, r2);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int rownum = rs.getInt(1); 
				int seq = rs.getInt(2);
				String writer = rs.getString(3);
				String email = rs.getString(4);
				String subject = rs.getString(5);
				String content = rs.getString(6);
				Date rdate = rs.getDate(7);
				dtos.add(new Board(seq,writer,email,subject,content,rdate));
			}
		}catch(SQLException se) {
			System.out.println("se : "+se);
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch(SQLException sse) {}
		}
		return dtos;
	}
	boolean del(int seq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = DELETE;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			int i =pstmt.executeUpdate();
			if(i>0) return true;
			else return false;
		}catch(SQLException se) {
			return false;
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch(SQLException sse) {}
		}
	}
	void insert(Board dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = INSERT;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.executeUpdate();
		}catch(SQLException se) {
			
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch(SQLException sse) {}
		}
	}
	void DBupdate(Board dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = UPDATE;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getSeq());
			pstmt.executeUpdate();
		}catch(SQLException se) {
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch(SQLException sse) {}
		}
	}
	long totalCount() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = TOTAL;
		long count = -1;
		try {
			con=ds.getConnection();
			stmt=con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			count = rs.getLong(1);
		}catch(SQLException se) {
			return -1;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(con!=null) con.close();
			}catch(SQLException sse) {}
		}
		return count;
	}
	
}
