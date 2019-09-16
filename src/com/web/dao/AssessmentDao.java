package com.web.dao;

import java.util.List;

import com.web.entities.Assessment;
import com.web.model.AssModel;


public interface AssessmentDao {
	
	Assessment get(String code);
	
	List<AssModel> getList(String query);
	
	int insert(Assessment assessment);

	int update(Assessment assessment);

	int delete(String code);

}
