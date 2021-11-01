package DTO;

public class UserDTO {
	
	String email;
	String pwd;
	String name;
	String birthday;
	String job;
	String sex;
	String marriage;
	String pic;
	String joindate;
	String admin_yn;
	
	public UserDTO(String email, String pwd, String name, String birthday, String sex, String marriage) {
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.birthday = birthday;
		this.sex = sex;
		this.marriage = marriage;
	}
	
	
	public UserDTO(String email, String pwd, String name, String birthday, String job, String sex, String marriage,
			String pic, String joindate, String admin_yn) {
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.birthday = birthday;
		this.job = job;
		this.sex = sex;
		this.marriage = marriage;
		this.pic = pic;
		this.joindate = joindate;
		this.admin_yn = admin_yn;
	}



	public String getEmail() {
		return email;
	}

	public String getPwd() {
		return pwd;
	}

	public String getName() {
		return name;
	}

	public String getBirthday() {
		return birthday;
	}

	public String getJob() {
		return job;
	}

	public String getSex() {
		return sex;
	}

	public String getMarriage() {
		return marriage;
	}

	public String getPic() {
		return pic;
	}

	public String getJoindate() {
		return joindate;
	}

	public String getAdmin_yn() {
		return admin_yn;
	}

	
}
