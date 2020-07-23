package user.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService implements UserService{

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		System.out.print("아이디 입력: ");
		String id = scan.next();
		
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO = userDAO.getUser(id);
		
		if(userDTO != null) {
			System.out.println(userDTO.getName() + "\t" + userDTO.getId() + "\t" + userDTO.getPwd());
			System.out.println();
			
			System.out.print("변경할 이름 입력: ");
			String name = scan.next();
			System.out.print("변경할 비밀번호 입력: ");
			String pwd = scan.next();
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("name", name);
			map.put("id", id);
			map.put("pwd", pwd);
			userDAO.modify(map);
			
			System.out.println("수정 완료!!");
			System.out.println();
		} else {
			System.out.println("찾고자 하는 아이디 가없습니다.");
			System.out.println();
			return;
		}
		
	}
}
