package chanstory;

public class MemberDTO {
	private String personal_corporate, userid,password,name, address, tel,
				phone, email, region, return_name, return_bank, return_account, birthday; 
	public String getPersonal_corporate() {
		return personal_corporate;
	}
	public void setPersonal_corporate(String personal_corporate) {
		this.personal_corporate = personal_corporate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getReturn_name() {
		return return_name;
	}
	public void setReturn_name(String return_name) {
		this.return_name = return_name;
	}
	public String getReturn_bank() {
		return return_bank;
	}
	public void setReturn_bank(String return_bank) {
		this.return_bank = return_bank;
	}
	public String getReturn_account() {
		return return_account;
	}
	public void setReturn_account(String return_account) {
		this.return_account = return_account;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	@Override
	public String toString() {
		return "MemberDTO [personal_corporate=" + personal_corporate + ", userid=" + userid + ", password=" + password
				+ ", name=" + name + ", address=" + address + ", tel=" + tel + ", phone=" + phone + ", email=" + email
				+ ", region=" + region + ", return_name=" + return_name + ", return_bank=" + return_bank
				+ ", return_account=" + return_account + ", birthday=" + birthday + "]";
	}
	public MemberDTO(String personal_corporate, String userid, String password, String name, String address, String tel,
			String phone, String email, String region, String return_name, String return_bank, String return_account,
			String birthday) {
		this.personal_corporate = personal_corporate;
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.phone = phone;
		this.email = email;
		this.region = region;
		this.return_name = return_name;
		this.return_bank = return_bank;
		this.return_account = return_account;
		this.birthday = birthday;
	}
	public MemberDTO() {
	}
	
	

}
