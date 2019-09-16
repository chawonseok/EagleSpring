package com.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.dao.ReviewDao;
import com.web.entities.Review;
import com.web.model.ReviewModel;

public class MyBatisReviewDao implements ReviewDao {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ReviewModel> getad(String code) {
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		List<ReviewModel> result = reviewDao.getad(code);
		return result;
	}

	@Override
	public List<ReviewModel> getuser(int page, String code) {
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		List<ReviewModel> result = reviewDao.getuser(page, code);

		return result;
	}

	public List<ReviewModel> gethituser(String code) {
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		List<ReviewModel> result = reviewDao.gethituser(code);

		return result;
	}

	@Override
	public int getCount(String code) {
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		int result = reviewDao.getCount(code);
		return result;
	}

	@Override
	public int insert(Review review) {
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);

		int result = reviewDao.insert(review);
		return result;
	}

	@Override
	public int delete(String code) {
		ReviewDao reviewDao = sqlSession.getMapper(ReviewDao.class);
		int result = reviewDao.delete(code);
		return result;
	}

}
