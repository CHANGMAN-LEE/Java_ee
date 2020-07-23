package member.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

public class CheckPostService implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		request.setCharacterEncoding("UTF-8");
		List<ZipcodeDTO> list = new ArrayList<ZipcodeDTO>();
		List<String[]> ziplist = new ArrayList<String[]>();
		String sido = request.getParameter("sido");
		String sigungu = request.getParameter("sigungu");
		String roadname = request.getParameter("roadname");
		String zipcode = null;
		String address = null;
		
		//DB
		if(sido != null){
			MemberDAO memberDAO = MemberDAO.getInstance();
			list = memberDAO.getZipcodeList(sido, sigungu, roadname);
		}
		
		//응답
		if(list != null) {
			for(ZipcodeDTO zipcodeDTO : list){
				zipcode = zipcodeDTO.getZipcode();
				address = zipcodeDTO.getSido() + " "
					+ zipcodeDTO.getSigungu() + " "
					+ zipcodeDTO.getYubmyundong() + " "
					+ zipcodeDTO.getRi() + " "
					+ zipcodeDTO.getRoadname() + " "
					+ zipcodeDTO.getBuildingname();
				String ar[] = {zipcode, address};
				ziplist.add(ar);
			}
		}
		request.setAttribute("ziplist", ziplist);
		return "/member/checkPost.jsp";
	}
}