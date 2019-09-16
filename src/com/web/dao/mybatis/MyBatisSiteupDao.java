package com.web.dao.mybatis;

import org.apache.ibatis.session.SqlSession;

import com.web.dao.SiteupDao;
import com.web.entities.Siteup;

public class MyBatisSiteupDao implements SiteupDao{
   private SqlSession sqlSession;

   public void setSqlSession(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
   }
   @Override
   public Siteup get(String code, String memberId) {
      SiteupDao siteupDao = sqlSession.getMapper(SiteupDao.class);
      Siteup result = siteupDao.get(code,memberId);
      
      return result;
   }
   @Override
   public int insert(Siteup siteup) {
      SiteupDao siteupDao = sqlSession.getMapper(SiteupDao.class);
      int result = siteupDao.insert(siteup);
      
      return result;
   }
   @Override
   public int delete(String code, String memberId) {
      SiteupDao siteupDao = sqlSession.getMapper(SiteupDao.class);
      int result = siteupDao.delete(code, memberId);
      
      return result;
   }
}