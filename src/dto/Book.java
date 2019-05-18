package dto;

public class Book {
	
	
	private String bookId;
	private String name;
	private Integer unitPrice;
	private String author;
	private String description;
	private String publisher;
	private String category;
	private long unitInStock;
	private long totalPages;
	private String filename;
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	private int quantity;
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitInStock() {
		return unitInStock;
	}

	public void setUnitInStock(long unitInStock) {
		this.unitInStock = unitInStock;
	}

	public long getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(long totalPages) {
		this.totalPages = totalPages;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	private String releaseDate;
	private String condition;
	
	public Book() {
		
	}

	public Book(String bookId, String name, Integer unitPrice, String author, String description, String publisher,
			String category, long unitInStock, long totalPages, String releaseDate, String condition, String filename) {
		super();
		this.bookId = bookId;
		this.name = name;
		this.unitPrice = unitPrice;
		this.author = author;
		this.description = description;
		this.publisher = publisher;
		this.category = category;
		this.unitInStock = unitInStock;
		this.totalPages = totalPages;
		this.releaseDate = releaseDate;
		this.condition = condition;
		this.filename = filename;
	}
	

}
