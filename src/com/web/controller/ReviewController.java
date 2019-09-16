package com.web.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.dao.AssessmentDao;
import com.web.dao.ReviewDao;
import com.web.dao.SiteDao;
import com.web.dao.SiteupDao;
import com.web.entities.Assessment;
import com.web.entities.Review;
import com.web.entities.Site;
import com.web.entities.Siteup;
import com.web.model.ReviewModel;

@Controller
@RequestMapping("/customer/*")
public class ReviewController {
   @Autowired
   private SiteDao siteDao;
   @Autowired
   private ReviewDao reviewDao;
   @Autowired
   private SiteupDao siteupDao;
   @Autowired
   private AssessmentDao assessmentDao;
   
   // 리뷰 POJO
      @RequestMapping(value = "review", method = RequestMethod.GET)
      public String review(String p, String code, String query, Model model, Principal principal) {
         List<ReviewModel> adreview;
         List<ReviewModel> userreview;
         List<ReviewModel> hituserreview;
         Site site;
         Assessment assessment;


//         int page = 1;
//
//         if (p != null && !p.equals(""))
//            page = Integer.parseInt(p);
//         model.addAttribute("s_code", code);
//         site = siteDao.get(code);
//         adreview = reviewDao.getad(code);
//         userreview = reviewDao.getuser(page, code);
//         hituserreview = reviewDao.gethituser(code);
//         int count = reviewDao.getCount(code);
//         
//         assessment = assessmentDao.get(code);
//         
//         model.addAttribute("a", assessment);
//         model.addAttribute("query", query);
//         model.addAttribute("site", site);
//         model.addAttribute("s", site);
//         model.addAttribute("adreview", adreview);
//         model.addAttribute("userreview", userreview);
//         model.addAttribute("hituserreview", hituserreview);
//         model.addAttribute("count", count);
//         
//         if(principal!=null){
//       //추천을 한상태면 다시 못하기      
//       if(siteupDao.get(code, principal.getName()) == null)
//          model.addAttribute("er", "up");
//       
//       else if(siteupDao.get(code, principal.getName()) != null)
//          model.addAttribute("er", "down");
//         }
         
         
         return "review.review";
      }

      @RequestMapping(value = "review", method = RequestMethod.POST)
      public String review(String btn, String content, String s_code, String delcode, String query, String ID,
            Model model, Principal principal) {
         String result = "redirect:review?code=" + s_code + "&query=" + query;
         

         if (!principal.getName().equals(null)) {
            String member_ID = principal.getName();
            System.out.println("id" + member_ID);
            System.out.println("id" + query);
         
            if (btn.equals("coment")) {
               Review n = new Review();
               n.setContent(content);
               n.setMember_id(member_ID);
               n.setSite_code(s_code);
               reviewDao.insert(n);

            } 
            if (btn.equals("del") && (member_ID.equals(ID))) {
                  reviewDao.delete(delcode);
                  System.out.println("id" + query);
            }
         }

         return result;
      }

}
