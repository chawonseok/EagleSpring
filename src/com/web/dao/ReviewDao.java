package com.web.dao;

import java.util.List;

import com.web.entities.Review;
import com.web.model.ReviewModel;

public interface ReviewDao {
	List<ReviewModel> getad(String code)  ;
	List<ReviewModel> getuser(int page,String code)  ;
	List<ReviewModel> gethituser(String code);
	int insert(Review review) ;
	int getCount(String code);
	int delete(String code);
}
