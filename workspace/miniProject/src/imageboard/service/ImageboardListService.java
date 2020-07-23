package imageboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.bean.ImageboardDTO;
import imageboard.bean.ImageboardPaging;
import imageboard.dao.ImageboardDAO;

public class ImageboardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		
		int endNum = pg * 3;
		int startNum = endNum - 2;
		List<ImageboardDAO> list = imageboardDAO.listImageboard(startNum, endNum);
		
		//페이징 처리
		ImageboardPaging imageboardPaging = new ImageboardPaging();
		int totalA = imageboardDAO.getTotalA();
		imageboardPaging.setCurrentPage(pg);
		imageboardPaging.setPageBlock(5);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(totalA);
		imageboardPaging.makePagingHTML();
		request.setAttribute("imageboardPaging", imageboardPaging);
		response.setContentType("text/html;charset=UTF-8");

		request.setAttribute("pg", pg);
		request.setAttribute("list", list);
		request.setAttribute("display", "/imageboard/imageboardList.jsp");
		return "/main/index.jsp";
	}

}
