package Shop;

//장바구니 DTO 
public class itemDTO {

	private int no;
	private String name;
	private int price;
	private int inven;
	private String cate;
	private String image;
	private String content;
	
	//기본생성자
	public itemDTO() {

	}
	//파라미터를 받는생성자.
	public itemDTO(int no, String name, int price, int inven, String cate) {
		this.no = no;
		this.name = name;
		this.price = price;
		this.inven = inven;
		this.cate = cate;
	}
	
	public itemDTO(int no, String name, int price, int inven, String cate,String image) {
		this.no = no;
		this.name = name;
		this.price = price;
		this.inven = inven;
		this.cate = cate;
		this.image = image;
	}
	
	public itemDTO(int no, String name, int price, String image,String content) {
		this.no = no;
		this.name = name;
		this.price = price;
		this.image = image;
		this.content = content;
		
	}
	
	public itemDTO(int no, String name, int price, int inven, String cate,String content,String image) {
		this.no = no;
		this.name = name;
		this.price = price;
		this.inven = inven;
		this.cate = cate;
		this.image = image;
		this.content = content;
	}
	
	// 파라미터를 받는생성자(장바구니 삭제기능)
	public itemDTO(int no) {
		this.no = no;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public String getImage() {
		return image;
	}
	public String getContent() {
		return content;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getInven() {
		return inven;
	}
	public void setInven(int inven) {
		this.inven = inven;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
