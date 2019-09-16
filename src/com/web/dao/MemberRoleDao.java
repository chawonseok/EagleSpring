package com.web.dao;

import com.web.entities.MemberRole;

public interface MemberRoleDao {
   //List<MemberRole> getList(String noticeCode);
   MemberRole getDefaultRole(String memberId);
   int insert(MemberRole file);
   int update(MemberRole file);
   int delete(String roleName, String memberId);
}