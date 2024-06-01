package Shop;

public class boardDTO {
	private int No;
	private String name;
	private String title;
	private String content;
	private String view;
	private String date;
	
	public boardDTO() {
		
	}
	
	public boardDTO(int No,String name,String title,String view, String date) {
		this.No = No;
		this.name = name;
		this.title = title;
		this.view = view;
		this.date = date;
	}
	public boardDTO(String title,String content) {
		this.title = title;
		this.content = content;
	}
	
	public boardDTO(String name,String title,String content) {
		this.name = name;
		this.title = title;
		this.content = content;
	}
	
	public String getName() {
		return name;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getContent() {
		return content;
	}
	
	public String getView() {
		return view;
	}
	
	public String getDate() {
		return date;
	}
	public int getNo() {
		return No;
	}
	
	
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public void setView(String view) {
		this.view = view;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public void setNo(int No) {
		this.No = No;
	}
	
}

	
