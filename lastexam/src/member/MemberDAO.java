package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

	public void register(Connection conn, Member member) throws SQLException {
		// TODO Auto-generated method stub
		String sql ="insert member(id,name,tel,regdate)  values (?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getId());
		pstmt.setString(2, member.getName());
		pstmt.setString(3, member.getTel());
		pstmt.setTimestamp(4, member.getRegdate());
		pstmt.executeUpdate();
	}

	public void update(Connection conn, Member member) throws SQLException {
		// TODO Auto-generated method stub
		String sql ="UPDATE member SET name =? ,tel=? ,regdate =?  WHERE id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getName());
		pstmt.setString(2, member.getTel());
		pstmt.setTimestamp(3, member.getRegdate());
		pstmt.setString(4, member.getId());
		pstmt.executeUpdate();
	}

	public Member findByid(Connection conn, String memberID) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from member where id =?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberID);
		ResultSet rs =pstmt.executeQuery();
		rs.next();
		Member member = new Member();
		member.setId(rs.getString("id"));
		member.setName(rs.getString("name"));
		member.setTel(rs.getString("tel"));
		member.setRegdate(rs.getTimestamp("regdate"));
		
		return member;
	}

	public List<Member> findByName(Connection conn, String memberName) throws SQLException {
		// TODO Auto-generated method stub
		String sql ="select * from member where 	name = ?";
		PreparedStatement pstmt =conn.prepareStatement(sql);
		pstmt.setString(1, memberName);
		ResultSet rs = pstmt.executeQuery();
		List<Member> memberList =new ArrayList<Member>();
		while(rs.next()) {
			Member member = new Member();
			member.setId(rs.getString("id"));
			member.setName(rs.getString("name"));
			member.setTel(rs.getString("tel"));
			member.setRegdate(rs.getTimestamp("regdate"));
			memberList.add(member);
		}
		return memberList;
	}

	public List<Member> findAll(Connection conn,int pageNumber,int PAGE_SIZE) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from member LIMIT ?,?";
/*		Statement stmt = conn.createStatement();
		ResultSet rs =stmt.executeQuery(sql);
		List<Member> memberList  = new ArrayList<Member>();
*/		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int firstRow=(pageNumber-1)*PAGE_SIZE;
		 pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,firstRow);
		pstmt.setInt(2,PAGE_SIZE);
		List<Member> memberList = new ArrayList<Member>();
		rs=pstmt.executeQuery();
		while(rs.next()) {
			Member member = new Member();
			member.setId(rs.getString("id"));
			member.setName(rs.getString("name"));
			member.setTel(rs.getString("tel"));
			member.setRegdate(rs.getTimestamp("regdate"));
			memberList.add(member);
	}
		return memberList;
	
	}

	public void delete(Connection conn, String memberID) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "delete from member where id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberID);
		pstmt.executeUpdate();
	}

	public float count(Connection conn) throws SQLException {
		// TODO Auto-generated method stub
		String sql ="SELECT COUNT(*) FROM member";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		rs.next();
		return rs.getInt(1);

	}

	

}
