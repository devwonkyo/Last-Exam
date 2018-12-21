package service;

import java.sql.Connection;
import connection.ConnectionProvider;
import jdbc.JdbcUtil;
import member.MemberDAO;

public class DeleteMemberService {
	static DeleteMemberService instance = new DeleteMemberService();
	
	public static DeleteMemberService getInstance() {
		return instance;
	}
	
	public void delete(String memberID)throws Exception {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MemberDAO memberDAO = new MemberDAO();
			memberDAO.delete(conn,memberID);
		}finally {
			JdbcUtil.close(conn);
		}
	}

}
