package com.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.dao.NoticeFileDao;
import com.web.entities.NoticeFile;

public class MyBatisNoticeFileDao implements NoticeFileDao {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<NoticeFile> getList(String NoticeCode) {
		NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);

		List<NoticeFile> list = noticeFileDao.getList(NoticeCode);

		return list;
	}

	@Override
	public int insert(NoticeFile file) {
		NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);

		int result = noticeFileDao.insert(file);

		return result;
	}

	@Override
	public int update(NoticeFile file) {
		NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);

		int result = noticeFileDao.update(file);

		return result;
	}

	@Override
	public int delete(String code) {
		NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);

		int result = noticeFileDao.delete(code);

		return result;
	}
}
