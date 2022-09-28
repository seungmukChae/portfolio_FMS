package com.fms.admin.member.dao;

import java.util.List;
import java.util.Map;

import com.fms.member.dto.MemberDto;

public interface AdminMemberDao {

	public List<MemberDto> memberList() throws Exception;
	public MemberDto memberDetail(String memberId) throws Exception;
	public void modifyMemberInfo(Map<String,String> memberMap) throws Exception;
	
	public List<MemberDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception;
	public int getAllBoardCount(Map<String, String> searchCountInfo) throws Exception;
}
