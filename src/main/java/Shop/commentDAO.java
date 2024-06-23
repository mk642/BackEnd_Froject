package Shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class commentDAO {
	private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) ctx.lookup("jdbc/jskim");
        Connection con = ds.getConnection(); // 수정된 코드
        return con;
}



		public void insertComment(commentDTO dto,int fno) {
		    String sql = "insert into comment(name,content,fno) values(?,?,?)";
		
		    try (Connection con = getConnection(); 
		         PreparedStatement pstmt = con.prepareStatement(sql)) { 
		        pstmt.setString(1, dto.getName());
		        pstmt.setString(2, dto.getContent());
		        pstmt.setInt(3, fno);
		        pstmt.executeUpdate();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    	
		}
		
		
		public ArrayList<commentDTO> commentList(int no) {
		    ArrayList<commentDTO> dtos = new ArrayList<commentDTO>();
		    String sql = "SELECT name, content, date FROM comment WHERE fno = ?";

		    try (Connection con = getConnection();
		         PreparedStatement pstmt = con.prepareStatement(sql)) {

		        pstmt.setInt(1, no);
		        
		        try (ResultSet rs = pstmt.executeQuery()) {
		            while (rs.next()) {
		                commentDTO dto = new commentDTO(rs.getString("name"), rs.getString("content"),
		                        rs.getDate("date"));
		                dtos.add(dto);
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return dtos;
		
	    }
		//게시판 수정
//		public void updateBoard(commentDTO dto) {
//			String sql = "UPDATE forum SET title = ?, content = ? WHERE No = ?";
//		
//			try (Connection con = getConnection();
//				 PreparedStatement pstmt = con.prepareStatement(sql)) {
//				pstmt.setString(1, dto.getTitle());
//				pstmt.setString(2, dto.getContent());
//				pstmt.setInt(3, dto.getNo());
//				pstmt.executeUpdate();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}		
		//게시판 삭제
		public void deleteBoard(commentDTO dto) {
			String sql = "DELETE FROM forum WHERE No = ?";
		
			try (Connection con = getConnection();
				 PreparedStatement pstmt = con.prepareStatement(sql)) {
				pstmt.setInt(1, dto.getNo());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
//		public commentDTO selectOne(int No) {
//			commentDTO dto = null;
//			String sql = "select * from forum where No = ?";
//			
//			try(Connection con = getConnection();
//				PreparedStatement pstmt = con.prepareStatement(sql);) 
//			{	pstmt.setInt(1, No);
//				ResultSet rs = pstmt.executeQuery();
//				
//				if(rs.next()){
//					dto = new commentDTO(rs.getString("title"), rs.getString("name"),rs.getDate("date"),rs.getInt("view"), rs.getString("content"));
//				}
//
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//
//			return dto;
//		}
//		
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