package com.web.dao.mybatis;

import org.apache.ibatis.session.SqlSession;
import com.web.dao.MemberRoleDao;
import com.web.entities.MemberRole;

public class MyBatisMemberRoleDao implements MemberRoleDao {

   
   private SqlSession sqlSession;
   
   public void setSqlSession(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
   }

   @Override
   public MemberRole getDefaultRole(String memberId) {
      MemberRoleDao memberRoleDao = sqlSession.getMapper(MemberRoleDao.class);
      MemberRole memberRole;
      
      memberRole = memberRoleDao.getDefaultRole(memberId);
   
      return memberRole;
   }

   @Override
   public int insert(MemberRole file) {
      
      MemberRoleDao memberRoleDao = sqlSession.getMapper(MemberRoleDao.class);
      int result = memberRoleDao.insert(file);
      return result;
   }
   

   @Override
   public int update(MemberRole file) {
      MemberRoleDao memberRoleDao = sqlSession.getMapper(MemberRoleDao.class);
      int result = memberRoleDao.update(file);
      return result;
   }


   @Override
   public int delete(String roleName, String memberId) {
      MemberRoleDao memberRoleDao = sqlSession.getMapper(MemberRoleDao.class);
      int result = memberRoleDao.delete(roleName, memberId);
      return result;
   }

}