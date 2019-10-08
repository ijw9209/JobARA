package com.job.prj.model.biz;

import com.job.prj.dto.UserMemberDto;

public interface Emailbiz {
	
	public void newPassword(UserMemberDto dto) throws Exception;
}
