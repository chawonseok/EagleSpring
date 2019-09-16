package com.web.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.dao.AssessmentDao;
import com.web.dao.NoticeDao;
import com.web.dao.NoticeFileDao;
import com.web.dao.QnADao;
import com.web.dao.SearchDao;
import com.web.dao.SiteDao;
import com.web.dao.SiteupDao;
import com.web.entities.Member;
import com.web.entities.Notice;
import com.web.entities.NoticeFile;
import com.web.entities.QnA;
import com.web.entities.Site;
import com.web.entities.Siteup;
import com.web.model.AssModel;
import com.web.model.NoticeModel;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {

   // 저장소에서 꺼내서 자동으로 연결시켜줌, xml에서 직접 해줄수도 있지만 옛날 방식
   @Autowired
   private NoticeDao noticeDao;
   @Autowired
   private NoticeFileDao noticeFileDao;
   @Autowired
   private QnADao qnaDao;
   @Autowired
   private SiteDao siteDao;
   @Autowired
   private SearchDao searchDao;
   @Autowired
   private SiteupDao siteupDao;
   
   @Autowired
   private AssessmentDao assessmentDao;
   // service ------------------------------------------------------------
   @RequestMapping("programmer")
   public String programmer() {

      return "service.programmer";
   }

   @RequestMapping("service")
   public String service() {

      return "service.service";
   }

   // Notice ------------------------------------------------------------
   @RequestMapping("notice")
   public String notice(Integer p, String q, String t, Model model) {
      int page = 1;
      String field = "TITLE";
      String query = "";

      if (p != null && p != 0) {
         page = p;
      }

      if (t != null && !t.equals("")) {
    	  if(t.equals("NONE"))
    		  return "redirect:notice";
         field = t;
      }
      if (q != null) {
         query = q;
      }

      noticeDao.getList(page, field, query);

      List<NoticeModel> list = noticeDao.getList(page, field, query);
      int count = noticeDao.getCount(field, query);

      model.addAttribute("list", list);
      model.addAttribute("count", count);

      return "notice.notice";
   }

   @RequestMapping("notice-detail")
   public String noticeDetail(String code, Model model) {

      List<NoticeFile> noticeFiles;

      noticeDao.hitUp(code);

      Notice notice = noticeDao.get(code);
      noticeFiles = noticeFileDao.getList(code);

      model.addAttribute("n", notice);
      model.addAttribute("next", noticeDao.getNext(code));
      model.addAttribute("prev", noticeDao.getPrev(code));
      model.addAttribute("files", noticeFiles);

      return "notice.notice-detail";
   }

   @RequestMapping(value = "notice-reg", method = RequestMethod.GET)
   public String noticeReg(Principal principal, String code, Member member) {

      if (principal == null)
         return "redirect:../joinus/login";

      return "admin.notice.notice-reg";

   }

   @RequestMapping(value = "notice-reg", method = RequestMethod.POST)
   public String noticeReg(Principal principal, Notice notice, String title, String content) {
      
      String member_ID = principal.getName();
               
      notice.setMember_id(member_ID);
      notice.setTitle(title);
      notice.setContent(content);
      
      noticeDao.insert(notice);

      return "redirect:notice";
   }

   @RequestMapping(value = "notice-edit", method = RequestMethod.GET)
   public String noticeEdit(String code, Model model) {

      Notice notice;
      List<NoticeFile> noticeFiles;

      notice = noticeDao.get(code);
      noticeFiles = noticeFileDao.getList(code);

      model.addAttribute("n", notice);
      model.addAttribute("files", noticeFiles);

      return "notice.notice-edit";
   }
   
   @RequestMapping(value = "notice-edit", method = RequestMethod.POST)
   public String noticeEdit(Notice notice, String code, String title, String content) {

      notice.setCode(code);
      notice.setTitle(title);
      notice.setContent(content);

      noticeDao.update(notice);
      
      return "redirect:notice";
   }


   @RequestMapping("notice-del")
   public String noticeDel(String code, Notice notice) {
      
      notice.setCode(code);
      
      noticeDao.delete(code);
      
      return "redirect:notice";
   }
   
   
   // QnA ------------------------------------------------------------
   
   @RequestMapping("qna")
   public String qna(Integer p, String q, String t, Model model) {
      
      int page = 1;
      String field = "title";
      String query = "";
      
      if (p != null && p != 0) {
         page = p;
      }

      if (t != null && !t.equals("")) {
    	  if(t.equals("none"))
    		  return "redirect:qna";
         field = t;
      }
      if (q != null) {
         query = q;
      }
      
      List<QnA> list = qnaDao.getList(page, field, query);
      int count = qnaDao.getCount(field, query);

      model.addAttribute("list", list);
      model.addAttribute("count", count);

      return "qna.qna";
   }
   
   @RequestMapping("qna-del")
   public String qnaDel(String code, QnA qna)  {
      qna.setCode(code);
      
      qnaDao.delete(code);
      
      return "redirect:qna";
   }
   @RequestMapping("qna-detail")
   public String qnaDetail(String code, Model model) {
      QnA qna = qnaDao.get(code);

      model.addAttribute("n", qna);
      
      return "qna.qna-detail";
   }

   @RequestMapping(value = "qna-edit", method = RequestMethod.GET)
   public String qnaEdit(String code, Model model) {
      
      QnA qna = qnaDao.get(code);
      model.addAttribute("n", qna);
      
      return "qna.qna-edit";
   }
   
   @RequestMapping(value = "qna-edit", method = RequestMethod.POST)
   public String qnaEdit(QnA qna, String code, String title, String content) {
      qna.setCode(code);
      qna.setTitle(title);
      qna.setContent(content);

      qnaDao.update(qna);
      
      return "redirect:qna";
   }
   
   @RequestMapping(value = "qna-reg", method = RequestMethod.GET)
   public String qnaReg(Principal principal, String code, Model model) {
      if (principal == null)
         return "redirect:../joinus/login";
      return "admin.qna.qna-reg";
   }
   
   @RequestMapping(value = "qna-reg", method = RequestMethod.POST)
   public String qnaReg(Principal principal, QnA qna, String title, String content) {
      String member_ID = principal.getName();

      qna.setMember_id(member_ID);
      qna.setTitle(title);
      qna.setContent(content);

      qnaDao.insert(qna);
      
      return "redirect:qna";
   }
   
   // site ------------------------------------------------------------
   @RequestMapping("site")
   public String site(Site site, Model model){
      List<Site> list = siteDao.getList();
      
      model.addAttribute("list", list);
      return "site.site";
   }
   @RequestMapping(value = "site-detail", method = RequestMethod.GET)
   public String siteDetail(String code, String query, Model model){
      Site site = siteDao.get(code);
      
      model.addAttribute("s", site);
      model.addAttribute("query",query);
      
      return "site.site-detail";
   }
   @RequestMapping("site-up")
   public String siteUP(Siteup siteup, String code, Principal principal, Model model){
      String memberId = principal.getName();
      
      //추천을 한상태면 다시 못하기      
      if(siteupDao.get(code, principal.getName()) == null){
         siteup.setMemberID(memberId);
         siteup.setSiteCode(code);
         //추천수 증가
         siteDao.addSiteUp(code);
         //추천한거 저장시키기
         siteupDao.insert(siteup);
      }
      else{
         //추천수 감소
         siteDao.subSiteUp(code);
         //추천한거 지우기
         siteupDao.delete(code, memberId);
      }      
      
      return "redirect:review?code="+code;
   }
   // search ------------------------------------------------------------

   @RequestMapping("search")
   public String search(String query, Model model) {

      model.addAttribute("query", query);

      return "search.search";
   }
   @RequestMapping("search-detail")
   public String searchDetail(String query, Model model) {
      
      List<AssModel> list = assessmentDao.getList(query);
      
      model.addAttribute("list", list);
      model.addAttribute("query", query);

      return "search.search-detail";
   }
   
}