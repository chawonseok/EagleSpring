package com.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.dao.MemberDao;
import com.web.entities.Member;
import com.web.model.MemberModel;

public class MyBatisMemberDao implements MemberDao {

   private SqlSession sqlSession;

   public void setSqlSession(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
   }

   @Override
   public Member get(String id) {
      MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
      Member member = memberDao.get(id);

      return member;
   }

   @Override
   public int insert(Member member) {
      MemberDao memberDao = sqlSession.getMapper(MemberDao.class);

      int result = memberDao.insert(member);

      return result;
   }

   @Override
   public List<MemberModel> getList() {
      MemberDao memberDao = sqlSession.getMapper(MemberDao.class);

      List<MemberModel> list = memberDao.getList();

      return list;
   }

   @Override
   public int change(Member member) {
      MemberDao memberDao = sqlSession.getMapper(MemberDao.class);

      int result = memberDao.change(member);

      return result;
   }

   @Override
   public int update(Member member) {
      MemberDao memberDao = sqlSession.getMapper(MemberDao.class);

      int result = memberDao.update(member);
      return result;
   }

   @Override
   public int getCount(String field, String query) {
      MemberDao memberDao = sqlSession.getMapper(MemberDao.class);

      int count = memberDao.getCount(field, query);
      return count;
   }

   @Override
      public int deleteMember(String memberId) {
         MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
         int result = memberDao.deleteMember(memberId);

         return result;
      }

   /*@Override
   public List<Member> getListDel(String memberId) {
      MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
      List<Member> list = memberDao.getListDel(memberId);

      return list;
   }*/
}