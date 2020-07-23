package guestbook.bean;

import lombok.Data;

@Data
public class GuestbookDTO {
	private String name, email, page, title, content, date;
	public int seq;
}
