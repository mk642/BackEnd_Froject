package Shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

// 장바구니 DAO 
public class itemDAO {
		//커넥션 객체 가져오기 
		private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) ctx.lookup("jdbc/jskim");
        Connection con = ds.getConnection(); 
        return con;
}
		//전송된 데이터를 데이터 베이스에 입력 (item 테이블)
		public void insertItem(itemDTO dto) {
		    String sql = "insert into item(name,price,inven,cate) values(?,?,?,?)";
		    
		    try (Connection con = getConnection(); 
		         PreparedStatement pstmt = con.prepareStatement(sql)) { 
		        
		        pstmt.setString(1, dto.getName());
		        pstmt.setInt(2, dto.getPrice());
		        pstmt.setInt(3, dto.getInven());
		        pstmt.setString(4, dto.getCate());
		        pstmt.executeUpdate();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    	
		}
		
		public ArrayList<itemDTO> list(String cate){
	        ArrayList<itemDTO> dtos = new ArrayList<itemDTO>();
	        String sql = "SELECT no,name,price,inven,cate,content,image FROM item where cate = ?";
	    
	        try (Connection con = getConnection();
			        PreparedStatement pstmt = con.prepareStatement(sql)) { 
	        	
	        		pstmt.setString(1, cate);
	          try(ResultSet rs = pstmt.executeQuery()){
	            while(rs.next()) {
	            	itemDTO dto = new itemDTO(rs.getInt("no"),rs.getString("name"),
	            			rs.getInt("price"),rs.getInt("inven"),rs.getString("cate"),
	            			rs.getString("content"),rs.getString("image"));
	            	
	                dtos.add(dto);
	            }
	          }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return dtos;
	    }
		
		
		public void addToCart(int no, HttpSession session) {
		    // 세션에서 장바구니 목록을 가져옵니다.
		    @SuppressWarnings("unchecked")
			ArrayList<itemDTO> attribute = (ArrayList<itemDTO>) session.getAttribute("cartList");
			ArrayList<itemDTO> cartList = attribute;
		    if (cartList == null) {
		        // 세션에 장바구니 목록이 없으면 새로 생성합니다.
		        cartList = new ArrayList<>();
		        session.setAttribute("cartList", cartList);
		    }

		    // 상품 정보를 가져옵니다.
		    itemDTO item = getItemByNo(no);
		    if (item != null) {
		        // 장바구니에 상품을 추가합니다.
		        cartList.add(item);
		    }
		}

		private itemDTO getItemByNo(int itemNo) {
		    String sql = "SELECT no, name, price, inven, cate FROM item WHERE no = ?";
		    try (Connection connection = getConnection();
		         PreparedStatement statement = connection.prepareStatement(sql)) {
		        statement.setInt(1, itemNo);
		        try (ResultSet resultSet = statement.executeQuery()) {
		            if (resultSet.next()) {
		                int no = resultSet.getInt("no");
		                String name = resultSet.getString("name");
		                int price = resultSet.getInt("price");
		                int inven = resultSet.getInt("inven");
		                String cate = resultSet.getString("cate");
		                return new itemDTO(no, name, price, inven, cate);
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return null;
		}

		
		
		// item 테이블 장바구니 삭제 메서드 
		public void deleteCartItem(itemDTO dto) {
		    String sql = "DELETE FROM item WHERE no = ?";

		    try (Connection con = getConnection();
		         PreparedStatement pstmt = con.prepareStatement(sql)) {
		        // 삭제할 item의 id 설정
		        pstmt.setInt(1, dto.getNo());
		        // SQL 쿼리 실행
		        pstmt.executeUpdate();
		        
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
		
		
		
		
		
		
		
		
	
}
