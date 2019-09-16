package com.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.dao.BookmarkDao;
import com.web.entities.Bookmark;
import com.web.model.BookmarkModel;

public class MyBatisBookmarkDao implements BookmarkDao {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int insert(Bookmark bmark) {
		BookmarkDao bookmarkDao = sqlSession.getMapper(BookmarkDao.class);

		int result = bookmarkDao.insert(bmark);

		return result;
	}

	@Override
	public int update(Bookmark bmark) {
		return 0;
	}

	@Override
	public int delete(String site_Code, String member_ID) {
		BookmarkDao bookmarkDao = sqlSession.getMapper(BookmarkDao.class);

		int result = bookmarkDao.delete(site_Code, member_ID);

		return result;
	}

	@Override
	public BookmarkModel get(String code, String member_ID) {
		BookmarkDao bookmarkDao = sqlSession.getMapper(BookmarkDao.class);

		BookmarkModel result = bookmarkDao.get(code, member_ID);

		return result;
	}

	@Override
	public List<BookmarkModel> getCategoryList(String member_ID, String category) {
		BookmarkDao bookmarkDao = sqlSession.getMapper(BookmarkDao.class);
		List<BookmarkModel> result = bookmarkDao.getCategoryList(member_ID, category);

		return result;
	}

	@Override
	public List<BookmarkModel> getList(String member_ID) {
		BookmarkDao bookmarkDao = sqlSession.getMapper(BookmarkDao.class);
		List<BookmarkModel> result = bookmarkDao.getList(member_ID);

		return result;
	}

}
