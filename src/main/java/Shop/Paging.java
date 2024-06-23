/**============
 * Pagingation 기능 구현을 위한 클래스
 * 메소드 : 
 *  - getCount() : 전체 레코드의 갯수
 *  - list(p, numOfRecords):현재 페이지의 레코드를 가져오는 기능
 */

package Shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Paging {
	
	private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) ctx.lookup("jdbc/jskim");
        Connection con = ds.getConnection(); // 수정된 코드
        return con;}
	
	public int getCount() {
	    int count = 0;
	    
	    String sql = "SELECT COUNT(No) AS count FROM forum";
	    
	    try (Connection con = getConnection();
	         Statement stmt = con.createStatement();
	         ResultSet rs = stmt.executeQuery(sql)) {
	        
	        if (rs.next()) {
	            count = rs.getInt("count");
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace(); // 또는 로깅을 통해 예외를 기록
	    }
	    
	    return count;
	}
	
	public ArrayList<boardDTO> list(int p , int numOfRecords){
		
		ArrayList<boardDTO> dtos = new ArrayList<boardDTO>();
		String sql = "SELECT No,name,title,view,date FROM forum order by no asc limit ?,?";
		
		//커넥션 가져오기
		try(Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		
		) {
			pstmt.setInt(1, (p-1)*numOfRecords);
			pstmt.setInt(2, numOfRecords);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
            	boardDTO dto = new boardDTO(rs.getInt("No"),rs.getString("name"),
            			rs.getString("title"),rs.getInt("view"),rs.getDate("date"));
            	
                dtos.add(dto);
            }
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dtos;
	}
}
