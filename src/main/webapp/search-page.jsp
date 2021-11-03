<%@page import="javax.websocket.SendResult"%>
<%@page import="DAO.MyBookDAO"%>
<%@page import="java.util.Random"%>
<%@page
	import="org.apache.catalina.filters.ExpiresFilter.XServletOutputStream"%>
<%@page import="DTO.UserDTO"%>
<%@page import="DTO.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="EUC-KR">
<head>
<!-- Required meta tags -->
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>The Book</title>
<!-- icon 대처 -->
<link rel="stylesheet" href="./css/uicons-regular-rounded.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- Typography CSS -->
<link rel="stylesheet" href="./css/typography.css">
<!-- Style CSS -->
<link rel="stylesheet" href="./css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="./css/responsive.css">
<!-- font css -->
<link rel="stylesheet" href="./font/font.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<%
	
	// 검색한 도서 정보 가져오기
	ArrayList<BookDTO> searchlist = (ArrayList)session.getAttribute("searchlist");
	
	if (searchlist == null) {
		System.out.print("인덱스 리스트 널값");
	}
	
	// 유저 개인정보 가져오기
	UserDTO singledto = (UserDTO) session.getAttribute("singledto");
	if (singledto == null) {
		System.out.print("싱글dto 널값");
	}
	
	%>
	
	
	<!-- loader Start -->
	<div id="loading">
		<div id="loading-center"></div>
	</div>
	<!-- loader END -->
	<!-- Wrapper Start -->
	<div class="wrapper">
		<!-- Sidebar  -->
		<div class="iq-sidebar">
			<div class="iq-sidebar-logo d-flex justify-content-between">
				<a href="index.jsp" class="header-logo"> <!-- 로고 이미지 --> <!-- fi-rr-book-alt -->
					<img src="./images/logo.png" class="img-fluid rounded-normal"
					alt="">
					<div class="logo-title">
						<!-- 로고 이름 -->
						<span class="text-primary text-uppercase">the book</span>
					</div>
				</a>
				<div class="iq-menu-bt-sidebar">
					<div class="iq-menu-bt align-self-center">
						<div class="wrapper-menu">
							<!-- 오류  -->
							<!-- 이미지 대처 -->
							<div class="main-circle">
								<i class="fi-rr-indent"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sidebar-scrollbar">
				<nav class="iq-sidebar-menu">
					<ul id="iq-sidebar-toggle" class="iq-menu">
						<li class="active active-menu"><a href="#dashboard"
							class="iq-waves-effect" data-toggle="collapse"
							aria-expanded="true"><span class="ripple rippleEffect"></span><i
								class="fi-rr-shop"></i><span>메뉴</span><i
								class="fi-rr-caret-right"></i></a>
							<ul id="dashboard" class="iq-submenu collapse show"
								data-parent="#iq-sidebar-toggle">
								<li class="active"><a href="index.jsp"><i
										class="fi-rr-home"></i>메인 페이지</a></li>
								<li><a href="category.jsp"><i class="fi-rr-comment-alt"></i>카테고리
										페이지</a></li>
							</ul></li>
						<!-- 어드민 페이지 if 문 추가 -->
						<% if(singledto !=null){ 
							System.out.println("single dto 받아짐");
							System.out.println(singledto.getAdmin_yn());
							if(singledto.getAdmin_yn()!=null){
								if(singledto.getAdmin_yn().equals("y")){ 
									System.out.println("admin 확인");
						%>
						<li><a href="#admin" class="iq-waves-effect"
							data-toggle="collapse" aria-expanded="false"><span
								class="ripple rippleEffect"></span><i class="fi-rr-incognito"></i><span>어드민
									페이지</span><i class="fi-rr-caret-right"></i></a>
							<ul id="admin" class="iq-submenu collapse"
								data-parent="#iq-sidebar-toggle">
								<li><a href="admin-dashboard.jsp"><i
										class="fi-rr-chart-pie"></i>대시보드</a></li>
								<li><a href="admin-category.jsp"><i
										class="fi-rr-comment-alt"></i>카테고리 목록</a></li>
								<li><a href="admin-author.jsp"><i
										class="fi-rr-following"></i>어드민 관리</a></li>
								<li><a href="admin-books.jsp"><i
										class="fi-rr-cloud-download"></i>책 관리</a></li>
							</ul></li>
						<%}else System.out.println("admin 아님 admin:"+singledto.getAdmin_yn());}} %>
						<%if(singledto != null ){ %>
						<li><a href="#userinfo" class="iq-waves-effect"
							data-toggle="collapse" aria-expanded="false"><span
								class="ripple rippleEffect"></span><i
								class="fi-rr-mode-portrait"></i><span>마이 페이지</span><i
								class="fi-rr-caret-right"></i></a>
							<ul id="userinfo" class="iq-submenu collapse"
								data-parent="#iq-sidebar-toggle">
								<li><a href="mypage.jsp"><i class="fi-rr-user"></i>마이페이지</a></li>
								<li><a href="mylist.jsp"><i class="fi-rr-comment-heart"></i>위시리스트</a></li>
							</ul></li>
						<%} %>
					</ul>
				</nav>
				<div id="sidebar-bottom" class="p-3 position-relative">
					<div class="iq-card">
						<div class="iq-card-body">
							<div class="sidebarbottom-content">
								<button type="submit"
									class="btn w-100 btn-primary mt-4 view-more">바로가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- TOP Nav Bar -->
		<!-- 모바일 -->
		<div class="iq-top-navbar">
			<div class="iq-navbar-custom">
				<nav class="navbar navbar-expand-lg navbar-light p-0">
					<div class="iq-menu-bt d-flex align-items-center">
						<div class="wrapper-menu">
							<div class="main-circle">
								<i class="fi-rr-indent"></i>
							</div>
						</div>
						<div class="iq-navbar-logo d-flex justify-content-between">
							<a href="index.jsp" class="header-logo"> <img
								src="./images/logo.png" class="img-fluid rounded-normal" alt="">
								<div class="logo-title">
									<span class="text-primary text-uppercase">The Book</span>
								</div>
							</a>
						</div>
					</div>
					<div class="navbar-breadcrumb">
						<h5 class="mb-0">메뉴</h5>
						<nav aria-label="breadcrumb">
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.jsp">나의 도서 리스트</a></li>
							</ul>
						</nav>
					</div>
					<!-- 웹 버전 검색 엔진 -->
					<div class="iq-search-bar">
						<form action="searchProgram" class="searchbox">
							<input type="text" class="text search-input" placeholder="검색" name="text">
							<a class="search-link" href="#"><i class="fi-rr-search"></i></a>
						</form>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent"
						aria-label="Toggle navigation">
						<i class="fi-rr-user"></i>
					</button>
					<!-- 모바일 버전 검색 엔진 -->
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-auto navbar-list">
							<li class="nav-item nav-icon search-content"><a href="#"
								class="search-toggle iq-waves-effect text-gray rounded"> <i
									class="fi-rr-search"></i>
							</a> <!-- 모바일버전 검색 -->
								<form action="searchProgram" class="search-box p-0">
									<input type="text" class="text search-input"
										placeholder="검색창"> <a class="search-link" href="#" name="text"><i
										class="fi-rr-search"></i></a>
								</form></li>
							<li class="nav-item nav-icon"><a href="#"
								class="search-toggle iq-waves-effect text-gray rounded"> <i
									class="fi-rr-bell-school"></i> <span class="bg-primary dots"></span>
							</a>
								<div class="iq-sub-dropdown">
									<div class="iq-card shadow-none m-0">
										<div class="iq-card-body p-0">
											<div class="bg-primary p-3">
												<h5 class="mb-0 text-white">
													알림<small class="badge  badge-light float-right pt-1">4</small>
												</h5>
											</div>
											<!-- 알림 리스트 -->
											<a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="avatar-40 rounded" src="./images/user/01.jpg" alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Emma Watson Barry</h6>
														<small class="float-right font-size-12">Just Now</small>
														<p class="mb-0">95 MB</p>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="avatar-40 rounded" src="./images/user/02.jpg">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">New customer is join</h6>
														<small class="float-right font-size-12">5 days ago</small>
														<p class="mb-0">Cyst Barry</p>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="avatar-40 rounded" src="./images/user/03.jpg"
															alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Two customer is left</h6>
														<small class="float-right font-size-12">2 days ago</small>
														<p class="mb-0">Cyst Barry</p>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="avatar-40 rounded" src="./images/user/04.jpg"
															alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">New Mail from Fenny</h6>
														<small class="float-right font-size-12">3 days ago</small>
														<p class="mb-0">Cyst Barry</p>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div></li>
							<li class="nav-item nav-icon dropdown"><a href="#"
								class="search-toggle iq-waves-effect text-gray rounded"> <i
									class="fi-rr-comment-alt"></i> <span class="bg-primary dots"></span>
							</a>
								<div class="iq-sub-dropdown">
									<div class="iq-card shadow-none m-0">
										<div class="iq-card-body p-0 ">
											<div class="bg-primary p-3">
												<h5 class="mb-0 text-white">
													메세지<small class="badge  badge-light float-right pt-1">5</small>
												</h5>
											</div>
											<!-- 메세지 리스트 -->
											<a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="avatar-40 rounded" src="images/user/01.jpg"
															alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Barry Emma Watson</h6>
														<small class="float-left font-size-12">13 Jun</small>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="avatar-40 rounded" src="./images/user/02.jpg"
															alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Lorem Ipsum Watson</h6>
														<small class="float-left font-size-12">20 Apr</small>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="avatar-40 rounded" src="./images/user/03.jpg"
															alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Why do we use it?</h6>
														<small class="float-left font-size-12">30 Jun</small>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="avatar-40 rounded" src="./images/user/04.jpg"
															alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Variations Passages</h6>
														<small class="float-left font-size-12">12 Sep</small>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="avatar-40 rounded" src="./images/user/05.jpg"
															alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Lorem Ipsum generators</h6>
														<small class="float-left font-size-12">5 Dec</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div></li>
							<li class="nav-item nav-icon dropdown"><a href="#"
								class="search-toggle iq-waves-effect text-gray rounded"> <i
									class="fi-rr-shopping-cart-check"></i> <span
									class="badge badge-danger count-cart rounded-circle">4</span>
							</a>
								<div class="iq-sub-dropdown">
									<div class="iq-card shadow-none m-0">
										<div class="iq-card-body p-0 toggle-cart-info">
											<div class="bg-primary p-3">
												<h5 class="mb-0 text-white">
													히스토리<small class="badge  badge-light float-right pt-1">4</small>
												</h5>
											</div>
											<!-- 히스토리 -->
											<a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="rounded"
															src="#" alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 "></h6>
														<p class="mb-0"></p>
													</div>
													<div class="float-right font-size-24 text-danger">
														<i class="ri-close-fill"></i>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="rounded" src="./images/cart/02.jpg" alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">The Sin Eater Book</h6>
														<p class="mb-0">$40</p>
													</div>
													<div class="float-right font-size-24 text-danger">
														<i class="ri-close-fill"></i>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="rounded" src="./images/cart/03.jpg" alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">the Orange Tree</h6>
														<p class="mb-0">$30</p>
													</div>
													<div class="float-right font-size-24 text-danger">
														<i class="ri-close-fill"></i>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="rounded" src="./images/cart/04.jpg" alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">Harsh Reality book</h6>
														<p class="mb-0">$25</p>
													</div>
													<div class="float-right font-size-24 text-danger">
														<i class="ri-close-fill"></i>
													</div>
												</div>
											</a>
											<div class="d-flex align-items-center text-center p-3">
												<a class="btn btn-primary mr-2 iq-sign-btn" href="#"
													role="button">View Cart</a> <a
													class="btn btn-primary iq-sign-btn" href="#" role="button">Shop
													now</a>
											</div>
										</div>
									</div>
								</div></li>
							<li class="line-height pt-3"><a href="#" class="search-toggle iq-waves-effect d-flex align-items-center">
									<div class="caption">
									<%if(singledto !=null){ %>
										<h6 class="mb-1 line-height"><%=singledto.getName() %> 님</h6>
										<p class="mb-0 text-primary">환영합니다</p>
									<%}else{ %>
										<h6 class="mb-1 line-height">로그인</h6>
										<p class="mb-0 text-primary">로그인하세요</p>
									<%} %>
									</div>
							</a>
								<div class="iq-sub-dropdown iq-user-dropdown">
									<div class="iq-card shadow-none m-0">
										<div class="iq-card-body p-0 ">
											<div class="bg-primary p-3">
												<h5 class="mb-0 text-white line-height">자기소개</h5>
												<span class="text-white font-size-12">사용자</span>
											</div>
											<a href="profile.jsp" class="iq-sub-card iq-bg-primary-hover">
												<div class="media align-items-center">
													<div class="rounded iq-card-icon iq-bg-primary">
														<i class="fi-rr-user"></i>
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">프로필</h6>
														<p class="mb-0 font-size-12">View personal profile
															details.</p>
													</div>
												</div>
											</a> <a href="profile-edit.jsp"
												class="iq-sub-card iq-bg-primary-hover">
												<div class="media align-items-center">
													<div class="rounded iq-card-icon iq-bg-primary">
														<i class="fi-rr-user-remove"></i>
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">정보 수정</h6>
														<p class="mb-0 font-size-12">Modify your personal
															details.</p>
													</div>
												</div>
											</a>
											<div class="d-inline-block w-100 text-center p-3">
												<a class="bg-primary iq-sign-btn" href="logoutProgram"
													role="button">로그아웃</a>
											</div>
										</div>
									</div>
								</div></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<!-- TOP Nav Bar END -->
		<!-- Page Content  -->
		<!-- 뷰 슬라이더 효과 구현중 -->
		<div id="content-page" class="content-page">
			<div class="container-fluid">
				<div class="row">
					<!-- 베스트셀러 테이블 -->
					<div class="col-lg-12">
						<div class="iq-card iq-card-block iq-card-stretch iq-card-height">
							<div class="container">
								<h2>도서 검색 결과</h2>
								<table class="table table-striped">
									<thead>
										<tr>
											<th>도서명</th>
											<th>작가</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody>
									<% for(int i =0 ; i<= searchlist.size()-1;i++){ %>
										<tr>
											<td><a href ="bookpageProgram?num=<%=+searchlist.get(i).getSeq()%>"><%=searchlist.get(i).getBook_name()%></a></td>
											<td><%=searchlist.get(i).getAuthor()%></td>
											<td><%=searchlist.get(i).getBook_price()%>원</td>
										</tr>
									<%} %>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
	<!-- color-customizer END -->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<!-- Appear JavaScript -->
	<script src="./js/jquery.appear.js"></script>
	<!-- Countdown JavaScript -->
	<script src="./js/countdown.min.js"></script>
	<!-- Counterup JavaScript -->
	<script src="./js/waypoints.min.js"></script>
	<script src="./js/jquery.counterup.min.js"></script>
	<!-- Wow JavaScript -->
	<script src="./js/wow.min.js"></script>
	<!-- Apexcharts JavaScript -->
	<script src="./js/apexcharts.js"></script>
	<!-- Slick JavaScript -->
	<script src="./js/slick.min.js"></script>
	<!-- Select2 JavaScript -->
	<script src="./js/select2.min.js"></script>
	<!-- Owl Carousel JavaScript -->
	<script src="./js/owl.carousel.min.js"></script>
	<!-- Magnific Popup JavaScript -->
	<script src="./js/jquery.magnific-popup.min.js"></script>
	<!-- Smooth Scrollbar JavaScript -->
	<script src="./js/smooth-scroollbar.js"></script>
	<!-- lottie JavaScript -->
	<script src="./js/lottie.js"></script>
	<!-- am core JavaScript -->
	<script src="./js/core.js"></script>
	<!-- am charts JavaScript -->
	<script src="./js/charts.js"></script>
	<!-- am animated JavaScript -->
	<script src="./js/animated.js"></script>
	<!-- am kelly JavaScript -->
	<script src="./js/kelly.js"></script>
	<!-- am maps JavaScript -->
	<script src="./js/maps.js"></script>
	<!-- am worldLow JavaScript -->
	<script src="./js/worldLow.js"></script>
	<!-- Raphael-min JavaScript -->
	<script src="./js/raphael-min.js"></script>
	<!-- Morris JavaScript -->
	<script src="./js/morris.js"></script>
	<!-- Morris min JavaScript -->
	<script src="./js/morris.min.js"></script>
	<!-- Flatpicker Js -->
	<script src="./js/flatpickr.js"></script>
	<!-- Style Customizer -->
	<script src="./js/style-customizer.js"></script>
	<!-- Chart Custom JavaScript -->
	<script src="./js/chart-custom.js"></script>
	<!-- Custom JavaScript -->
	<script src="./js/custom.js"></script>




</body>
</html>