package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;

public class ImageboardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String realFolder= request.getServletContext().getRealPath("/storage");
		System.out.println("실제폴더 : " + realFolder);
		MultipartRequest multi = new MultipartRequest(request,realFolder,5*1024*1024,"UTF-8", new DefaultFileRenamePolicy());
		
		ImageboardDTO imageboardDTO = new ImageboardDTO();
		imageboardDTO.setImageId(multi.getParameter("imageId"));
		imageboardDTO.setImageName(multi.getParameter("imageName"));
		imageboardDTO.setImagePrice(Integer.parseInt(multi.getParameter("imagePrice")));
		imageboardDTO.setImageQty(Integer.parseInt(multi.getParameter("imageQty")));
		imageboardDTO.setImageContent(multi.getParameter("imageContent"));
		imageboardDTO.setImage1(multi.getOriginalFileName("image1"));
		
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		imageboardDAO.writeImageboard(imageboardDTO);
		
		request.setAttribute("display", "/imageboard/imageboardWrite.jsp");
		return "/main/index.jsp";
	}

}