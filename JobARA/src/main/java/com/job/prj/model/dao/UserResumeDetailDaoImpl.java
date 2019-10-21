package com.job.prj.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.job.prj.dto.UserMemberDto;
import com.job.prj.dto.UserResumeCareerDto;
import com.job.prj.dto.UserResumeDetailDto;
import com.job.prj.dto.UserResumeDto;

@Repository
public class UserResumeDetailDaoImpl implements UserResumeDetailDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	@Override
	public UserResumeDto ResumeOne(UserResumeDetailDto dto) {

		UserResumeDto resumedto = sqlSession.selectOne(namespace + "selectOneResume", dto);

		return resumedto;
	}

	@Override
	public int insert(UserMemberDto memberdto,UserResumeDto resumedto,UserResumeDetailDto resumedetaildto,UserResumeCareerDto resumecareerdto) {
		
		int resumemember=sqlSession.update("UserMember.resumemember_update", memberdto);
		int resumeres=sqlSession.insert("UserResume.insertResume", resumedto);
		int resumedetailres = sqlSession.insert(namespace + "insertResumeDetail", resumedetaildto);
		int resumecareerres=sqlSession.insert("UserResumeCareer.insertResumeCareer", resumecareerdto);
		return resumemember+resumeres+resumedetailres+resumecareerres;
	}

	@Override
	public int updateDetail(UserMemberDto memberdto,UserResumeDetailDto resumedetaildto,UserResumeDto resumedto,UserResumeCareerDto resumecareerdto) {
		
		int resumemember=sqlSession.update("UserMember.resumemember_update", memberdto);
		int resumedetailres = sqlSession.update(namespace + "updateResumeDetail", resumedetaildto);
		int resumeres=sqlSession.update("UserResume.updateResume",resumedto );
		int resumecareerres=sqlSession.update("UserResumeCareer.updateResumeCareer", resumecareerdto);
		return resumemember+resumedetailres+resumeres+resumecareerres;
	}

	@Override
	public int deleteResumeDetail(UserResumeDto dto) {
		int resumecareerres=sqlSession.delete("UserResumeCareer.deleteResumeCareer",dto);
		int resumedetailres = sqlSession.delete(namespace + "deleteResumeDetail", dto);
		int resumeres=sqlSession.delete("UserResume.deleteResume", dto);
		return resumecareerres+resumedetailres+resumeres;
	}

	@Override
	public UserResumeDetailDto selectOne(int member_no_seq) {
		UserResumeDetailDto dto = new UserResumeDetailDto();
		
		try {
			dto = sqlSession.selectOne(namespace + "selectOne", member_no_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
