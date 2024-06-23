<%@page import="Shop.Paging"%>
<%@page import="Shop.boardDAO"%>
<%@page import="Shop.boardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
    

<!DOCTYPE html>
<html>
  <head>
    <title>PartsSale - 게시판</title>
    <link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		
    <meta property="og:title" content="Page1 - Mobillio Online Store1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <meta property="twitter:card" content="summary_large_image" />
    <%
    int numOfRecords = 1;
	int numOfPages = 5;
	int startNum=1;
	int lastNum;
	int p = 1;
	
	Paging paging = new Paging();
	int count = paging.getCount();
	
	//현재 페이지 getParameter로 확보
	String page_ = request.getParameter("p");
	
	if(page_ != null && !page_.equals("")) { 
		p = Integer.parseInt(page_);
	}
	
	boardDAO dao = new boardDAO();
	//ArrayList<MemberDTO> dtos = dao.list();
	
	//lastNum  마지막페이지 (올림하여서 사용)
	lastNum = (int)Math.ceil((double)count/numOfRecords);
	
	//startNum 
	
	startNum= p - (p-1) % numOfPages;
	

	ArrayList<boardDTO> dtoa = dao.list();
	ArrayList<boardDTO> dtos = paging.list(p,numOfRecords);
	
	%>
    
     <script src="../css/navbarLoad.js"></script>

    <style data-tag="reset-style-sheet">
      html {  line-height: 1.15;}body {  margin: 0;}* {  box-sizing: border-box;  border-width: 0;  border-style: solid;}p,li,ul,pre,div,h1,h2,h3,h4,h5,h6,figure,
