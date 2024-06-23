package Shop;

public class LoginnDTO {
    private String email;
    private String name;
    private String pwd;
    private int point;

    // 기본 생성자
    public LoginnDTO() {
    }

    // 파라미터를 받는 생성자
    public LoginnDTO(String email, String name, String pwd) {
        this.email = email;
        this.name = name;
        this.pwd = pwd;
    }
    public LoginnDTO(String email, String name, String pwd, int point) {
        this.email = email;
        this.name = name;
        this.pwd = pwd;
        this.point = point;
    }
    //파라미터를 받는 생성자 (로그인)
    public LoginnDTO(String email, String pwd) {
    	this.email = email;
    	this.pwd = pwd;
    	
    }
    
 

    // Getter와 Setter 메소드
    public String getEmail() {
        return email;
    }
    
    public int getPoint() {
        return point;
    }
    
    public void setPoint(int point) {
        this.point = point;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
