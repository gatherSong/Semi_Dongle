package com.dongle.gallery.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dongle.gallery.model.service.GalleryService;
import com.dongle.gallery.model.vo.GalleryPath;

/**
 * Servlet implementation class GalleryGetServlet
 */
@WebServlet("/galleryGet")
public class GalleryGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GalleryGetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String albumCode = request.getParameter("albumCode");
		int groupNo = Integer.parseInt(request.getParameter("groupNo"));
		String memberId=request.getParameter("memberId");
		System.out.println(albumCode+" "+groupNo+" : "+memberId);
/*		if(list.size()==0)
		{
			request.setAttribute("msg", "등록된 사진이 없습니다.");
			request.setAttribute("loc", "/views/gallery/galleryView.jsp");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}*/		
		
		//페이징 처리하기
		int cPage; //현재 페이지를 의미함 (너가 지금 뭘 보고있는지!)
		try{
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}
		catch(NumberFormatException e)
		{
			//예외처리하기 (null이거나 문자가 들어온 경우 1로 초기화한다)
			cPage=1;
		}
		int numPerPage; //페이지당 보여줄 자료 수 
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}
		catch(NumberFormatException e)
		{
			numPerPage=12;
		}
		//페이지 수 만큼 데이터를 불러오기
		List<GalleryPath> list = new GalleryService().galleryGet(albumCode,groupNo,cPage,numPerPage); //cPage와 numPerPage가 있으면 공식에 의해서 페이징 처리가 가능함
		//실질적인 페이지를 구성해보자
		//전체 자료 수 확인하기
		int totalMember = new GalleryService().selectGalleryCount(albumCode,groupNo);
		//전체 페이지 수 
		int totalPage=(int)Math.ceil((double) totalMember/numPerPage); // 한페이지가 다 차지 않는 나머지 자료들도 보여져야하기 때문에 무조건 올림해야함
		//페이지바 html코드 누적변수(버튼을 구현하는 것-> 코드를 작성해주고 그 텍스트를 그대로 넘겨줄 것)
		String pageBar=" ";
		//페이지바 길이(숫자 몇개까지 보일 것인지)
		int pageBarSize=5;
		//시작 페이지의 위치를 나타냄(공식이있음) -> 다음페이지로 넘겼을 경우 숫자가 커져야하는데 그 기준을 잡는 공식
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1; //끝페이지
		//페이지 바를 구성
		//[이전]
		if(pageNo==1) //첫번째를 의미
		{
			pageBar+="<span>＜&nbsp;</span>";
		}
		else
		{
			pageBar+="<li><a href='"+request.getContextPath()+"/galleryGet?groupNo="+groupNo+"&albumCode="+albumCode+"&memberId="+memberId+"&cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>＜ &nbsp;</a>";
		}
		//선택페이지 만들기
		while(!(pageNo>pageEnd||pageNo>totalPage))
		{
			if(cPage==pageNo)//현재 페이지가 시작페이지랑 같은 경우 고정되어야함
			{
				pageBar+="<span class='cPage'>&nbsp;"+pageNo+"&nbsp;</span>";
			}
			else
			{
				pageBar+="<a href='"+request.getContextPath()+"/galleryGet?groupNo="+groupNo+"&albumCode="+albumCode+"&memberId="+memberId+"&cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+"&nbsp;"+pageNo+"&nbsp;"+"</a>";
			}
			pageNo++;
		}
		//[다음]
		if(pageNo>totalPage)
		{
			pageBar+="<span> &nbsp;＞</span>";
		}
		else {
			pageBar+="<a href='"+request.getContextPath()+"/galleryGet?groupNo="+groupNo+"&albumCode="+albumCode+"&memberId="+memberId+"&cPage="+pageNo+"&numPerPage="+numPerPage+"'>&nbsp;＞</a></li>";
		}
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("pageBar", pageBar);


		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/gallery/galleryView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}