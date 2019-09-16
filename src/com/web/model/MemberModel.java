package com.web.model;

public class MemberModel {
   String memberId;
   String pwd;
   String nickname;
   String rolename;
   String regdate;
   boolean defaultRole;
   boolean enable;
   
   public String getMemberId() {
      return memberId;
   }
   public void setMemberId(String memberId) {
      this.memberId = memberId;
   }
   public String getRegdate() {
      return regdate;
   }
   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }
   public boolean isEnable() {
      return enable;
   }
   public void setEnable(boolean enable) {
      this.enable = enable;
   }
   public String getId() {
      return memberId;
   }
   public void setId(String memberId) {
      this.memberId = memberId;
   }
   public String getPwd() {
      return pwd;
   }
   public void setPwd(String pwd) {
      this.pwd = pwd;
   }
   public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   public String getRolename() {
      return rolename;
   }
   public void setRolename(String rolename) {
      this.rolename = rolename;
   }
   public boolean isDefaultRole() {
      return defaultRole;
   }
   public void setDefaultRole(boolean defaultRole) {
      this.defaultRole = defaultRole;
   }
   
}