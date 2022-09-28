package com.fms.member.service;

import java.util.Map;

import com.fms.member.dto.MemberDto;

public interface MemberService {
	public String overlapped(String memberId) throws Exception;
	public void addMember(MemberDto memberDto) throws Exception;
	public MemberDto login(Map<String, String> loginMap) throws Exception;
}
