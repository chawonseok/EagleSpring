package com.web.dao;

import java.util.List;

import com.web.entities.Site;


public interface SiteDao {
	List<Site> getList();
	Site get(String code);
	int addBookCount(Site site);
	int subBookCount(Site site);
	
	int insert(Site site);

	int update(Site site);

	int delete(String code);
	
	int addSiteUp(String code);
    int subSiteUp(String code);

}
