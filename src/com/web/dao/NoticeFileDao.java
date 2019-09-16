package com.web.dao;

import java.util.List;

import com.web.entities.NoticeFile;



public interface NoticeFileDao {
	List<NoticeFile> getList(String NoticeCode);
	int insert(NoticeFile file);
	int update(NoticeFile file);
	int delete(String code);
}
