package com.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.dao.NoticeDao;
import com.web.entities.Notice;
import com.web.model.NoticeModel;

public class MyBatisNoticeDao implements NoticeDao {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public Notice get(String code) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		Notice result = noticeDao.get(code);
		return result;
	}

	@Override
	public List<NoticeModel> getList(int page, String field, String query) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		List<NoticeModel> result = noticeDao.getList(page, field, query);
		return result;
	}

	@Override
	public List<NoticeModel> getList(int page) {

		return getList(1, "TITLE", "");
	}

	@Override
	public List<NoticeModel> getList() {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		List<NoticeModel> result = noticeDao.getList();

		return result;
	}

	@Override
	public int insert(Notice notice) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		int result = noticeDao.insert(notice);

		return result;

	}

	@Override
	public int update(Notice notice) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		int result = noticeDao.update(notice);

		return result;
	}

	@Override
	public int delete(String code) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		int result = noticeDao.delete(code);

		return result;
	}

	@Override
	public int getCount(String field, String query) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		int count = noticeDao.getCount(field, query);

		return count;
	}

	@Override
	public String getLastCode() {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		String code = noticeDao.getLastCode();

		return code;
	}

	@Override
	public Notice getPrev(String code) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		Notice result = noticeDao.getPrev(code);

		return result;
	}

	@Override
	public Notice getNext(String code) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		Notice result = noticeDao.getNext(code);

		return result;
	}

	@Override
	public int hitUp(String code) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		int count = noticeDao.hitUp(code);

		return count;
	}

}
