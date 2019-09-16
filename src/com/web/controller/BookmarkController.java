package com.web.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.dao.BookmarkDao;
import com.web.dao.SiteDao;
import com.web.entities.Bookmark;
import com.web.entities.Site;
import com.web.model.BookmarkModel;

@Controller
@RequestMapping("/customer/*")
public class BookmarkController {

   @Autowired
   private BookmarkDao bookmarkDao;
   @Autowired
   private SiteDao siteDao;

   @RequestMapping("bookmark")
   public String bookmark(Model model, Principal principal) {
      if(principal==null)
         return "joinus.login";
      
      String member_ID =  principal.getName();
      List<BookmarkModel> list = bookmarkDao.getList(member_ID);
      model.addAttribute("list", list);

      return "bookmark.bookmark";
   }

   @RequestMapping("bookmark-del")
   public String bookmarkDel(String code, Site site, Principal principal) {
      if(principal==null)
         return "joinus.login";
      
      String member_ID = principal.getName();

      bookmarkDao.delete(code, member_ID);
      siteDao.subBookCount(site);
      return "redirect:bookmark";
   }

   @RequestMapping("bookmark-reg")
   public String bookmarkReg(Site site, Bookmark bookmark, String code, Principal principal) {
      if(principal==null)
      return "joinus.login";
      
      String member_ID = principal.getName();
      
      if (bookmarkDao.get(code, member_ID) == null) {
         site.setCode(code);
         bookmark.setMember_ID(member_ID);
         bookmark.setSite_code(code);
         
         siteDao.addBookCount(site);
         bookmarkDao.insert(bookmark);
      }
      return "redirect:review?code=" + code;
   }
}