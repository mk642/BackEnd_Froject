package Shop;

import java.sql.Date;

public class commentDTO {
	private int No;
	private String name;
	private String content;
	private int fno;
	private Date date;
	
	public commentDTO() {
		
	}
	
	
	public commentDTO(int No, String name,Date date,String content) {
		this.No = No;
		this.name = name;
		this.date = date;
		this.content = content;
	}
	
	public commentDTO(String name,String content,int fno) {
		this.name = name;
		this.content = content;
		this.fno = fno;
		
	}
	
	public commentDTO(String name,String content,Date date) {
		this.name = name;
		this.content = content;
		this.date = date;
		
	}
	public commentDTO(int No,String name,String title, Date date) {
		this.No = No;
		this.name = name;
		
		this.date = date;
	}
	
	
	public commentDTO(String name,String content) {
		this.name = name;
		
		this.content = content;
	}
	
	public String getName() {
		return name;
	}
	
	public int getFno() {
		return fno;
	}
	
	
	public String getContent() {
		return content;
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
	
	
	
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public void setFno(int fno) {
		this.fno = fno;
	}
	
	public void setNo(int No) {
		this.No = No;
	}
	
}

	
