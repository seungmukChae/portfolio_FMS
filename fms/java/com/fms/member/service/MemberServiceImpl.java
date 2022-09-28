package com.fms.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fms.member.dao.MemberDao;
import com.fms.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public String overlapped(String memberId) throws Exception {
		// TODO Auto-generated method stub
		if (memberDao.selectOverlappedID(memberId) == 1)	return "true";
		else												return "false";
	}

	@Override
	public void addMember(MemberDto memberDto) throws Exception {
		// TODO Auto-generated method stub
		memberDao.insertAddMember(memberDto);
	}

	@Override
	public MemberDto login(Map<String, String> loginMap) throws Exception {
		// TODO Auto-generated method stub
		MemberDto memberDto = memberDao.login(loginMap);
		
		if(memberDto != null) {
			if (passwordEncoder.matches(loginMap.get("memberPw"), memberDto.getMemberPw())) {
				return memberDto;
			}
		}
		
		return null;
	}

}
