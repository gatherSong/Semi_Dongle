package com.dongle.manager.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.dongle.group.model.vo.Group;
import com.dongle.group.model.vo.GroupMember;
import com.dongle.manager.model.dao.ManagerDao;
import com.dongle.member.model.vo.DongleRptMember;

public class ManagerService {

	public int deleteDongle(int groupNo)
	{
		Connection conn = getConnection();
		int result = new ManagerDao().deleteDongle(conn, groupNo);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<DongleRptMember> selectRptMember(int groupNo)
	{
		Connection conn = getConnection();
		List<DongleRptMember> rptList = new ManagerDao().selectRptMember(conn, groupNo);
		
		close(conn);
		return rptList;
	}
	
	public int submitRptMember(int groupNo, int selectMember, int rptCount)
	{
		Connection conn = getConnection();
		int result = new ManagerDao().submitRptMember(conn, groupNo, selectMember, rptCount);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int blackMember(int groupNo, int selectMember)
	{
		Connection conn = getConnection();
		int result = new ManagerDao().blackMember(conn, groupNo, selectMember);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int cntUpRptMember(int selectMember)
	{
		Connection conn = getConnection();
		int result = new ManagerDao().cntUpRptMember(conn, selectMember);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteRptMember(int groupNo, int selectMember)
	{
		Connection conn = getConnection();
		int result = new ManagerDao().deleteRptMember(conn, groupNo, selectMember);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<GroupMember> selectMemberList(int groupNo)
	{
		Connection conn = getConnection();
		List<GroupMember> memberList = new ManagerDao().selectMemberList(conn, groupNo);
		
		close(conn);
		return memberList;
	}
	
	public int deleteMemberSubmit(int groupNo, int selectMemberNo)
	{
		Connection conn = getConnection();
		int result = new ManagerDao().deleteMemberSubmit(conn, groupNo, selectMemberNo);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateDongle(Group g)
	{
		Connection conn = getConnection();
		int result = new ManagerDao().updateDongle(conn, g);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public String selectLocCtgCode(String metroCode, String areaCode, String townCode)
	{
		Connection conn = getConnection();
		String locCode = new ManagerDao().selectLocCtgCode(conn, metroCode, areaCode, townCode);
		
		close(conn);
		return locCode;
	}
	
	public int deleteMultiTopic(int groupNo)
	{
		Connection conn = getConnection();
		int result = new ManagerDao().deleteMultiTopic(conn, groupNo);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	public int updateMultiTopic(String[] topicCode, int groupNo)
	{
		Connection conn = getConnection();
		int result = new ManagerDao().updateMultiTopic(conn, topicCode, groupNo);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteMultiLoc(int groupNo)
	{
		Connection conn = getConnection();
		int result = new ManagerDao().deleteMultiLoc(conn, groupNo);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	public int updateMultiLoc(String[] locCode, int groupNo)
	{
		Connection conn = getConnection();
		int result = new ManagerDao().updateMultiLoc(conn, locCode, groupNo);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int insertDongle(int memberNo, Group g)
	{
		Connection conn = getConnection();
		int result = new ManagerDao().insertDongle(conn, memberNo, g);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
}
