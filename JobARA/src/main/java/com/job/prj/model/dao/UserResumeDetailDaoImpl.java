package com.job.prj.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.job.prj.dto.UserMemberDto;
import com.job.prj.dto.UserResumeCareerDto;
import com.job.prj.dto.UserResumeDetailDto;
import com.job.prj.dto.UserResumeDto;
import com.job.prj.dto.UserResumeHopeDto;

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
	public int insert(UserMemberDto memberdto,UserResumeDto resumedto,UserResumeDetailDto resumedetaildto,UserResumeCareerDto resumecareerdto,UserResumeHopeDto hopedto) {
		
		int resumemember=sqlSession.update("UserMember.resumemember_update", memberdto);
		int resumeres=sqlSession.insert("UserResume.insertResume", resumedto);
		int resumedetailres = sqlSession.insert(namespace + "insertResumeDetail", resumedetaildto);
		int resumecareerres=sqlSession.insert("UserResumeCareer.insertResumeCareer", resumecareerdto);
		int hoperes=sqlSession.insert("UserResumeHope.insertResumeHope", hopedto);
		return resumemember+resumeres+resumedetailres+resumecareerres+hoperes;
	}

	@Override
	public int updateDetail(UserMemberDto memberdto,UserResumeDetailDto resumedetaildto,UserResumeDto resumedto,UserResumeCareerDto resumecareerdto,UserResumeHopeDto hopedto) {
		
		int resumemember=sqlSession.update("UserMember.resumemember_update", memberdto);
		int resumedetailres = sqlSession.update(namespace + "updateResumeDetail", resumedetaildto);
		int resumeres=sqlSession.update("UserResume.updateResume",resumedto );
		int resumecareerres=sqlSession.update("UserResumeCareer.updateResumeCareer", resumecareerdto);
		int hoperes=sqlSession.update("UserResumeHope.updateResumeHope", hopedto);
		return resumemember+resumedetailres+resumeres+resumecareerres+hoperes;
	}

	@Override
	public int deleteResumeDetail(UserResumeDto dto) {
		
		int hoperes=sqlSession.delete("UserResumeHope.deleteResumeHope",dto);
		int resumecareerres=sqlSession.delete("UserResumeCareer.deleteResumeCareer",dto);
		int resumedetailres = sqlSession.delete(namespace + "deleteResumeDetail", dto);
		int resumeres=sqlSession.delete("UserResume.deleteResume", dto);
		return hoperes+resumecareerres+resumedetailres+resumeres;
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

	@Override
	public List<UserResumeDetailDto> selectList() {
		List<UserResumeDetailDto> list = new ArrayList<UserResumeDetailDto>();
		
		try {
			list = sqlSession.selectList(namespace+"ResumeList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<UserResumeDetailDto> resumePaging(int start, int end) {
		
		List<UserResumeDetailDto> list = new ArrayList<UserResumeDetailDto>();
		
		Map<Object,Object> map = new HashMap<Object, Object>();
		map.put("start", start);
		map.put("end", end);
		try {
			list = sqlSession.selectList(namespace + "resumepaging", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

}
