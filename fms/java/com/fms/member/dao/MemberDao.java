package com.fms.member.dao;

import java.util.Map;

import com.fms.member.dto.MemberDto;

public interface MemberDao {
	public int selectOverlappedID(String memberId) throws Exception;
	public void insertAddMember(MemberDto memberDto) throws Exception;
	public MemberDto login(Map<String, String> loginMap) throws Exception;
}
