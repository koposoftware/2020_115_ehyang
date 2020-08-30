package hana.ti.member.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

public class MemberVO {
	
	@Pattern(regexp = "^[A-Za-z0-9]*$", message = "특수기호는 사용할 수 없습니다.")
	@Length(min = 4, max = 9, message="id는 2글자 이상 9글자 이하입니다.")
	@NotEmpty(message="id를 입력헤주세요.")
	private String id;
	@Length(min = 4, max = 10, message="비밀번호는 4글자 이상 10글자 이하입니다.")
	@NotEmpty(message="비밀번호를 입력헤주세요.")
	private String password;
	private String name;
	private String tel;
	private String post;
	private String addr;
	private String type;
	private String regDate;
	private String account_num;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", tel=" + tel + ", post=" + post
				+ ", addr=" + addr + ", type=" + type + ", regDate=" + regDate + "]";
	}
	
}
