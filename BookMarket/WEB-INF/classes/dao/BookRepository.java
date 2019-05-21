package dao;

import java.util.ArrayList;

import dto.Book;

public class BookRepository {
	
	ArrayList<Book> listOfBooks = new ArrayList<Book>();
	private static BookRepository instance = new BookRepository();
	
	public BookRepository() {
		Book science = new Book("1", "Bible", 10000, "God", "The best seller all over the world", "unknown", "Religion", 1, 10000, "BC 300", "brand new", "bible.jpg");
		listOfBooks.add(science);
	}
	
	public ArrayList<Book> getAllBooks(){
		return listOfBooks;
	}
	
	public Book getBookById(String bookId) {
		Book bookById = null;
		
		for(int i=0;i<listOfBooks.size();i++) {
			Book book = listOfBooks.get(i);
			if(book != null && book.getBookId()!= null && book.getBookId().contentEquals(bookId)){
				bookById = book;
				break;
			}
		}
		
	
		return bookById;
	}
	public static BookRepository getInstance() {
		return instance;
	}
	public void addBook(Book book) {
		listOfBooks.add(book);
	}
}
