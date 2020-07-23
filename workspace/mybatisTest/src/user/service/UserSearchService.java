package user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		System.out.println("1.이름 검색     2.아이디 검색");
		System.out.print("> ");

		int choice = scan.nextInt();

		String type = null;
		if (choice == 1) {
			type = "name";
			System.out.print("찾고자 하는 이름 입력 : ");
		} else if (choice == 2) {
			type = "id";
			System.out.print("찾고자 하는 아이디 입력 : ");
		}
		String data = scan.next();

		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("data", data);
		UserDAO userDAO = UserDAO.getInstance();
		List<UserDTO> list = userDAO.search(map);
		
		if (list.size() == 0 && type.equals("name")) {
			System.out.println("찾는 이름이 없습니다.");
			System.out.println();
			return;
		} else if(list.size() == 0 && type.equals("id")) {
			System.out.println("찾는 아이디가 없습니다.");
			System.out.println();
			return;
		}

		for (UserDTO userDTO : list)
			System.out.println(userDTO.getName() + "\t" + userDTO.getId() + "\t" + userDTO.getPwd());
		System.out.println();
	}

}
