package com.fms.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fms.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int selectOverlappedID(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper_member.selectOverlappedId", memberId);
	}


	@Override
	public void insertAddMember(MemberDto memberDto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("mapper_member.insertAddMember", memberDto);
		
	}


	@Override
	public MemberDto login(Map<String, String> loginMap) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper_member.login", loginMap);
	}

}
