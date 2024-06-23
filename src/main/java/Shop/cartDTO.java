package Shop;

//장바구니 DTO 
public class cartDTO {
    private int no;
    private String name;
    private int price;
    private String image;
    private String content;

    // Getters and Setters
    public int getNo() {
        return no;
    }
    
	public cartDTO(int no, String name, int price, String image,String content) {
		this.no = no;
		this.name = name;
		this.price = price;
		this.image = image;
		this.content = content;
		
	}
    public void setNo(int no) {
        this.no = no;
    }

    public String getName() {
        return name;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
