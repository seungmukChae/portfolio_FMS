package com.fms.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fms.member.dto.MemberDto;
@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<MemberDto> memberList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper_admin_member.memberList");
	}

	@Override
	public MemberDto memberDetail(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper_admin_member.memberDetail",memberId);
	}

	@Override
	public void modifyMemberInfo(Map<String, String> memberMap) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("mapper_admin_member.modifyMemberInfo", memberMap);
	}

	@Override
	public List<MemberDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper_admin_member.getSearchMember", searchInfo);
	}

	@Override
	public int getAllBoardCount(Map<String, String> searchCountInfo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper_admin_member.getAllBoardCount", searchCountInfo);
	}

}
