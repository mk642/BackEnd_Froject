package Shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class boardDAO {
	private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) ctx.lookup("jdbc/jskim");
        Connection con = ds.getConnection(); // 수정된 코드
        return con;
}



		public void insertBoard(boardDTO dto) {
		    String sql = "insert into forum(name,title,content) values(?,?,?)";
		
		    try (Connection con = getConnection(); 
		         PreparedStatement pstmt = con.prepareStatement(sql)) { 
		        pstmt.setString(1, dto.getName());
		        pstmt.setString(2, dto.getTitle());
		        pstmt.setString(3, dto.getContent());
		        pstmt.executeUpdate();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    	
		}
		
		
		public ArrayList<boardDTO> list(){
	        ArrayList<boardDTO> dtos = new ArrayList<boardDTO>();
	        String sql = "SELECT No,name,title,view,date FROM forum";
	    
	        try (Connection con = getConnection();
	        		Statement stmt = con.createStatement();
	    			ResultSet rs = stmt.executeQuery(sql);) { 
	    
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
		//게시판 수정
		public void updateBoard(boardDTO dto) {
			String sql = "UPDATE forum SET title = ?, content = ? WHERE No = ?";
		
			try (Connection con = getConnection();
				 PreparedStatement pstmt = con.prepareStatement(sql)) {
				pstmt.setString(1, dto.getTitle());
				pstmt.setString(2, dto.getContent());
				pstmt.setInt(3, dto.getNo());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
//		//게시판 삭제
//		public void deleteBoard(boardDTO dto) {
//			String sql = "DELETE FROM forum WHERE No = ?";
//		
//			try (Connection con = getConnection();
//				 PreparedStatement pstmt = con.prepareStatement(sql)) {
//				pstmt.setInt(1, dto.getNo());
//				pstmt.executeUpdate();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
		
		public void deleteOne(String no) {
			String sql = "delete from comment where fno= ?";
			String sql2 = "DELETE FROM forum WHERE No = ?";
			
			try(Connection con = getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql);
					PreparedStatement pstmt2 = con.prepareStatement(sql2);) 
				{	pstmt.setString(1, no);
					pstmt.executeQuery();
					pstmt2.setString(1, no);
					pstmt2.executeQuery();
					

				} catch (Exception e) {
					e.printStackTrace();
				}
			
		}
		
		public boardDTO selectOne(int No) {
			boardDTO dto = null;
			String sql = "select * from forum where No = ?";
			
			try(Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) 
			{	pstmt.setInt(1, No);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()){
					dto = new boardDTO(rs.getString("title"), rs.getString("name"),rs.getDate("date"),rs.getInt("view"), rs.getString("content"));
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			return dto;
		}
		
		public void updateView(int No) {
			String sql = "update forum  set view = view+1 where No = ?";
			
		
			try(Connection con = getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql);) 
				{	pstmt.setInt(1, No);
					
					
					pstmt.executeQuery();
					

				} catch (Exception e) {
					e.printStackTrace();
				}
		}	
}