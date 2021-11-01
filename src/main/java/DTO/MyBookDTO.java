package DTO;

public class MyBookDTO {
	int mbook_seq;
	int book_seq;
	String user_id;
	String reading_ing;
	
	public MyBookDTO(int mbook_seq, int book_seq, String user_id, String reading_ing) {
		super();
		this.mbook_seq = mbook_seq;
		this.book_seq = book_seq;
		this.user_id = user_id;
		this.reading_ing = reading_ing;
	}
	
	public int getMbook_seq() {
		return mbook_seq;
	}
	public int getBook_seq() {
		return book_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getReading_ing() {
		return reading_ing;
	}
	
	
}
