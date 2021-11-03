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
<!-- icon ��ó -->
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
</head>
<body>

	<%
	// å���� ��������
	BookDAO bookdao = new BookDAO();
	ArrayList<BookDTO> indexlist = bookdao.book1();
	if (indexlist == null) {
		System.out.print("�ε��� ����Ʈ �ΰ�");
	}

	// ���� �������� ��������
	UserDTO singledto = (UserDTO) session.getAttribute("singledto");
	if (singledto == null) {
		System.out.print("�̱�dto �ΰ�");
	}
	
	Random ran = new Random();
	int bestint = ran.nextInt(20)+1;
	
	System.out.println(bestint);
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
				<a href="index.jsp" class="header-logo"> <!-- �ΰ� �̹��� --> <!-- fi-rr-book-alt -->
					<img src="./images/logo.png" class="img-fluid rounded-normal"
					alt="">
					<div class="logo-title">
						<!-- �ΰ� �̸� -->
						<span class="text-primary text-uppercase">the book</span>
					</div>
				</a>
				<div class="iq-menu-bt-sidebar">
					<div class="iq-menu-bt align-self-center">
						<div class="wrapper-menu">
							<!-- ����  -->
							<!-- �̹��� ��ó -->
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
								class="fi-rr-shop"></i><span>�޴�</span><i
								class="fi-rr-caret-right"></i></a>
							<ul id="dashboard" class="iq-submenu collapse show"
								data-parent="#iq-sidebar-toggle">
								<li class="active"><a href="index.jsp"><i
										class="fi-rr-home"></i>���� ������</a></li>
								<li><a href="category.jsp"><i class="fi-rr-comment-alt"></i>ī�װ�
										������</a></li>
								<li><a href="chatbot.jsp"><i class="fi-rr-comment-alt"></i>ê�� ���α�</a></li>
								<%if(singledto == null ){ %>
								<li><a href="login.jsp"><i class="fi-rr-power"></i>�α���</a></li>
								<!-- if �� �߰� -->
								<li><a href="join.jsp"><i class="fi-rr-power"></i>ȸ������</a></li>
								<%} %>
							</ul></li>
						<!-- ���� ������ if �� �߰� -->
						<% if(singledto !=null){ 
							System.out.println("single dto �޾���");
							System.out.println(singledto.getAdmin_yn());
							if(singledto.getAdmin_yn()!=null){
								if(singledto.getAdmin_yn().equals("y")){ 
									System.out.println("admin Ȯ��");
						%>
						<li><a href="#admin" class="iq-waves-effect"
							data-toggle="collapse" aria-expanded="false"><span
								class="ripple rippleEffect"></span><i class="fi-rr-incognito"></i><span>����
									������</span><i class="fi-rr-caret-right"></i></a>
							<ul id="admin" class="iq-submenu collapse"
								data-parent="#iq-sidebar-toggle">
								<li><a href="admin-dashboard.jsp"><i
										class="fi-rr-chart-pie"></i>��ú���</a></li>
								<li><a href="admin-category.jsp"><i
										class="fi-rr-comment-alt"></i>ī�װ� ���</a></li>
								<li><a href="admin-author.jsp"><i
										class="fi-rr-following"></i>���� ����</a></li>
								<li><a href="admin-books.jsp"><i
										class="fi-rr-cloud-download"></i>å ����</a></li>
							</ul></li>
						<%}else System.out.println("admin �ƴ� admin:"+singledto.getAdmin_yn());}} %>
						<%if(singledto != null ){ %>
						<li><a href="#userinfo" class="iq-waves-effect"
							data-toggle="collapse" aria-expanded="false"><span
								class="ripple rippleEffect"></span><i
								class="fi-rr-mode-portrait"></i><span>���� ������</span><i
								class="fi-rr-caret-right"></i></a>
							<ul id="userinfo" class="iq-submenu collapse"
								data-parent="#iq-sidebar-toggle">
								<li><a href="mypage.jsp"><i class="fi-rr-user"></i>����������</a></li>
								<li><a href="mylist.jsp"><i class="fi-rr-comment-heart"></i>���ø���Ʈ</a></li>
							</ul></li>
						<%} %>
					</ul>
				</nav>
				<div id="sidebar-bottom" class="p-3 position-relative">
					<div class="iq-card">
						<div class="iq-card-body">
							<div class="sidebarbottom-content">
								<button type="submit"
									class="btn w-100 btn-primary mt-4 view-more">�ٷΰ���</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- TOP Nav Bar -->
		<!-- ����� -->
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
						<h5 class="mb-0">�޴�</h5>
						<nav aria-label="breadcrumb">
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.jsp">���� ������</a></li>
							</ul>
						</nav>
					</div>
					<!-- �� ���� �˻� ���� -->
					<div class="iq-search-bar">
						<form action="searchProgram" class="searchbox">
							<input type="text" class="text search-input" placeholder="�˻�" name="text">
							<a class="search-link" href="#"><i class="fi-rr-search"></i></a>
						</form>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent"
						aria-label="Toggle navigation">
						<i class="fi-rr-user"></i>
					</button>
					
					<!-- ����� ���� �˻� ���� -->
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-auto navbar-list">
							<li class="nav-item nav-icon search-content"><a href="#"
								class="search-toggle iq-waves-effect text-gray rounded"> <i
									class="fi-rr-search"></i>
							</a> <!-- ����Ϲ��� �˻� -->
								<form action="searchProgram" class="search-box p-0">
									<input type="text" class="text search-input"
										placeholder="�˻�" name="text"> <a class="search-link" href="#"><i
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
													�˸�<small class="badge  badge-light float-right pt-1"></small>
												</h5>
											</div>
											<!-- �˸� ����Ʈ -->
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
													�޼���<small class="badge  badge-light float-right pt-1">1</small>
												</h5>
											</div>
											<!-- �޼��� ����Ʈ -->
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
													�����丮<small class="badge  badge-light float-right pt-1">4</small>
												</h5>
											</div>
											<!-- �����丮 -->
											<a href="#" class="iq-sub-card">
												<div class="media align-items-center">
													<div class="">
														<img class="rounded"
															src="<%=indexlist.get(1).getBook_image1()%>" alt="">
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 "></h6>
														<p class="mb-0"><%=indexlist.get(1).getBook_price()%>��</p>
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
							<li class="line-height pt-3">
							
									<%if(singledto ==null){ %>
									<a href="login.jsp" class="search-toggle iq-waves-effect d-flex align-items-center">
									   	<div class="caption">
											<h6 class="mb-1 line-height">�α���</h6>
											<p class="mb-0 text-primary">�α����ϼ���</p>
										</div>
									</a>
									<%}else{ %>
									<a href="#" class="search-toggle iq-waves-effect d-flex align-items-center">
									   	<div class="caption">	
											<h6 class="mb-1 line-height"><%=singledto.getName() %> ��</h6>
											<p class="mb-0 text-primary">ȯ���մϴ�</p>
										</div>
									</a>
									
								<div class="iq-sub-dropdown iq-user-dropdown">
									<div class="iq-card shadow-none m-0">
										<div class="iq-card-body p-0 ">
											<div class="bg-primary p-3">
												<h5 class="mb-0 text-white line-height">�ڱ�Ұ�</h5>
												<span class="text-white font-size-12">�����</span>
											</div>
											 <a href="profile-edit.jsp"
												class="iq-sub-card iq-bg-primary-hover">
												<div class="media align-items-center">
													<div class="rounded iq-card-icon iq-bg-primary">
														<i class="fi-rr-user-remove"></i>
													</div>
													<div class="media-body ml-3">
														<h6 class="mb-0 ">���� ����</h6>
														<p class="mb-0 font-size-12">Modify your personal details.</p>
													</div>
												</div>
											</a>
											<div class="d-inline-block w-100 text-center p-3">
												<a class="bg-primary iq-sign-btn" href="logoutProgram"
													role="button">�α׾ƿ�</a>
											</div>
										</div>
									</div>
								</div>
								<%} %>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<!-- TOP Nav Bar END -->
		<!-- Page Content  -->
		<!-- �� �����̴� ȿ�� ������ -->
		<div id="content-page" class="content-page">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="iq-card iq-card-block iq-card-stretch iq-card-height">
							<div
								class="iq-card-header d-flex justify-content-between align-items-center position-relative">
								<div class="iq-header-title">
									<h4 class="card-title mb-0">����� ���� �м� ��Ʈ</h4>
								</div>
								<div class="iq-card-header-toolbar d-flex align-items-center">
									<a href="category.jsp" class="btn btn-sm btn-primary view-more">������</a>
								</div>
							</div>		
						 </div>
					 </div> 	
					<!-- ����Ʈ���� ���̺� -->
					<div class="col-lg-12">
						<div class="iq-card iq-card-block iq-card-stretch iq-card-height">
							<div
								class="iq-card-header d-flex justify-content-between align-items-center position-relative">
								<div class="iq-header-title">
									<h4 class="card-title mb-0">����Ʈ����</h4>
								</div>
								<div class="iq-card-header-toolbar d-flex align-items-center">
									<a href="category.jsp" class="btn btn-sm btn-primary view-more">������</a>
								</div>
							</div>
							<!-- js -->
							<div class="iq-card-body">
								<div class="row">
									<%
									for (int i = bestint; i <= bestint+15; i++) {
									%>
									<div class="col-sm-6 col-md-4 col-lg-3">
										<div
											class="iq-card iq-card-block iq-card-stretch iq-card-height browse-bookcontent">
											<div class="iq-card-body p-0">
												<div class="d-flex align-items-center">
													<div
														class="col-6 p-0 position-relative image-overlap-shadow">
														<a href="javascript:void();"><img
															class="img-fluid rounded w-100"
															src="<%=indexlist.get(i).getBook_image1()%>" alt=""></a>
														<div class="view-book">
															<a href="bookpageProgram?num=<%=+indexlist.get(i).getSeq()%>" class="btn btn-sm btn-white">������</a>
														</div>
													</div>
													<!-- å ���� -->
													<div class="col-6">
														<div class="mb-2">
															<!-- �̸� -->
															<h6 class="mb-1"><%=indexlist.get(i).getBook_name()%></h6>
															<!-- �۰� �̸� -->
															<p class="font-size-13 line-height mb-1"><%=indexlist.get(i).getAuthor()%></p>
															<div class="d-block line-height">
																<span class="font-size-11 text-warning"> <i
																	class="fi-rr-star"></i> <i class="fi-rr-star"></i> <i
																	class="fi-rr-star"></i> <i class="fi-rr-star"></i> <i
																	class="fi-rr-star"></i>
																</span>
															</div>
														</div>
														<div class="price d-flex align-items-center">
															<!-- ������ ���� -->
															
															<!-- ���� �� ���� -->
															<h6>
																<b><%=indexlist.get(i).getBook_price()%>��</b>
															</h6>
														</div>
														<div class="iq-product-action">
															<a href="<%=indexlist.get(i).getBook_link()%>"><i
																class="fi-rr-shopping-cart"></i></a> 
															<% if(singledto != null) {
															%>
															<a href="saveProgram?num=<%=indexlist.get(i).getSeq()%>&id=<%=singledto.getEmail()%>" class="ml-2"><i
																class="fi-rr-heart"></i></a>
															<%}else{ %>
															<a href="login.jsp" class="ml-2"><i
																class="fi-rr-heart"></i></a>
															<%} %>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</div>
					<!-- ���� �м� �� å �־��ִ� ���� -->
					<!-- JS �̿��ؼ� ȿ�� �����ؾ��� -->
					<div class="col-lg-12">
						<div class="iq-card iq-card-block iq-card-stretch iq-card-height">
							<div
								class="iq-card-header d-flex justify-content-between align-items-center position-relative">
								<div class="iq-header-title">
									<!-- Ÿ��Ʋ -->
									<h4 class="card-title mb-0">���� �м� ���� ��õ</h4>
								</div>
								<div class="iq-card-header-toolbar d-flex align-items-center">
									<!-- ���� ���� ������ ������ -->
									<a href="category.jsp" class="btn btn-sm btn-primary view-more">������</a>
								</div>
							</div>
							<div class="iq-card-body favorites-contens">
								<ul id="favorites-slider" class="list-inline p-0 mb-0 row">
									<%for(int i=bestint+20; i<=bestint+22;i++){ %>
									<li class="col-md-4">
										<div class="d-flex align-items-center">
											<div class="col-5 p-0 position-relative">
												<a href="bookpageProgram?num=<%=+indexlist.get(i).getSeq()%>"> <!-- å �̹��� --> <img
													src="<%=indexlist.get(i).getBook_image1()%>"
													class="img-fluid rounded w-100" alt="">
												</a>
											</div>
											<!-- å ���� -->
											<div class="col-7">
												<h5 class="mb-2"><%=indexlist.get(i).getBook_name()%></h5>
												<p class="mb-2"><%=indexlist.get(i).getAuthor()%></p>
												<div
													class="d-flex justify-content-between align-items-center text-dark font-size-13">
													<span>��Ȯ��</span> <span class="mr-4">78%</span>
												</div>
												<div class="iq-progress-bar-linear d-inline-block w-100">
													<div class="iq-progress-bar iq-bg-primary">
														<span class="bg-primary" data-percent="78"></span>
													</div>
												</div>
												<a href="bookpageProgram?num=<%=+indexlist.get(i).getSeq()%>" class="text-dark">�ٷΰ���</a>
											</div>
										</div>
									</li>
									<%} %>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Wrapper END -->
	<!-- Footer -->
	<footer class="iq-footer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6">
					<ul class="list-inline mb-0">
						<!-- �ٷΰ��� ������. -->
						<li class="list-inline-item"><a href="#"></a></li>
						<li class="list-inline-item"><a href="#"></a></li>
					</ul>
				</div>
				<div class="col-lg-6 text-right">
					<a href="#">Booksto</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer END -->
	<!-- color Test -->
	<div class="iq-colorbox color-fix">
		<div class="buy-button">
			<a class="color-full" href="#"><i class="fi-rr-caret-left"></i></a>
		</div>
		<div id="right-sidebar-scrollbar" class="iq-colorbox-inner">
			<div class="clearfix color-picker">
				<h3 class="iq-font-black">�÷� �ٲٱ� �׽�Ʈ</h3>
				<p class="iq-font-black">���� ��õ �޾ƿ�</p>
				<ul class="iq-colorselect clearfix">
					<li class="color-1 iq-colormark" data-style="color-1"></li>
					<li class="color-2" data-style="iq-color-2"></li>
					<li class="color-3" data-style="iq-color-3"></li>
					<li class="color-4" data-style="iq-color-4"></li>
					<li class="color-5" data-style="iq-color-5"></li>
					<li class="color-6" data-style="iq-color-6"></li>
					<li class="color-7" data-style="iq-color-7"></li>
					<li class="color-8" data-style="iq-color-8"></li>
					<li class="color-9" data-style="iq-color-9"></li>
					<li class="color-10" data-style="iq-color-10"></li>
					<li class="color-11" data-style="iq-color-11"></li>
					<li class="color-12" data-style="iq-color-12"></li>
					<li class="color-13" data-style="iq-color-13"></li>
					<li class="color-14" data-style="iq-color-14"></li>
					<li class="color-15" data-style="iq-color-15"></li>
					<li class="color-16" data-style="iq-color-16"></li>
					<li class="color-17" data-style="iq-color-17"></li>
					<li class="color-18" data-style="iq-color-18"></li>
					<li class="color-19" data-style="iq-color-19"></li>
					<li class="color-20" data-style="iq-color-20"></li>
				</ul>
				<a target="_blank" class="btn btn-primary d-block mt-3" href="">�����ϱ�</a>
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

	<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script>
		(function(c, l, o, s, e, r) {
			c[e] = c[e] || {};
			r = l.createElement('script');
			s && (o += '?botId=' + s);
			e && (r.setAttribute('data-bind', e));
			r.src = o;
			r.async = 1;
			l.head.appendChild(r);
		})(window, document, 'https://app.closer.ai/webchat.js', 'B23rkn');
	</script>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {

			var data = google.visualization.arrayToDataTable([
					[ 'Task', 'Hours per Day' ], [ '����', 11 ], [ '�г�', 2 ],
					[ 'OO', 2 ], [ 'OO', 2 ], [ 'OO', 7 ] ]);

			var options = {
				title : 'ID���� ���� ���� �м�'
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('piechart'));

			chart.draw(data, options);
		}
	</script>



</body>
</html>