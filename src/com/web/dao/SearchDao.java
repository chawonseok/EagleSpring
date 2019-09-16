package com.web.dao;

import java.util.List;

import com.web.entities.Site;


public interface SearchDao {
	public List<Site> getList(String query);
}
