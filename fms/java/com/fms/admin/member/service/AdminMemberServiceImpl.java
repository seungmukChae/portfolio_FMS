package com.fms.admin.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fms.admin.member.dao.AdminMemberDao;
import com.fms.member.dto.MemberDto;
@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberDao adminMemberDao;
	
	@Override
	public List<MemberDto> memberList() throws Exception {
		// TODO Auto-generated method stub
		return adminMemberDao.memberList();
	}

	@Override
	public MemberDto memberDetail(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return adminMemberDao.memberDetail(memberId);
	}

	@Override
	public void modifyMemberInfo(Map<String, String> memberMap) throws Exception {
		// TODO Auto-generated method stub
		adminMemberDao.modifyMemberInfo(memberMap);
	}

	@Override
	public List<MemberDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception {
		// TODO Auto-generated method stub
		return adminMemberDao.getSearchBoard(searchInfo);
	}

	@Override
	public int getAllBoardCount(Map<String, String> searchCountInfo) throws Exception {
		// TODO Auto-generated method stub
		return adminMemberDao.getAllBoardCount(searchCountInfo);
	}

}
