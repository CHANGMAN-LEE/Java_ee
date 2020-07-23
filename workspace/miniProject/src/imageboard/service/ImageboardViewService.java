package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;

public class ImageboardViewService implements CommandProcess {

   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      int seq = Integer.parseInt(request.getParameter("seq"));
      //DB 작업
      ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
      ImageboardDTO imageboardDTO = imageboardDAO.getImageboard(seq);
      request.setAttribute("imageboardDTO", imageboardDTO);
      request.setAttribute("display", "/imageboard/imageboardView.jsp");
      
      return "/main/index.jsp";
   }

}