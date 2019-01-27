package com.dongle.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dongle.group.model.service.GroupService;
import com.dongle.group.model.vo.Group;
import com.dongle.group.model.vo.GroupMember;
import com.dongle.manager.model.service.ManagerService;
import com.dongle.member.model.vo.DongleRptMember;
import com.dongle.member.model.vo.Member;

/**
 * Servlet implementation class DeleteMemberSubmitServlet
 */
@WebServlet("/manager/deleteMemberSubmit")
public class DeleteMemberSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberSubmitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member loginMember=(Member)request.getSession().getAttribute("loginMember");
		int groupNo = Integer.parseInt(request.getParameter("groupNo"));
		int managerNo = Integer.parseInt(request.getParameter("managerNo"));
		Group g = new GroupService().selectGrInfo(groupNo); //그룹정보 받아오기
		int selectMemberNo = Integer.parseInt(request.getParameter("selectMemberNo"));
	
		if(loginMember==null||loginMember.getMemberNo() != managerNo) 
		{
			request.setAttribute("msg", "잘못된 경로로 접속하셨습니다");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/Dongle_view/msg.jsp").forward(request, response);
			return;
		}
		
		int result = 0;
		
		
		result = new ManagerService().deleteMemberSubmit(groupNo, selectMemberNo);
		
		List<GroupMember> memberList = new ManagerService().selectMemberList(groupNo);
		
		request.setAttribute("groupNo", groupNo);
		request.setAttribute("group", g);
		request.setAttribute("memberList", memberList);
	
		request.getRequestDispatcher("/views/manager/manager_deleteMember.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
