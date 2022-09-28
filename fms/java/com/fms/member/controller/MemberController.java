package com.fms.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fms.member.dto.MemberDto;
import com.fms.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	//1. 회원가입
	@RequestMapping(value="/memberJoin", method = RequestMethod.GET)
	public ModelAndView memberJoin() throws Exception {
		return new ModelAndView("/member/memberJoin");
	}
	
	//회원가입시 ID 중복확인
	@RequestMapping(value="/overlapped", method = RequestMethod.GET)
	public ResponseEntity<String> overlapped(@RequestParam("memberId") String memberId) throws Exception{
		return new ResponseEntity<String> (memberService.overlapped(memberId), HttpStatus.OK);
	}
	
	//회원가입 성공
	@RequestMapping(value="/addMember", method = RequestMethod.POST)
	public ResponseEntity<Object> addMember(MemberDto memberDto , HttpServletRequest request) throws Exception {
		
		memberDto.setMemberPw(passwordEncoder.encode(memberDto.getMemberPw()));
		memberService.addMember(memberDto);
		
		String message  = "<script>";
		   message += " alert('회원가입되었습니다.');";
		   message += " location.href='" + request.getContextPath() + "/member/loginForm';";
		   message += " </script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(message, responseHeaders, HttpStatus.OK);
	}
	
	//2. 로그인
	@RequestMapping(value="/loginForm" , method = RequestMethod.GET)
	public ModelAndView loginForm() throws Exception {
		return new ModelAndView("/member/loginForm");
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberDto memberDto = memberService.login(loginMap);
		
		if(memberDto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo", memberDto.getMemberId());
			session.setMaxInactiveInterval(60 * 30);
			mv.setViewName("redirect:/main/main");	
		}
		else {
			mv.addObject("invalidMember", true);
			mv.setViewName("/member/loginForm");
		}
		return mv;
			
	}
	
	//3. 로그아웃
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ResponseEntity<Object> logout(HttpSession session, HttpServletRequest request) throws Exception {
		
		HttpSession sessionOut = request.getSession();
		
		sessionOut.setAttribute("isLogOn", false);
		sessionOut.invalidate();
		
		String message  = "<script>";
		   message += " alert('로그아웃 되었습니다.');";
		   message += " location.href='" + request.getContextPath() + "/main/main';";
		   message += " </script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(message, responseHeaders, HttpStatus.OK);
	}
}
