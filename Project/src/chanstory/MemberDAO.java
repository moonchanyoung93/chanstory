package chanstory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import config.DB;


public class MemberDAO {
	//로그인
	public String login(MemberDTO dto) {
		String result="";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DB.getConn();
			String sql=" select * from chanstory where userid=? and password=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPassword());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getString("name")+"님 환영합니다.";
			}else {
				result="아이디 또는 비밀번호가 존재하지 않습니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	//회원가입
	public void insert(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=DB.getConn();
			StringBuilder sql=new StringBuilder();
			sql.append(" insert into chanstory ");
			sql.append(" (personal_corporate, userid, password, name, address, tel, phone, email, birthday, region, return_name, return_bank, return_account) values ");
			sql.append(" (?,?,?,?,?,?,?,?,?,?,?,?,?) ");
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPersonal_corporate());
			pstmt.setString(2, dto.getUserid());
			pstmt.setString(3, dto.getPassword());
			pstmt.setString(4, dto.getName());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getTel());
			pstmt.setString(7, dto.getPhone());
			pstmt.setString(8, dto.getEmail());
			pstmt.setString(9,dto.getBirthday());
			pstmt.setString(10, dto.getRegion());
			pstmt.setString(11, dto.getReturn_name());
			pstmt.setString(12, dto.getReturn_bank());
			pstmt.setString(13, dto.getReturn_account());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
	}

}
}
