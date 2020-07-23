package user.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService{

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		System.out.print("삭제할 아이디 입력: ");
		String id = scan.next();
		
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO = userDAO.getUser(id);
		
		if(userDTO != null) {
			System.out.println(userDTO.getName() + "\t" + userDTO.getId() + "\t" + userDTO.getPwd());
			System.out.println();
		
			userDAO.delete(id);
			
			System.out.println("삭제 완료!!");
			System.out.println();
		} else {
			System.out.println("삭제하려는 아이디 가없습니다.");
			System.out.println();
			return;
		}
	}

}
