package imageboard.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import imageboard.bean.ImageboardDTO;

public class ImageboardDAO {
	private static ImageboardDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public static ImageboardDAO getInstance() {
		if (instance == null) {
			synchronized (ImageboardDAO.class) {
				instance = new ImageboardDAO();
			}
		}
		return instance;
	}
	
	public ImageboardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void writeImageboard(ImageboardDTO imageboardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("imageboardSQL.writeImageboard", imageboardDTO);
		sqlSession.commit();
		sqlSession.close();		
	}

	public List<ImageboardDAO> listImageboard(int startNum, int endNum) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", Integer.toString(startNum));
		map.put("endNum", Integer.toString(endNum));
		List<ImageboardDAO> list = sqlSession.selectList("imageboardSQL.listImageboard", map);
		sqlSession.close();
		return list;
	}

	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("imageboardSQL.getTotalA");
		sqlSession.close();
		return totalA;
	}

	public void deleteImageboard(String seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("imageboardSQL.deleteImageboard", seq);
		sqlSession.commit();
		sqlSession.close();
	}

	public ImageboardDTO getImageboard(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		ImageboardDTO imageboardDTO = new ImageboardDTO();
		imageboardDTO = sqlSession.selectOne("imageboardSQL.getImageboard",seq);
		return imageboardDTO;
	}
}
