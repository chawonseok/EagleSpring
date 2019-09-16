package com.web.dao;

import com.web.entities.Siteup;

public interface SiteupDao {
   Siteup get(String code, String memberId);
   int insert(Siteup siteup);
   int delete(String code, String memberId);
}