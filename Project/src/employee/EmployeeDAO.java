package employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.DB;

public class EmployeeDAO {

	public List<EmployeeDTO> employeeList(){
		List<EmployeeDTO> items=new ArrayList<>(); 
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DB.getConn();
			String sql=" select * from mac order by join_date ";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				EmployeeDTO dto=new EmployeeDTO();
				dto.setNo(rs.getString("no"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setHp(rs.getString("hp"));
				dto.setAddress(rs.getString("address"));
				dto.setTeam(rs.getString("team"));
				dto.setJoin_date(rs.getString("join_date"));
				items.add(dto);
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

		return items;
	}//end list

	
	public void insert(EmployeeDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=DB.getConn();
			StringBuilder sql=new StringBuilder();
			sql.append(" insert into mac ");
			sql.append(" (no, password, name, gender, hp, address, team, join_date) values ");
			sql.append(" (?, ?, ?, ?, ?, ?, ?, ?) ");
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getNo());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getHp());
			pstmt.setString(6, dto.getAddress());
			pstmt.setString(7, dto.getTeam());
			pstmt.setString(8, dto.getJoin_date());
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
	}//end insert
	
	
	
}
