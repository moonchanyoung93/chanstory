package employee;

import java.sql.Date;

public class EmployeeDTO {
	String no, password, name, gender, hp, address, team, join_date ;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "EmployeeDTO [no=" + no + ", password=" + password + ", name=" + name + ", gender=" + gender + ", hp="
				+ hp + ", address=" + address + ", team=" + team + ", join_date=" + join_date + "]";
	}
	public EmployeeDTO(String no, String password, String name, String gender, String hp, String address, String team,
			String join_date) {
		this.no = no;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.hp = hp;
		this.address = address;
		this.team = team;
		this.join_date = join_date;
	}
	public EmployeeDTO() {
	}
	
	

	
}
