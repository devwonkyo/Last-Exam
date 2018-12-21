package service;

import java.sql.Connection;
import java.sql.SQLException;

import connection.ConnectionProvider;
import jdbc.JdbcUtil;
import member.Member;
import member.MemberDAO;

public class WriteMemberService {
	static WriteMemberService instance = new WriteMemberService();
	
	public static WriteMemberService getInstance() {
		return instance;
	}

	public void register(Member member) throws SQLException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MemberDAO memberDAO = new MemberDAO();
			memberDAO.register(conn,member);
			
		}finally {
			JdbcUtil.close(conn);
		}
	}
	
}
