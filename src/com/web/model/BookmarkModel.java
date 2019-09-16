package com.web.model;

import java.util.Date;

import com.web.entities.Bookmark;


public class BookmarkModel extends Bookmark{
	private String site_code;
	private String member_ID;
	private String name;
	private String address;
	private String category;
	private Date regdate;
	private String bookcount;
	private String good;
	private boolean kind;
	private String comment;
	
	public String getSite_code() {
		return site_code;
	}
	public void setSite_code(String site_code) {
		this.site_code = site_code;
	}
	public String getGood() {
		return good;
	}
	public void setGood(String good) {
		this.good = good;
	}
	public boolean isKind() {
		return kind;
	}
	public void setKind(boolean kind) {
		this.kind = kind;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getBookcount() {
		return bookcount;
	}
	public void setBookcount(String bookcount) {
		this.bookcount = bookcount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getMember_ID() {
		return member_ID;
	}
	public void setMember_ID(String member_ID) {
		this.member_ID = member_ID;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
