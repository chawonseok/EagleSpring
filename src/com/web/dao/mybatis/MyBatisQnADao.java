package com.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.dao.QnADao;
import com.web.entities.QnA;

public class MyBatisQnADao implements QnADao {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public QnA get(String code) {
		QnADao qnaDao = sqlSession.getMapper(QnADao.class);

		QnA result = qnaDao.get(code);

		return result;
	}

	@Override
	public List<QnA> getList(int page, String field, String query) {
		QnADao qnaDao = sqlSession.getMapper(QnADao.class);
		List<QnA> result = qnaDao.getList(page, field, query);

		return result;
	}

	@Override
	public List<QnA> getList(int page) {
		QnADao qnaDao = sqlSession.getMapper(QnADao.class);
		List<QnA> result = getList(page, "title", "");

		return result;

	}

	@Override
	public List<QnA> getList() {
		QnADao qnaDao = sqlSession.getMapper(QnADao.class);
		List<QnA> result = getList(1, "title", "");

		return result;
	}

	@Override
	public int getCount(String field, String query) {
		QnADao qnaDao = sqlSession.getMapper(QnADao.class);

		int count = qnaDao.getCount(field, query);

		return count;
	}

	@Override
	public int insert(QnA qnaDto) {
		QnADao qnaDao = sqlSession.getMapper(QnADao.class);

		int result = qnaDao.insert(qnaDto);

		return result;
	}

	@Override
	public int update(QnA qnaDto) {
		QnADao qnaDao = sqlSession.getMapper(QnADao.class);

		int result = qnaDao.update(qnaDto);

		return result;
	}

	@Override
	public int delete(String code) {
		QnADao qnaDao = sqlSession.getMapper(QnADao.class);

		int result = qnaDao.delete(code);
		return result;
	}
}
