package com.web.dao.mybatis;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.dao.AssessmentDao;
import com.web.entities.Assessment;
import com.web.model.AssModel;

public class MyBatisAssessmentDao implements AssessmentDao{

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public Assessment get(String code) {
		AssessmentDao assessmentDao = sqlSession.getMapper(AssessmentDao.class);

		Assessment assessment = assessmentDao.get(code);
		
		return assessment;
	}
	
	@Override
	public List<AssModel> getList(String query){

		AssessmentDao assessmentDao = sqlSession.getMapper(AssessmentDao.class);

		List<AssModel> result = assessmentDao.getList(query);

		return result;
	}

	@Override
	public int insert(Assessment assessment) {
		AssessmentDao assessmentDao = sqlSession.getMapper(AssessmentDao.class);

		int result = assessmentDao.insert(assessment);

		return result;
	}

	@Override
	public int update(Assessment assessment) {
		AssessmentDao assessmentDao = sqlSession.getMapper(AssessmentDao.class);

		int result = assessmentDao.update(assessment);

		return result;
	}

	@Override
	public int delete(String code) {
		AssessmentDao assessmentDao = sqlSession.getMapper(AssessmentDao.class);

		int result = assessmentDao.delete(code);

		return result;
	}



}
