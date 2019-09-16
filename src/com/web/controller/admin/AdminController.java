package com.web.controller.admin;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.dao.AssessmentDao;
import com.web.dao.MemberDao;
import com.web.dao.NoticeDao;
import com.web.dao.NoticeFileDao;
import com.web.dao.QnADao;
import com.web.dao.ReviewDao;
import com.web.dao.SearchDao;
import com.web.dao.SiteDao;
import com.web.entities.Assessment;
import com.web.entities.Member;
import com.web.entities.Notice;
import com.web.entities.NoticeFile;
import com.web.entities.QnA;
import com.web.entities.Review;
import com.web.entities.Site;
import com.web.model.AssModel;
import com.web.model.MemberModel;
import com.web.model.NoticeModel;
import com.web.model.ReviewModel;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

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
	private ReviewDao reviewDao;
	@Autowired
	private AssessmentDao assessmentDao;
	
	@Autowired
	private MemberDao memberDao;
	
	// Index ------------------------------------------------------------

	@RequestMapping("index")
	public String index() {

		return "admin.index";
	}

	// Assessment(장/단점) ------------------------------------------------------------
	
	
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

		return "admin.notice.notice";
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

		return "admin.notice.notice-detail";
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

		return "admin.qna.qna";
	}

	@RequestMapping("qna-del")
	public String qnaDel(String code, QnA qna) {
		qna.setCode(code);

		qnaDao.delete(code);

		return "redirect:qna";
	}

	@RequestMapping("qna-detail")
	public String qnaDetail(String code, Model model) {
		QnA qna = qnaDao.get(code);

		model.addAttribute("n", qna);

		return "admin.qna.qna-detail";
	}

	@RequestMapping(value = "qna-edit", method = RequestMethod.GET)
	public String qnaEdit(String code, Model model) {

		QnA qna = qnaDao.get(code);
		model.addAttribute("n", qna);

		return "admin.qna.qna-edit";
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
	public String site(Site site, Model model) {
		List<Site> list = siteDao.getList();

		model.addAttribute("list", list);
		return "admin.site.site";
	}

	@RequestMapping(value = "site-detail", method = RequestMethod.GET)
	public String siteDetail(String code, String query, Model model) {
		Site site = siteDao.get(code);

		model.addAttribute("s", site);
		model.addAttribute("query", query);

		return "admin.site.site-detail";
	}

	// -----------------삽 수 삭-------------------
	@RequestMapping(value = "site-reg", method = RequestMethod.GET)
	public String siteReg(String code) {

		return "admin.site.site-reg";

	}

	@RequestMapping(value = "site-reg", method = RequestMethod.POST)
	public String siteReg(Site site,Assessment assessment, String name,String address,String category,String comment) {

		site.setName(name);
		site.setAddress(address);
		site.setCategory(category);

		
		siteDao.insert(site);
		

		// 평가 추가
		assessment.setSiteCode(site.getCode());
		assessment.setComment(comment);
		
		assessmentDao.insert(assessment);


		return "redirect:search-detail?query=";
	}

	@RequestMapping(value = "site-edit", method = RequestMethod.GET)
	public String siteEdit(String code, Model model) {

		Site site;
		
		String comment =  assessmentDao.get(code).getComment();
		

		site = siteDao.get(code);

		model.addAttribute("s", site);
		model.addAttribute("com", comment);
		return "admin.site.site-edit";
	}

	@RequestMapping(value = "site-edit", method = RequestMethod.POST)
	public String siteEdit(String code, Site site, Assessment ass, Model model, String name,String address,String category,String search,String src, String comment) {
		
		site.setName(name);
		site.setAddress(address);
		site.setCategory(category);
		site.setSearch(search);
		ass.setComment(comment);
		ass.setSiteCode(code);
		//site.setSrc(src);
		
		siteDao.update(site);
		assessmentDao.update(ass);

		return "redirect:search-detail?query=";
	}

	@RequestMapping("site-del")
	public String siteDel(String code, Site site) {

		site.setCode(code);

		siteDao.delete(code);

		return "redirect:search-detail?query=";
	}

	// search ------------------------------------------------------------

	@RequestMapping("search")
	public String search(String query, Model model) {

		model.addAttribute("query", query);

		return "admin.search.search";
	}

	@RequestMapping("search-detail")
	public String searchDetail(String query, Model model) {

		
		//List<Site> list = searchDao.getList(query);
		List<AssModel> list = assessmentDao.getList(query);
		

		model.addAttribute("list", list);
		model.addAttribute("query", query);

		return "admin.search.search-detail";
	}

	// 리뷰 POJO
	@RequestMapping(value = "review", method = RequestMethod.GET)
	public String review(String p, String code, String query, Model model) {
		List<ReviewModel> userreview;
		List<ReviewModel> hituserreview;
		Site site;
		Assessment assessment;

		int page = 1;

		if (p != null && !p.equals(""))
			page = Integer.parseInt(p);
		// SiteDao siteDao =new MyBatisSiteDao();
		// ReviewDao reviewDao = new MyBatisReviewDao();
		model.addAttribute("s_code", code);
		site = siteDao.get(code);
		userreview = reviewDao.getuser(page, code);
		hituserreview = reviewDao.gethituser(code);
		int count = reviewDao.getCount(code);
		
		
		assessment = assessmentDao.get(code);
		
		model.addAttribute("a", assessment);
		model.addAttribute("query", query);
		model.addAttribute("site", site);
		model.addAttribute("s", site);
		model.addAttribute("userreview", userreview);
		model.addAttribute("hituserreview", hituserreview);
		model.addAttribute("count", count);


		return "admin.review.review";

	}

	@RequestMapping(value = "review", method = RequestMethod.POST)
	public String review(String btn, String content, String s_code, String delcode, String query, Model model) {
		String result = "";


		System.out.println(btn + content + s_code + delcode + query);

		if (btn.equals("coment")) {

			System.out.println("댓글등록" + s_code);

			Review n = new Review();
			n.setContent(content);
			n.setMember_id("user@naver.com");
			n.setSite_code(s_code);
			reviewDao.insert(n);
			result = "redirect:review?code=" + s_code + "&query=" + query;
		} else if (btn.equals("del")) {

			System.out.println("삭제" + delcode);

			result = "redirect:review?code=" + s_code + "&query=" + query;
			reviewDao.delete(delcode);
		}
		return result;

	}
	@RequestMapping("member")
	   public String member(Model model){
	      List<MemberModel> list = memberDao.getList();
	      model.addAttribute("list",list);
	      return "admin.member.member";
	   }
	   @RequestMapping("member-del")
	   public String member(String memberId){
	      memberDao.deleteMember(memberId);      
	      return "redirect:member.member";
	   }

}