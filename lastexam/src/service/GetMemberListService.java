package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectionProvider;
import jdbc.JdbcUtil;
import member.Member;
import member.MemberDAO;

public class GetMemberListService {
	final static int PAGE_SIZE =10;
	static GetMemberListService instance = new GetMemberListService();
	
	public static GetMemberListService getInstance() {
		return instance;
	}
	
	public void update(Member member) throws SQLException {
		Connection conn = null;
		try {
			conn=ConnectionProvider.getConnection();
			MemberDAO memberDAO =new MemberDAO();
			memberDAO.update(conn,member);
			
		}finally {
			JdbcUtil.close(conn);
		}
	}
	
	
	public Member findByid(String memberID) throws SQLException {
		Connection conn = null;
		try {
			conn=ConnectionProvider.getConnection();
			MemberDAO memberDAO =new MemberDAO();
			return memberDAO.findByid(conn,memberID);
			
		}finally {
			JdbcUtil.close(conn);
		}
	}
	
	public List<Member> findByName(String memberName) throws Exception{
		Connection conn =null;
		try {
			conn = ConnectionProvider.getConnection();
			MemberDAO memberDAO = new MemberDAO();
			return memberDAO.findByName(conn,memberName);
			
		}finally {
			JdbcUtil.close(conn);
		}
	}
	
	public List<Integer> getPagination() throws Exception {
		MemberDAO	memberDao= new MemberDAO();
		Connection conn =null;
		try{conn=ConnectionProvider.getConnection();
		int pages=((float)memberDao.count(conn)/PAGE_SIZE)>(int)(memberDao.count(conn)/PAGE_SIZE)?(int)(memberDao.count(conn)/PAGE_SIZE)+1:(int)(memberDao.count(conn)/PAGE_SIZE);
		List<Integer> pagination=new ArrayList<Integer>();
		for(int i=1;i<=pages;i++) {
			pagination.add(i);
		}
		return pagination;}finally {JdbcUtil.close(conn);}
	}
	
	public List<Member> findAll(int pageNumber) throws SQLException{
		Connection conn = null;
		try {
			conn=ConnectionProvider.getConnection();
			MemberDAO memberDAO = new MemberDAO();
			return memberDAO.findAll(conn,pageNumber,PAGE_SIZE);
		}finally {
			JdbcUtil.close(conn);
		}
	}
}