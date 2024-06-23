package Shop;

import javax.naming.Context;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
public class LoginnDAO {
    // Connection 객체를 가져오기
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) ctx.lookup("jdbc/jskim");
        Connection con = ds.getConnection(); // 수정된 코드
        return con;
    }

    
    // 전송된 데이터를 데이터베이스에 입력
    
    public void insert(LoginnDTO dto) {
        String sql = "insert into loginn(email,name,pwd) values(?,?,?)";

        try (Connection con = getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) { 
            pstmt.setString(1, dto.getEmail());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getPwd());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //데이터베이스에 있는 데이터 가져오기
    public ArrayList<LoginnDTO> list(){
        ArrayList<LoginnDTO> dtos = new ArrayList<LoginnDTO>();
        String sql = "SELECT email, pwd, name FROM loginn";
    
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql); // PreparedStatement 사용
             ResultSet rs = pstmt.executeQuery()) { 
    
            while(rs.next()) {
            	LoginnDTO dto = new LoginnDTO();
                dto.setEmail(rs.getString("email"));
                dto.setPwd(rs.getString("pwd"));
                dto.setName(rs.getString("name"));
                dtos.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dtos;
    }
    
    public LoginnDTO selectOne(String email) {
    	LoginnDTO dto = null;
    	String sql = "select * from loginn where email =? ";
    	try(Connection con =getConnection()) {
    		PreparedStatement pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, email);
    		ResultSet rs = pstmt.executeQuery();
    		
    		if(rs.next()) {
    			 dto = new LoginnDTO(rs.getString("email"),rs.getString("pwd"),rs.getString("name"),rs.getInt("point"));
    		}
    		
    		} catch (Exception e) {
			e.printStackTrace();
		}
    	return dto;
    }
    
   
 // 로그인 데이터 변경 메서드
    public void update(LoginnDTO dto) {
        String sql = "update loginn set name = ?, pwd = ? where email = ?";

        try (Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getPwd());
            pstmt.setString(3, dto.getEmail());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void buy(LoginnDTO dto,int price) {
        String sql = "update loginn set point = ? where email = ?";

        try (Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, dto.getPoint()-price);
            pstmt.setString(2, dto.getEmail());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 로그인 데이터 삭제 메서드
    public void delete(String email) {
        String sql = "delete from loginn where email = ?";

        try (Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, email);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //로그인검증 메서드 
    public boolean validateUser(LoginnDTO dto) {
        String sql = "SELECT * FROM Loginn WHERE email=? AND pwd=?";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, dto.getEmail());
            pstmt.setString(2, dto.getPwd());
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public String userName(LoginnDTO dto) {
    	String sql = "SELECT name FROM Loginn WHERE email=? AND pwd=?";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, dto.getEmail());
            pstmt.setString(2, dto.getPwd());
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String name = rs.getString("name");
                    return name;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // 만약 이름 값을 찾지 못하면 null 반환
    }
   

    // 사용자 존재 여부에 따라 다른 처리를 수행하는 메소드
    
}
     

