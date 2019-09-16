package com.web.dao;

import java.util.List;

import com.web.entities.Member;
import com.web.model.MemberModel;

public interface MemberDao {
   
   Member get(String id);
   List<MemberModel> getList();
   /*List<Member> getListDel(String memberId);*/
   int insert(Member member);
   int change(Member member);
   int update(Member member);
   int getCount(String field, String query);
   int deleteMember(String memberId);
}