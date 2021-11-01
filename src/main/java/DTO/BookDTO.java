package DTO;

public class BookDTO {
	int seq;
	String book_name;
	String author;
	String publisher;
	int book_price;
	int book_salecount;
	String book_category;
	String book_genre;
	String book_link;
	String book_isbn;
	String book_bestdate;
	String book_image1;
	String book_image2;
	
	public BookDTO(int seq, String book_name, String author, String publisher, int book_price, int book_salecount,
			String book_category, String book_genre, String book_link, String book_isbn, String book_bestdate,
			String book_image1, String book_image2) {
		this.seq = seq;
		this.book_name = book_name;
		this.author = author;
		this.publisher = publisher;
		this.book_price = book_price;
		this.book_salecount = book_salecount;
		this.book_category = book_category;
		this.book_genre = book_genre;
		this.book_link = book_link;
		this.book_isbn = book_isbn;
		this.book_bestdate = book_bestdate;
		this.book_image1 = book_image1;
		this.book_image2 = book_image2;
	}
	
	public BookDTO(int seq, String book_name, String author, String publisher, int book_price, int book_salecount,
			String book_category, String book_genre, String book_link, 
			String book_image1, String book_image2) {
		this.seq = seq;
		this.book_name = book_name;
		this.author = author;
		this.publisher = publisher;
		this.book_price = book_price;
		this.book_salecount = book_salecount;
		this.book_category = book_category;
		this.book_genre = book_genre;
		this.book_link = book_link;
		this.book_image1 = book_image1;
		this.book_image2 = book_image2;
	}
	
	public int getSeq() {
		return seq;
	}
	public String getBook_name() {
		return book_name;
	}
	public String getAuthor() {
		return author;
	}
	public String getPublisher() {
		return publisher;
	}
	public int getBook_price() {
		return book_price;
	}
	public int getBook_salecount() {
		return book_salecount;
	}
	public String getBook_category() {
		return book_category;
	}
	public String getBook_genre() {
		return book_genre;
	}
	public String getBook_link() {
		return book_link;
	}
	public String getBook_isbn() {
		return book_isbn;
	}
	public String getBook_bestdate() {
		return book_bestdate;
	}
	public String getBook_image1() {
		return book_image1;
	}
	public String getBook_image2() {
		return book_image2;
	}
	
	
}
