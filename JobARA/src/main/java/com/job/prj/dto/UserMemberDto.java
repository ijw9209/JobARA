package com.job.prj.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserMemberDto implements UserDetails{
	
	private int member_no_seq;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_birth;
	private String member_addr;
	private String member_tel;
	private String member_email;
	private String member_email_addr;
	private String member_enabled;
	private String member_gender;
	private int member_point;
	private Date member_regdate;
	private String member_role;
	private int member_buis_num;
	
	
	public int getMember_no_seq() {
		return member_no_seq;
	}
	public void setMember_no_seq(int member_no_seq) {
		this.member_no_seq = member_no_seq;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_email_addr() {
		return member_email_addr;
	}
	public void setMember_email_addr(String member_email_addr) {
		this.member_email_addr = member_email_addr;
	}
	public String getMember_enabled() {
		return member_enabled;
	}
	public void setMember_enabled(String member_enabled) {
		this.member_enabled = member_enabled;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	public Date getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}
	public String getMember_role() {
		return member_role;
	}
	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
	public int getMember_buis_num() {
		return member_buis_num;
	}
	public void setMember_buis_num(int member_buis_num) {
		this.member_buis_num = member_buis_num;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();		
		authorities.add(new SimpleGrantedAuthority(member_role));
		return authorities;
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return member_pw;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return member_id;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	

}
