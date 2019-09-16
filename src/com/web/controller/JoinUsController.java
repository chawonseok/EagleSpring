package com.web.controller;

import java.security.Principal;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Pattern;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.dao.MemberDao;
import com.web.dao.MemberRoleDao;
import com.web.entities.Member;
import com.web.entities.MemberRole;

@Controller
@RequestMapping("/joinus/*")
public class JoinUsController {

	@Autowired
	private MemberRoleDao memberRoleDao;
	@Autowired
	private MemberDao memberDao;

	@RequestMapping("login")
	public String login() {

		return "joinus.login";
	}

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {

		return "joinus.join";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(String pwd, String pwd2, String id, String btn, String nickName, Member member, MemberRole file,
			Model model, HttpServletRequest request, HttpServletResponse response) {

		btn = request.getParameter("btn");
		Pattern pattern = Pattern.compile("^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$");
		id = request.getParameter("id");

		if (btn.equals("취소")) {
			return "redirect:/customer/search";
		}

		if (btn.equals("확인")) {

			boolean hasIdChecked = false;

			Cookie[] cookies = request.getCookies();
			if (cookies != null)
				for (Cookie cookie : cookies)
					if (id.equals(cookie.getValue()))
						hasIdChecked = true;

			pwd = request.getParameter("pwd");
			pwd2 = request.getParameter("pwd2");
			nickName = request.getParameter("nickName");

			boolean hasError = false;

			if (id == null || id.equals("")) {

				hasError = true;
				model.addAttribute("errorMsgIdNotInput", "이메일 주소가 입력되지 않았습니다.");
			}

			if (!hasIdChecked) {
				hasError = true;
				model.addAttribute("errorMsgIdNotChecked", "이메일 중복확인을 하지 않았습니다.");

			}
			if (!pwd.equals(pwd2) || pwd.equals("")) {

				hasError = true;
				model.addAttribute("errorMsgPwdNotMatch", "비밀번호가 일치하지 않습니다.");
			}

			if (hasError) {
				request.setAttribute("id", id);
				request.setAttribute("nickName", nickName);

				return "joinus.join";
			} else {
				member.setId(id);
				member.setPwd(pwd);
				member.setNickName(nickName);
				file.setMemberId(id);
				file.setRoleName("ROLE_USER");

				memberDao.insert(member);
				memberRoleDao.insert(file);

				return ("redirect:login");
			}

		} else if (btn.equals("중복확인")) {
			member = memberDao.get(id);

			request.setAttribute("id", id);
			request.setAttribute("nickName", nickName);

			if (!pattern.matcher(id).matches() || id.equals("")) {

				model.addAttribute("errorMsgIdNotCorrect", "이메일 형식이 올바르지 않습니다.");
			}

			else {
				if (member != null) {
					// request.setAttribute("id", "");
					model.addAttribute("duplicatedResult", "이미 가입된 이메일 입니다");

				} else {
					model.addAttribute("duplicatedResult", "가입이 가능한 이메일주소 입니다");

					// 쿠키로 아이디 사용가능함을 검증한 결과를 저장
					Cookie cookie = new Cookie("id-checked", id);
					cookie.setMaxAge(24 * 60 * 60);
					response.addCookie(cookie);
				}
			}

			return "joinus.join";
		}
		return "joinus.join";
	}

	@RequestMapping("mypage")
	public String mypage(Principal principal, HttpServletRequest request) {

		String memberId = principal.getName();
		MemberRole memberRole = memberRoleDao.getDefaultRole(memberId);
		// String id = memberId;
		// Member member = memberDao.get(id);
		// Member member = (Member)
		// SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (memberRole.getRoleName().equals("ROLE_ADMIN")) {
			return "redirect:../admin/index";
		} else if (memberRole.getRoleName().equals("ROLE_USER")) {
			return "redirect:../customer/search";
		} else
			return "joinus.login";
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		String url = request.getHeader("referer");

		return "redirect:" + url;
	}

