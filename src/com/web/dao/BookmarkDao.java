package com.web.dao;

import java.util.List;

import com.web.entities.Bookmark;
import com.web.model.BookmarkModel;

public interface BookmarkDao {
	BookmarkModel get(String code, String member_ID);
	List<BookmarkModel> getList(String member_ID);
	List<BookmarkModel> getCategoryList(String member_ID, String category);
	int insert(Bookmark bmark);
	int update(Bookmark bmark);
	int delete(String site_Code, String memeber_ID);
}
