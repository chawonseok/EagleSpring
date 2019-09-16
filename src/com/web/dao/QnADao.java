package com.web.dao;

import java.util.List;

import com.web.entities.QnA;


public interface QnADao {
	
	QnA get(String code);
	List<QnA> getList(int page, String field, String query);
	List<QnA> getList(int page);
	List<QnA> getList();
	int getCount(String field, String query);
	int insert(QnA qna);
	int update(QnA n);
	int delete(String code);
}