quote,figcaption {  margin: 0;  padding: 0;}button {  background-color: transparent;}button,input,optgroup,select,textarea {  font-family: inherit;  font-size: 100%;  line-height: 1.15;  margin: 0;}button,select {  text-transform: none;}button,[type="button"],[type="reset"],[type="submit"] {  -webkit-appearance: button;}button::-moz-focus-inner,[type="button"]::-moz-focus-inner,[type="reset"]::-moz-focus-inner,[type="submit"]::-moz-focus-inner {  border-style: none;  padding: 0;}button:-moz-focus,[type="button"]:-moz-focus,[type="reset"]:-moz-focus,[type="submit"]:-moz-focus {  outline: 1px dotted ButtonText;}a {  color: inherit;  text-decoration: inherit;}input {  padding: 2px 4px;}img {  display: block;}html { scroll-behavior: smooth  }
    </style>
    <style data-tag="default-style-sheet">
      html {
        font-family: Jost;
        font-size: 20px;
      }

      body {
        font-weight: 400;
        font-style:normal;
        text-decoration: undefined;
        text-transform: undefined;
        letter-spacing: 0.02;
        line-height: 1.55;
        color: var(--dl-color-gray-black);
        background-color: var(--dl-color-gray-white);

        fill: var(--dl-color-gray-black);
      }
    </style>
    <link
      rel="stylesheet"
      href="https://unpkg.com/animate.css@4.1.1/animate.css"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://unpkg.com/@teleporthq/teleport-custom-scripts/dist/style.css"
    />
  </head>
  <body>
    <link rel="stylesheet" href="../css/style.css" />
    <link href="../css/page1.css" rel="stylesheet" />
    <div>
      

      <div class="page1-container">
        <div class="page1-navbar">
          <header data-role="Header" class="page1-header ">
            <div id="navbar"></div>
            <div data-role="MobileMenu" class="page1-mobile-menu">
              
              <div>
                <svg viewBox="0 0 950.8571428571428 1024" class="page1-icon04">
                  <path
                    d="M925.714 233.143c-25.143 36.571-56.571 69.143-92.571 95.429 0.571 8 0.571 16 0.571 24 0 244-185.714 525.143-525.143 525.143-104.571 0-201.714-30.286-283.429-82.857 14.857 1.714 29.143 2.286 44.571 2.286 86.286 0 165.714-29.143 229.143-78.857-81.143-1.714-149.143-54.857-172.571-128 11.429 1.714 22.857 2.857 34.857 2.857 16.571 0 33.143-2.286 48.571-6.286-84.571-17.143-148-91.429-148-181.143v-2.286c24.571 13.714 53.143 22.286 83.429 23.429-49.714-33.143-82.286-89.714-82.286-153.714 0-34.286 9.143-65.714 25.143-93.143 90.857 112 227.429 185.143 380.571 193.143-2.857-13.714-4.571-28-4.571-42.286 0-101.714 82.286-184.571 184.571-184.571 53.143 0 101.143 22.286 134.857 58.286 41.714-8 81.714-23.429 117.143-44.571-13.714 42.857-42.857 78.857-81.143 101.714 37.143-4 73.143-14.286 106.286-28.571z"
                  ></path></svg
                ><svg viewBox="0 0 877.7142857142857 1024" class="page1-icon06">
                  <path
                    d="M585.143 512c0-80.571-65.714-146.286-146.286-146.286s-146.286 65.714-146.286 146.286 65.714 146.286 146.286 146.286 146.286-65.714 146.286-146.286zM664 512c0 124.571-100.571 225.143-225.143 225.143s-225.143-100.571-225.143-225.143 100.571-225.143 225.143-225.143 225.143 100.571 225.143 225.143zM725.714 277.714c0 29.143-23.429 52.571-52.571 52.571s-52.571-23.429-52.571-52.571 23.429-52.571 52.571-52.571 52.571 23.429 52.571 52.571zM438.857 152c-64 0-201.143-5.143-258.857 17.714-20 8-34.857 17.714-50.286 33.143s-25.143 30.286-33.143 50.286c-22.857 57.714-17.714 194.857-17.714 258.857s-5.143 201.143 17.714 258.857c8 20 17.714 34.857 33.143 50.286s30.286 25.143 50.286 33.143c57.714 22.857 194.857 17.714 258.857 17.714s201.143 5.143 258.857-17.714c20-8 34.857-17.714 50.286-33.143s25.143-30.286 33.143-50.286c22.857-57.714 17.714-194.857 17.714-258.857s5.143-201.143-17.714-258.857c-8-20-17.714-34.857-33.143-50.286s-30.286-25.143-50.286-33.143c-57.714-22.857-194.857-17.714-258.857-17.714zM877.714 512c0 60.571 0.571 120.571-2.857 181.143-3.429 70.286-19.429 132.571-70.857 184s-113.714 67.429-184 70.857c-60.571 3.429-120.571 2.857-181.143 2.857s-120.571 0.571-181.143-2.857c-70.286-3.429-132.571-19.429-184-70.857s-67.429-113.714-70.857-184c-3.429-60.571-2.857-120.571-2.857-181.143s-0.571-120.571 2.857-181.143c3.429-70.286 19.429-132.571 70.857-184s113.714-67.429 184-70.857c60.571-3.429 120.571-2.857 181.143-2.857s120.571-0.571 181.143 2.857c70.286 3.429 132.571 19.429 184 70.857s67.429 113.714 70.857 184c3.429 60.571 2.857 120.571 2.857 181.143z"
                  ></path></svg
                ><svg viewBox="0 0 602.2582857142856 1024" class="page1-icon08">
                  <path
                    d="M548 6.857v150.857h-89.714c-70.286 0-83.429 33.714-83.429 82.286v108h167.429l-22.286 169.143h-145.143v433.714h-174.857v-433.714h-145.714v-169.143h145.714v-124.571c0-144.571 88.571-223.429 217.714-223.429 61.714 0 114.857 4.571 130.286 6.857z"
                  ></path>
                </svg>
              </div>
            </div>
          </header>
        </div>
        <div class="page1-navbar1"></div>
        
        <div class="page1-faq9">
          <div class="faq1-faq7 thq-section-padding">
            <div class="faq1-max-width thq-section-max-width">
              <div class="faq1-container">
                <h2 class="faq1-text thq-heading-2">
                  <span>자유 게시판</span>
                </h2>
                <div class="faq1-container1">
                  
                  <p class="faq1-text01 thq-body-large">
                    <span>
                      회원간 자유로운 주제로 이야기를 나누는 게시판입니다.
                    </span>
                  </p>
                </div>
                 <a
                  href="writeBoard.jsp"
                  class="faq1-action1 thq-button-filled"
                >
                  <span>글쓰기</span>
                </a>
			 </div>
					              
				
             <div class="container">
		
				<table class="table table-striped table-hover">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>날짜</th>
					</tr>
					<%
					//5. 결과집합 처리 
					for(boardDTO dto : dtos){
					%>
					<tr>
						<td><%=dto.getNo() %></td>
						<td><a href="content.jsp?id=<%=dto.getNo()%>"><%=dto.getTitle()%></a></td>
						<td><%=dto.getName()%></td>
						<td><%=dto.getView()%></td>
						<td><%=dto.getDate()%></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
			
					<div class="container">
			
		  
		    <ul class="pagination justify-content-center">
		    <!-- 이전 화면 구현 -->
			<% if (p <= 1) { %>
    <li class="page-item"><a class="page-link" href="#" onclick="alert('이전 페이지가 없습니다')">Prev</a></li>
<% } else { %>
    <li class="page-item"><a class="page-link" href="?p=<%= Math.max(1, startNum - numOfPages) %>">Prev</a></li>
<% } %>

<% for (int i = startNum; i <= Math.min(startNum + numOfPages - 1, lastNum); i++) { %>
    <% if (i == p) { %>
        <li class="page-item active"><a class="page-link" href="?p=<%= i %>"><%= i %></a></li>
    <% } else { %>
        <li class="page-item"><a class="page-link" href="?p=<%= i %>"><%= i %></a></li>
    <% } %>
<% } %>

<% if (p >= lastNum) { %>
    <li class="page-item"><a class="page-link" href="#" onclick="alert('다음 페이지가 없습니다')">Next</a></li>
<% } else { %>
    <li class="page-item"><a class="page-link" href="?p=<%= p + 1 %>">Next</a></li>
<% } %>
		  </ul>
		  </div>
                 
              
              </div>
              
             
            </div>
          </div>
        </div>
        <div class="page1-contact10"></div>
        <div class="page1-footer11"></div>
      </div>
    </div>
    <script
      defer=""
      src="https://unpkg.com/@teleporthq/teleport-custom-scripts"
    ></script>
  </body>
</html>