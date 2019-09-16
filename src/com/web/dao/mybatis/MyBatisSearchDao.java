package com.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.dao.SearchDao;
import com.web.entities.Site;

public class MyBatisSearchDao implements SearchDao {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Site> getList(String query) {

		SearchDao searchDao = sqlSession.getMapper(SearchDao.class);

		List<Site> result = searchDao.getList(query);

		return result;
	}
}
