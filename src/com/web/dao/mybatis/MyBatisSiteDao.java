package com.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.dao.NoticeDao;
import com.web.dao.SiteDao;
import com.web.entities.Site;

public class MyBatisSiteDao implements SiteDao {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Site> getList() {
		SiteDao siteDao = sqlSession.getMapper(SiteDao.class);

		return siteDao.getList();
	}

	@Override
	public Site get(String code) {
		SiteDao siteDao = sqlSession.getMapper(SiteDao.class);

		Site result = siteDao.get(code);

		return result;
	}

	@Override
	public int addBookCount(Site site) {
		SiteDao siteDao = sqlSession.getMapper(SiteDao.class);

		int result = siteDao.addBookCount(site);

		return result;
	}

	@Override
	public int subBookCount(Site site) {
		SiteDao siteDao = sqlSession.getMapper(SiteDao.class);

		int result = siteDao.subBookCount(site);

		return result;
	}

	@Override
	public int insert(Site site) {
		SiteDao siteDao = sqlSession.getMapper(SiteDao.class);

		int result = siteDao.insert(site);

		return result;
	}

	@Override
	public int update(Site site) {
		SiteDao siteDao = sqlSession.getMapper(SiteDao.class);

		int result = siteDao.update(site);

		return result;
	}

	@Override
	public int delete(String code) {
		SiteDao siteDao = sqlSession.getMapper(SiteDao.class);

		int result = siteDao.delete(code);

		return result;
	}

	@Override
	public int addSiteUp(String code) {
		SiteDao siteDao = sqlSession.getMapper(SiteDao.class);
		int result = siteDao.addSiteUp(code);
		return result;
	}

	@Override
	public int subSiteUp(String code) {
		SiteDao siteDao = sqlSession.getMapper(SiteDao.class);
		int result = siteDao.subSiteUp(code);
		return result;
	}

}
