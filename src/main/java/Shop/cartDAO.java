package Shop;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class cartDAO {
	
	private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) ctx.lookup("jdbc/jskim");
        Connection con = ds.getConnection(); // 수정된 코드
        return con;
}
    // 싱글톤 패턴을 이용한 인스턴스 생성
    private static cartDAO instance = new cartDAO();
    
    private cartDAO() {}
    
    public static cartDAO getInstance() {
        return instance;
    }

    public void addToCart(int no, HttpSession session) {
        // 세션에서 장바구니 목록을 가져옵니다.
        @SuppressWarnings("unchecked")
        ArrayList<cartDTO> cartList = (ArrayList<cartDTO>) session.getAttribute("cartList");
        
        if (cartList == null) {
            // 세션에 장바구니 목록이 없으면 새로 생성합니다.
            cartList = new ArrayList<>();
            session.setAttribute("cartList", cartList);
        }

        // 상품 정보를 가져옵니다. 이 부분은 실제 DB에서 상품을 가져오는 코드로 대체되어야 합니다.
        cartDTO item = selectOne(no);
        if (item != null) {
            // 장바구니에 상품을 추가합니다.
            cartList.add(item);
        }
    }

    // 상품 번호로 상품 정보를 가져오는 메서드 (예시용)
//    private cartDTO getItemByNo(int no) {
//        // 실제 DB 연결 및 데이터 조회 코드로 대체하세요.
//        // 예시로 하드코딩된 상품 정보 반환
//        cartDTO item = new cartDTO();
//        item.setNo(no);
//        item.setName("Example Item");
//        item.setPrice(10000);
//        item.setImage("example.jpg");
//        item.setContent("This is an example item.");
//        return item;
//    }
    
    public cartDTO selectOne(int No) {
		cartDTO dto = null;
		String sql = "select * from item where No = ?";
		
		try(Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);) 
		{	pstmt.setInt(1, No);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new cartDTO(rs.getInt("No"),rs.getString("name"),rs.getInt("price"),rs.getString("image"),rs.getString("content"));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
    
    
}
