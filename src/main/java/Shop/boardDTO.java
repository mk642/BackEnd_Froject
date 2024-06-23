package Shop;

import java.sql.Date;

public class boardDTO {
	private int No;
	private String name;
	private String title;
	private String content;
	private int view;
	private Date date;
	
	public boardDTO() {
		
	}
	
	public boardDTO(String title,String name,Date date,int view,String content) {
	
		this.title = title;
		this.name = name;
		this.date = date;
		this.view = view;
		this.content = content;
	}
	
	public boardDTO(int No,String name,String title,int view, Date date) {
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
	
	public boardDTO(String title,String content,int no) {
		this.title = title;
		this.content = content;
		this.No=no;
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
	
	public int getView() {
		return view;
	}
	
	public Date getDate() {
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
	
	public void setView(int view) {
		this.view = view;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public void setNo(int No) {
		this.No = No;
	}
	
}

	