	@RequestMapping(value = "findPwd", method = RequestMethod.GET)
	public String findPwd() {

		return "joinus.findPwd";
	}

	@RequestMapping(value = "findPwd", method = RequestMethod.POST)
	public String findPwd(HttpServletRequest request, Member member) {
		StringBuilder temp = new StringBuilder();
		Pattern pattern = Pattern.compile("^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$");

		String id = request.getParameter("id");

		if (!pattern.matcher(id).matches() || id.equals("")) {

			request.setAttribute("errorMsgIdNotCorrect", "이메일 형식이 올바르지 않습니다.");
			
			return "joinus.findPwd";
		} else {

			for (char i = 'A'; i <= 'Z'; i++)
				temp.append(i);
			/*
			 * String numb = temp.toString();
			 */
			for (char i = '0'; i <= '9'; i++)
				temp.append(i);

			StringBuilder tempPwd = new StringBuilder();

			Random rand = new Random();

			for (int i = 0; i < 9; i++) {
				int pickOne = rand.nextInt(36);
				char singleWordTemp = temp.charAt(pickOne);
				tempPwd.append(singleWordTemp);
			}

			String pwd = tempPwd.toString();

			Properties p = new Properties();
			p.put("mail.smtp.user", "kizmo04@gmail.com"); // Google계정@gmail.com으로
			// 설정
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");

			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");

			// Security.addProvider(new
			// com.sun.net.ssl.internal.ssl.Provider());

			try {
				SMTPAuthenticator auth = new SMTPAuthenticator();
				Session session = Session.getInstance(p, auth);
				session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.

				// session = Session.getDefaultInstance(p);
				MimeMessage msg = new MimeMessage(session);

				/* String message = "Gmail SMTP 서버를 이용한 JavaMail 테스트"; */
				msg.setSubject("이글 임시비밀번호 발급");
				Address fromAddr = new InternetAddress("kizmo04@gmail.com"); // 보내는
				// 사람의
				// 메일주소

				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(id); // 받는 사람의 메일주소
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setText("임시비밀번호: " + tempPwd, "UTF-8");
				msg.setHeader("content-Type", "text/html");
				// msg.setContent("<a>임시비밀번호: "+tempPwd+"</a>",
				// "text/plain;charset=KSC5601");

				// MemberDao memberDao = new MyBatisMemberDao();

				// Member member = new MyBatisMemberDao().get(id);
				member = memberDao.get(id);
				member.setPwd(pwd);
				// String ddd = member.getPwd();
				// System.out.println(ddd);
				// request.setAttribute("sss", ddd);
				memberDao.change(member);

				// System.out.println("Message: " + msg.getContent());
				Transport.send(msg);
				System.out.println("Gmail SMTP서버를 이용한 메일보내기 성공, 임시비밀번호:" + tempPwd);
			} catch (Exception mex) { // Prints all nested (chained) exceptions
										// as
				// well
				System.out.println("메일보내기 실패");
				mex.printStackTrace();
			}

		}
		return "redirect:login";

	}

	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String memberEdit(String id, Principal principal, Model model) {

		Member member;
		member = memberDao.get(id);

		model.addAttribute("m", member);

		return "joinus.edit";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String memberEdit(Model model, Member member, String id, String pwd, String pwd2, String nickName,
			HttpServletRequest request) {
		pwd = request.getParameter("pwd");
		pwd2 = request.getParameter("pwd2");
		String ctx = request.getContextPath();

		if (!pwd.equals(pwd2) || pwd.equals("")) {
			model.addAttribute("m", member);
			model.addAttribute("errorMsgPwdNotMatch", "비밀번호가 일치하지 않습니다.");

			return "joinus.edit";
		} else {

			member.setPwd(pwd);
			member.setNickName(nickName);

			memberDao.update(member);

			return "redirect:/customer/search";

		}
	}

	class SMTPAuthenticator extends javax.mail.Authenticator {

		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("kizmo04", "kennedy11"); // Google
			// id,
			// pwd,
			// 주의)
			// @gmail.com
			// 은
			// 제외하세요
		}

	}
}