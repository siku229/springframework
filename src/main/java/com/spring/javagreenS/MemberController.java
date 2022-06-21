package com.spring.javagreenS;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.javagreenS.service.MemberService;
import com.spring.javagreenS.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/memLogin", method = RequestMethod.GET)
	public String memLoginGet(HttpServletRequest request) {
		// 로그인 폼 호출시 기존에 저장된 쿠키가 있다면 불러와서 mid에 담아서 넘겨준다.
		Cookie[] cookies = request.getCookies();
		String mid = "";
		for(int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				mid = cookies[i].getValue();
				request.setAttribute("mid", mid);
				break;
			}
		}
		return "member/memLogin";
	}
	
	// 로그인 인증처리
	
	@RequestMapping(value = "/memLogin", method = RequestMethod.POST)
	public String memLoginPost(Model model,
			//RedirectAttributes redirect,
			HttpServletRequest request,
			HttpServletResponse response,
			String mid,
			String pwd,
			@RequestParam(name="idCheck", defaultValue = "", required = false) String idCheck,
			HttpSession session) {
		
		MemberVO vo = memberService.getMemIdCheck(mid);
		
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd()) && vo.getUserDel().equals("NO")) {
		// 회원 인증처리된 경우에 수행할 내용들을 기술한다.(Session에 저장할 자료 처리, 쿠키값 처리)
			String strLevel ="";
			if(vo.getLevel() == 0) strLevel = "관리자";
			else if(vo.getLevel() == 1) strLevel = "운영자";
			else if(vo.getLevel() == 2) strLevel = "우수회원";
			else if(vo.getLevel() == 3) strLevel = "정회원";
			else if(vo.getLevel() == 4) strLevel = "준회원";
			
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickname", vo.getNickname());
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("sStrLevel", strLevel);
			
			
			if(idCheck.equals("on")) {
				Cookie cookie = new Cookie("cMid", mid);
				cookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(cookie);
			} else {
				Cookie[] cookies = request.getCookies();
				for(int i = 0; i < cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);	//기존에 저장된 mid 삭제
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
			// 방문횟수 누적(최종접속일 처리)
			memberService.setMemberVisitProcess(vo);
			
			model.addAttribute("mid", mid);
			//.addAttribute("mid", mid);
			
			return "redirect:/msg/memLoginOk";
		} else {
			return "redirect:/msg/memLoginNo";
		}
	}
	

	@RequestMapping(value = "/memJoin", method = RequestMethod.GET)
	public String memJoinGet() {
		return "member/memJoin";
	}
	
	@RequestMapping(value = "/memJoin", method = RequestMethod.POST)
	public String memJoinPost(MultipartFile fName, MemberVO vo) {
		if(memberService.getMemIdCheck(vo.getMid()) != null) { 
			return "redirect:/msg/memIdCheckNo";
		}
		if(memberService.getMemNickCheck(vo.getMid()) != null) { 
			return "redirect:/msg/memNickCheckNo";
		}
		
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		int res = memberService.setMemInputOk(fName, vo);
		
		if(res == 1) return "redirect:/msg/memInputOk";
		else return "redirect:/msg/memInputNo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/memIdCheck", method = RequestMethod.POST)
	public String memIdCheckPost(String mid) {
		String res = "0";
		MemberVO vo = memberService.getMemIdCheck(mid);
		if(vo != null) res = "1";
		return res;
	}
	
	@ResponseBody
	@RequestMapping(value = "/memNickCheck", method = RequestMethod.POST)
	public String memNickCheckPost(String nickname) {
		String res = "0";
		MemberVO vo = memberService.getMemNickCheck(nickname);
		if(vo != null) res = "1";
		return res;
	}
	
	@RequestMapping(value = "/memLogout", method = RequestMethod.GET)
	public String memLogout(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		session.invalidate();
		
		model.addAttribute("mid", mid);
		return "redirect:/msg/memLogout";
	}
	
	@RequestMapping(value = "/memMain", method = RequestMethod.GET)
	public String memMainGet(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		
		MemberVO vo = memberService.getMemIdCheck(mid);
		
		model.addAttribute("vo", vo);
		
		return "member/memMain";
	}
}
