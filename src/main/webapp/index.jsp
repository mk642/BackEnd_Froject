<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.DataSource"%>
<!DOCTYPE html>
<html>
 <head>
  <script src="navbarLoad.js"></script>
    <title>PartsSale - 컴퓨터 부품은 PartsSale</title>
    <meta property="og:title" content="Mobillio Online Store1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <meta property="twitter:card" content="summary_large_image" />

    <style data-tag="reset-style-sheet">
      html {  line-height: 1.15;}body {  margin: 0;}* {  box-sizing: border-box;  border-width: 0;  border-style: solid;}p,li,ul,pre,div,h1,h2,h3,h4,h5,h6,figure,blockquote,figcaption {  margin: 0;  padding: 0;}button {  background-color: transparent;}button,input,optgroup,select,textarea {  font-family: inherit;  font-size: 100%;  line-height: 1.15;  margin: 0;}button,select {  text-transform: none;}button,[type="button"],[type="reset"],[type="submit"] {  -webkit-appearance: button;}button::-moz-focus-inner,[type="button"]::-moz-focus-inner,[type="reset"]::-moz-focus-inner,[type="submit"]::-moz-focus-inner {  border-style: none;  padding: 0;}button:-moz-focus,[type="button"]:-moz-focus,[type="reset"]:-moz-focus,[type="submit"]:-moz-focus {  outline: 1px dotted ButtonText;}a {  color: inherit;  text-decoration: inherit;}input {  padding: 2px 4px;}img {  display: block;}html { scroll-behavior: smooth  }
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
    <link rel="stylesheet" href="./css/style.css" />
    <div>
      <link href="./css/index.css" rel="stylesheet" />

      <div class="page4-container">
        <div class="page4-navbar">
          <header data-role="Header" class="page4-header max-width-container">
            <div class="page4-container1">
              <div data-role="BurgerMenu" class="page4-burger-menu">
                <svg viewBox="0 0 1024 1024" class="page4-icon">
                  <path
                    d="M128 554.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 298.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667zM128 810.667h768c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-768c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667z"
                  ></path>
                </svg>
              </div>
              <div class="page4-navbar1">
                <a href="index.jsp" class="page4-logo-center navbar-logo-title">
                  PartsSale
                </a>
                <div class="page4-middle">
                  <div class="page4-left">
                    <span class="page4-text navbar-link" OnClick="location.href='./login/warring.jsp'">
                      <span>그래픽카드</span>
                      <br />
                    </span>
                    <span class="page4-text03 navbar-link" OnClick="location.href='./login/warring.jsp'">
                      <span>CPU</span>
                      <br />
                    </span>
                    <span class="page4-text06 navbar-link" OnClick="location.href='./login/warring.jsp'">메인보드</span>
                  </div>
                  <input
                    type="text"
                    placeholder="search"
                    class="page4-textinput input"
                  />
                  <div class="page4-right">
                    <img
                      alt="search3271286"
                      src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0nMjQnIGhlaWdodD0nMjQnIHZpZXdCb3g9JzAgMCAyNCAyNCcgZmlsbD0nbm9uZScgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJz4KPHBhdGggZmlsbC1ydWxlPSdldmVub2RkJyBjbGlwLXJ1bGU9J2V2ZW5vZGQnIGQ9J00xOC4zMTkgMTQuNDMyNkMyMC43NjI4IDExLjI5NDEgMjAuNTQyIDYuNzUzNDQgMTcuNjU2OSAzLjg2ODI2QzE0LjUzMjcgMC43NDQwNjcgOS40NjczNCAwLjc0NDA2NyA2LjM0MzE1IDMuODY4MjZDMy4yMTg5NSA2Ljk5MjQ2IDMuMjE4OTUgMTIuMDU3OCA2LjM0MzE1IDE1LjE4MkM5LjIyODMzIDE4LjA2NzIgMTMuNzY5IDE4LjI4NzkgMTYuOTA3NSAxNS44NDQyQzE2LjkyMSAxNS44NTk0IDE2LjkzNTEgMTUuODc0NCAxNi45NDk3IDE1Ljg4OTFMMjEuMTkyNCAyMC4xMzE3QzIxLjU4MjkgMjAuNTIyMiAyMi4yMTYxIDIwLjUyMjIgMjIuNjA2NiAyMC4xMzE3QzIyLjk5NzEgMTkuNzQxMiAyMi45OTcxIDE5LjEwOCAyMi42MDY2IDE4LjcxNzVMMTguMzY0IDE0LjQ3NDlDMTguMzQ5MyAxNC40NjAyIDE4LjMzNDMgMTQuNDQ2MSAxOC4zMTkgMTQuNDMyNlpNMTYuMjQyNiA1LjI4MjQ4QzE4LjU4NTggNy42MjU2MiAxOC41ODU4IDExLjQyNDYgMTYuMjQyNiAxMy43Njc4QzEzLjg5OTUgMTYuMTEwOSAxMC4xMDA1IDE2LjExMDkgNy43NTczNiAxMy43Njc4QzUuNDE0MjEgMTEuNDI0NiA1LjQxNDIxIDcuNjI1NjIgNy43NTczNiA1LjI4MjQ4QzEwLjEwMDUgMi45MzkzMyAxMy44OTk1IDIuOTM5MzMgMTYuMjQyNiA1LjI4MjQ4WicgZmlsbD0nYmxhY2snLz4KPC9zdmc+Cg=="
                      class="page4-image"
                    />
                    <span class="navbar-link" OnClick="location.href='./login/warring.jsp'">RAM</span>
                    <span class="navbar-link" OnClick="location.href='./login/warring.jsp'">HDD/SSD</span>
                    <span class="navbar-link" OnClick="location.href='./login/warring.jsp'">케이스</span>
                    <span class="navbar-link" OnClick="location.href='./login/warring.jsp'">게시판</span>
                  </div>
                </div>
                <div class="page4-icons">
                 <a href="./login/warring.jsp" class="page4-navlink1">
                  <img
                    alt="iconsbxscart3271299"
                    src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0nMjQnIGhlaWdodD0nMjQnIHZpZXdCb3g9JzAgMCAyNCAyNCcgZmlsbD0nbm9uZScgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJz4KPHBhdGggZD0nTTIxLjgyMiA3LjQzMUMyMS42MzUgNy4xNjEgMjEuMzI4IDcgMjEgN0g3LjMzM0w2LjE3OSA0LjIzQzUuODY3IDMuNDgyIDUuMTQzIDMgNC4zMzMgM0gyVjVINC4zMzNMOS4wNzcgMTYuMzg1QzkuMjMyIDE2Ljc1NyA5LjU5NiAxNyAxMCAxN0gxOEMxOC40MTcgMTcgMTguNzkgMTYuNzQxIDE4LjkzNyAxNi4zNTJMMjEuOTM3IDguMzUyQzIyLjA1MiA4LjA0NCAyMi4wMDkgNy43IDIxLjgyMiA3LjQzMVonIGZpbGw9JyMxNjE2MTYnLz4KPHBhdGggZD0nTTEwLjUgMjFDMTEuMzI4NCAyMSAxMiAyMC4zMjg0IDEyIDE5LjVDMTIgMTguNjcxNiAxMS4zMjg0IDE4IDEwLjUgMThDOS42NzE1NyAxOCA5IDE4LjY3MTYgOSAxOS41QzkgMjAuMzI4NCA5LjY3MTU3IDIxIDEwLjUgMjFaJyBmaWxsPScjMTYxNjE2Jy8+CjxwYXRoIGQ9J00xNy41IDIxQzE4LjMyODQgMjEgMTkgMjAuMzI4NCAxOSAxOS41QzE5IDE4LjY3MTYgMTguMzI4NCAxOCAxNy41IDE4QzE2LjY3MTYgMTggMTYgMTguNjcxNiAxNiAxOS41QzE2IDIwLjMyODQgMTYuNjcxNiAyMSAxNy41IDIxWicgZmlsbD0nIzE2MTYxNicvPgo8L3N2Zz4K"
                    class="page4-image1"
                  />
                  <img
                    alt="iconsbxsheartcircle3271300"
                    src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0nMjQnIGhlaWdodD0nMjQnIHZpZXdCb3g9JzAgMCAyNCAyNCcgZmlsbD0nbm9uZScgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJz4KPHBhdGggZD0nTTEyIDJDNi40ODYgMiAyIDYuNDg2IDIgMTJDMiAxNy41MTQgNi40ODYgMjIgMTIgMjJDMTcuNTE0IDIyIDIyIDE3LjUxNCAyMiAxMkMyMiA2LjQ4NiAxNy41MTQgMiAxMiAyWk0xNi4xODYgMTIuNzRMMTIgMTYuOTI2TDcuODE0IDEyLjc0QzYuNzI1IDExLjY1MiA2LjcyNSA5LjkyNyA3LjgxNCA4LjgzM0M4LjkwOCA3Ljc0NSAxMC42MzIgNy43NDUgMTEuNzIgOC44MzNMMTIgOS4xMTJMMTIuMjc5IDguODMzQzEzLjM2NyA3Ljc0NSAxNS4wOTIgNy43NDUgMTYuMTg1IDguODMzQzE3LjI3NCA5LjkyNyAxNy4yNzQgMTEuNjUxIDE2LjE4NiAxMi43NFonIGZpbGw9JyMxNjE2MTYnLz4KPC9zdmc+Cg=="
                    class="page4-image2"
                  />
                  <a href="./login/login.jsp" class="page4-navlink1">
                    <img
                      alt="AccountCircle3271301"
                      src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0nMjQnIGhlaWdodD0nMjQnIHZpZXdCb3g9JzAgMCAyNCAyNCcgZmlsbD0nbm9uZScgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJz4KPHBhdGggZD0nTTEyIDJDNi40OCAyIDIgNi40OCAyIDEyQzIgMTcuNTIgNi40OCAyMiAxMiAyMkMxNy41MiAyMiAyMiAxNy41MiAyMiAxMkMyMiA2LjQ4IDE3LjUyIDIgMTIgMlpNMTIgNUMxMy42NiA1IDE1IDYuMzQgMTUgOEMxNSA5LjY2IDEzLjY2IDExIDEyIDExQzEwLjM0IDExIDkgOS42NiA5IDhDOSA2LjM0IDEwLjM0IDUgMTIgNVpNMTIgMTkuMkM5LjUgMTkuMiA3LjI5IDE3LjkyIDYgMTUuOThDNi4wMyAxMy45OSAxMCAxMi45IDEyIDEyLjlDMTMuOTkgMTIuOSAxNy45NyAxMy45OSAxOCAxNS45OEMxNi43MSAxNy45MiAxNC41IDE5LjIgMTIgMTkuMlonIGZpbGw9JyMxNjE2MTYnLz4KPC9zdmc+Cg=="
                      class="page4-image3"
                    />
                  </a>
                </div>
              </div>
            </div>
            <div data-role="MobileMenu" class="page4-mobile-menu">
              <div class="page4-nav">
                <div class="page4-container2">
                  <span class="page4-logo-center1">MOBILLIO</span>
                  <div
                    data-role="CloseMobileMenu"
                    class="page4-close-mobile-menu"
                  >
                    <svg viewBox="0 0 1024 1024" class="page4-icon02">
                      <path
                        d="M810 274l-238 238 238 238-60 60-238-238-238 238-60-60 238-238-238-238 60-60 238 238 238-238z"
                      ></path>
                    </svg>
                  </div>
                </div>
                <div class="page4-middle1">
                  <span class="page4-text10">SHOP</span>
                  <span class="page4-text11">LOOKBOOK</span>
                  <span class="page4-text12">SPECIAL</span>
                  <span class="page4-text13">ABOUT</span>
                  <span class="page4-text14">BLOG</span>
                  <span class="page4-text15">CONTACT</span>
                </div>
              </div>
              <div>
                <svg viewBox="0 0 950.8571428571428 1024" class="page4-icon04">
                  <path
                    d="M925.714 233.143c-25.143 36.571-56.571 69.143-92.571 95.429 0.571 8 0.571 16 0.571 24 0 244-185.714 525.143-525.143 525.143-104.571 0-201.714-30.286-283.429-82.857 14.857 1.714 29.143 2.286 44.571 2.286 86.286 0 165.714-29.143 229.143-78.857-81.143-1.714-149.143-54.857-172.571-128 11.429 1.714 22.857 2.857 34.857 2.857 16.571 0 33.143-2.286 48.571-6.286-84.571-17.143-148-91.429-148-181.143v-2.286c24.571 13.714 53.143 22.286 83.429 23.429-49.714-33.143-82.286-89.714-82.286-153.714 0-34.286 9.143-65.714 25.143-93.143 90.857 112 227.429 185.143 380.571 193.143-2.857-13.714-4.571-28-4.571-42.286 0-101.714 82.286-184.571 184.571-184.571 53.143 0 101.143 22.286 134.857 58.286 41.714-8 81.714-23.429 117.143-44.571-13.714 42.857-42.857 78.857-81.143 101.714 37.143-4 73.143-14.286 106.286-28.571z"
                  ></path></svg
                ><svg viewBox="0 0 877.7142857142857 1024" class="page4-icon06">
                  <path
                    d="M585.143 512c0-80.571-65.714-146.286-146.286-146.286s-146.286 65.714-146.286 146.286 65.714 146.286 146.286 146.286 146.286-65.714 146.286-146.286zM664 512c0 124.571-100.571 225.143-225.143 225.143s-225.143-100.571-225.143-225.143 100.571-225.143 225.143-225.143 225.143 100.571 225.143 225.143zM725.714 277.714c0 29.143-23.429 52.571-52.571 52.571s-52.571-23.429-52.571-52.571 23.429-52.571 52.571-52.571 52.571 23.429 52.571 52.571zM438.857 152c-64 0-201.143-5.143-258.857 17.714-20 8-34.857 17.714-50.286 33.143s-25.143 30.286-33.143 50.286c-22.857 57.714-17.714 194.857-17.714 258.857s-5.143 201.143 17.714 258.857c8 20 17.714 34.857 33.143 50.286s30.286 25.143 50.286 33.143c57.714 22.857 194.857 17.714 258.857 17.714s201.143 5.143 258.857-17.714c20-8 34.857-17.714 50.286-33.143s25.143-30.286 33.143-50.286c22.857-57.714 17.714-194.857 17.714-258.857s5.143-201.143-17.714-258.857c-8-20-17.714-34.857-33.143-50.286s-30.286-25.143-50.286-33.143c-57.714-22.857-194.857-17.714-258.857-17.714zM877.714 512c0 60.571 0.571 120.571-2.857 181.143-3.429 70.286-19.429 132.571-70.857 184s-113.714 67.429-184 70.857c-60.571 3.429-120.571 2.857-181.143 2.857s-120.571 0.571-181.143-2.857c-70.286-3.429-132.571-19.429-184-70.857s-67.429-113.714-70.857-184c-3.429-60.571-2.857-120.571-2.857-181.143s-0.571-120.571 2.857-181.143c3.429-70.286 19.429-132.571 70.857-184s113.714-67.429 184-70.857c60.571-3.429 120.571-2.857 181.143-2.857s120.571-0.571 181.143 2.857c70.286 3.429 132.571 19.429 184 70.857s67.429 113.714 70.857 184c3.429 60.571 2.857 120.571 2.857 181.143z"
                  ></path></svg
                ><svg viewBox="0 0 602.2582857142856 1024" class="page4-icon08">
                  <path
                    d="M548 6.857v150.857h-89.714c-70.286 0-83.429 33.714-83.429 82.286v108h167.429l-22.286 169.143h-145.143v433.714h-174.857v-433.714h-145.714v-169.143h145.714v-124.571c0-144.571 88.571-223.429 217.714-223.429 61.714 0 114.857 4.571 130.286 6.857z"
                  ></path>
                </svg>
              </div>
            </div>
          </header>
        </div>
        <div class="page4-main">
          <div class="page4-hero section-container">
            <div class="page4-max-width max-width-container">
              <div class="page4-hero1">
                <div class="page4-container3">
                  <div class="page4-info">
                    <img
                      alt="Rectangle43271305"
                      src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0nMicgaGVpZ2h0PSc1Micgdmlld0JveD0nMCAwIDIgNTInIGZpbGw9J25vbmUnIHhtbG5zPSdodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2Zyc+CjxyZWN0IHdpZHRoPScyJyBoZWlnaHQ9JzUyJyBmaWxsPSdibGFjaycgZmlsbC1vcGFjaXR5PScwLjUnLz4KPC9zdmc+Cg=="
                      class="page4-image4"
                    />
                    <span class="page4-text16">
                      <span>TODAY</span>
                      <br />
                      <span>suggestion</span>
                      <br />
                    </span>
                  </div>
                  <h1 class="page4-text21">GeForce RTX 4090</h1>
                  <div class="page4-container4">
                    <span class="page4-text22">FROM</span>
                    <span class="page4-text23">KRW 2,630,000</span>
                  </div>
                  <div class="page4-btn-group">
                    <button type="submit" class="button">
                      <span>
                        <span>지금 구매하기</span>
                        <br />
                      </span>
                    </button>
                  </div>
                </div>
                <img
                  alt="image"
                  src="./image/4070.jpg"
                  class="page4-image5"
                />
              </div>
            </div>
          </div>
        </div>
        <div class="page10-container05">
          <div class="page10-container06">
            <div class="page10-container07">
              <h1 class="page10-text28">상품</h1>
              <div class="page10-container08">
                <div
                  data-thq="slider"
                  data-autoplay="true"
                  data-navigation="true"
                  data-pagination="true"
                  data-autoplay-delay="4000"
                  class="page10-slider swiper"
                >
                  <div data-thq="slider-wrapper" class="swiper-wrapper">
                    <div
                      data-thq="slider-slide"
                      class="page10-slider-slide swiper-slide"
                    >
                      <a href="page2.html" class="page10-navlink4">
                        <img
                          alt="image"
                          src="./image/4070ti-500w.webp"
                          class="page10-image06"
                        />
                      </a>
                    </div>
                    <div
                      data-thq="slider-slide"
                      class="page10-slider-slide1 swiper-slide"
                    >
                      <img
                        alt="image"
                        src="./image/4060.png"
                        class="page10-image07"
                      />
                    </div>
                    <div
                      data-thq="slider-slide"
                      class="page10-slider-slide2 swiper-slide"
                    >
                      <img
                        alt="image"
                        src="./image/7600.png"
                        class="page10-image08"
                      />
                    </div>
                    <div
                      data-thq="slider-slide"
                      class="page10-slider-slide3 swiper-slide"
                    >
                      <img
                        alt="image"
                        src="./image/gigabyte 4070-900h.png"
                        class="page10-image09"
                      />
                    </div>
                  </div>
                  <div
                    data-thq="slider-pagination"
                    class="page10-slider-pagination swiper-pagination swiper-pagination-bullets swiper-pagination-horizontal"
                  >
                    <div
                      data-thq="slider-pagination-bullet"
                      class="swiper-pagination-bullet swiper-pagination-bullet-active"
                    ></div>
                  </div>
                  <div
                    data-thq="slider-button-prev"
                    class="swiper-button-prev"
                  ></div>
                  <div
                    data-thq="slider-button-next"
                    class="swiper-button-next"
                  ></div>
                </div>
              </div>
            </div>
            <div class="page10-container09">
              <h1 class="page10-text29">후기</h1>
              <div class="page10-container10">
                <div
                  data-thq="slider"
                  data-autoplay="true"
                  data-navigation="true"
                  data-pagination="true"
                  data-autoplay-delay="4000"
                  class="page10-slider1 swiper"
                >
                  <div data-thq="slider-wrapper" class="swiper-wrapper">
                    <div
                      data-thq="slider-slide"
                      class="page10-slider-slide4 swiper-slide"
                    >
                      <img
                        alt="image"
                        src="./image/review3-400h.jpg"
                        class="page10-image10 thq-link"
                      />
                    </div>
                    <div
                      data-thq="slider-slide"
                      class="page10-slider-slide5 swiper-slide"
                    >
                      <img
                        alt="image"
                        src="./image/review2-500h.jpg"
                        class="page10-image11 thq-link"
                      />
                    </div>
                    <div
                      data-thq="slider-slide"
                      class="page10-slider-slide6 swiper-slide"
                    >
                      <img
                        alt="image"
                        src="./image/review4-1400w.jpg"
                        class="page10-image12 thq-link"
                      />
                    </div>
                  </div>
                  <div
                    data-thq="slider-pagination"
                    class="page10-slider-pagination1 swiper-pagination swiper-pagination-bullets swiper-pagination-horizontal"
                  >
                    <div
                      data-thq="slider-pagination-bullet"
                      class="swiper-pagination-bullet swiper-pagination-bullet-active"
                    ></div>
                    <div
                      data-thq="slider-pagination-bullet"
                      class="swiper-pagination-bullet"
                    ></div>
                    <div
                      data-thq="slider-pagination-bullet"
                      class="swiper-pagination-bullet"
                    ></div>
                  </div>
                  <div
                    data-thq="slider-button-prev"
                    class="swiper-button-prev"
                  ></div>
                  <div
                    data-thq="slider-button-next"
                    class="swiper-button-next"
                  ></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="page4-footer">
          <div class="max-width-container">
            <footer class="page4-footer1">
              <div class="page4-container5">
                <h3 class="page4-text27 Heading-3">팀 롯데 자이언츠</h3>
                <span class="page4-text28">
                  <span>팀장 전종민</span>
                  <br />
                  <span>팀원 최진혁</span>
                  <span>팀원 김민기</span>
                </span>
                <span class="page4-text31">010-6605-9738</span>
                <span class="page4-text32">jnjjb05@naver.com</span>
              </div>
              <div class="page4-links-container">
                <div class="page4-container6">
                  <span class="page4-text33">백엔드프로그래밍</span>
                  <span class="page4-text34">1학기</span>
                  <span class="page4-text35">조별과제</span>
                  <span class="page4-text36">부품판매사이트</span>
                  <span class="page4-text37">PartsSale</span>
                  
                </div>
                
              </div>
            </footer>
          </div>
        </div>
      </div>
    </div>
    <script
      defer=""
      src="https://unpkg.com/@teleporthq/teleport-custom-scripts"
    ></script>
  </body>
</html>