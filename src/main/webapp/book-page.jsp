<%@page import="DTO.UserDTO"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BookDAO"%>
<%@page import="DTO.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="org.apache.catalina.filters.ExpiresFilter.XServletOutputStream"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Booksto</title>
      <!-- Favicon -->
      <!-- �̹��� ��ó -->
      <!-- <link rel="shortcut icon" href="images/favicon.ico" /> -->

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
			UserDTO singledto = (UserDTO) session.getAttribute("singledto");
			if (singledto == null) {
				System.out.print("�̱�dto �ΰ�");
			}
   				
  			BookDTO bp = (BookDTO)session.getAttribute("bp");
   			if(bp != null){
   				System.out.print("bp���ǹ���");
   			}
   			
   			BookDAO dao= new BookDAO(); 
   			ArrayList<BookDTO> b2 = dao.book2();
   			if(b2 != null){
   				System.out.print("b2���ǹ���");
   			}else{
   				System.out.print("b2���� ����");
   			}
   			
   			ArrayList<BookDTO> b3 = dao.book2();
   			if(b3 != null){
   				System.out.print("b3���ǹ���");
   			}else{
   				System.out.print("b3���� ����");
   			}
   			
   			Random rand = new Random();
   			int num1 = rand.nextInt(29)+1;
   			int num2 = rand.nextInt(10)+5;
   			
   			
   %>
      <!-- loader Start -->
      <div id="loading">
         <div id="loading-center">
         </div>
      </div>
      <!-- loader END -->
      <!-- Wrapper Start -->
      <div class="wrapper">
         <!-- Sidebar  -->
         <div class="iq-sidebar">
            <div class="iq-sidebar-logo d-flex justify-content-between">
               <a href="index.jsp" class="header-logo">
                  <!-- �ΰ� �̹��� -->
                  <!-- fi-rr-book-alt -->
                  <img src="images/logo.png" class="img-fluid rounded-normal" alt="">
                  <div class="logo-title">
                     <!-- �ΰ� �̸� -->
                     <span class="text-primary text-uppercase">THE BOOK</span>
                  </div>
               </a>
               <div class="iq-menu-bt-sidebar">
                  <div class="iq-menu-bt align-self-center">
                     <div class="wrapper-menu">
                        <!-- ����  -->
                        <!-- �̹��� ��ó -->
                        <div class="main-circle"><i class="fi-rr-indent"></i></div>
                     </div>
                  </div>
               </div>
            </div>
            <div id="sidebar-scrollbar">
               <nav class="iq-sidebar-menu">
                  <ul id="iq-sidebar-toggle" class="iq-menu">
                     <li class="active active-menu">
                        <a href="#dashboard" class="iq-waves-effect" data-toggle="collapse" aria-expanded="true"><span class="ripple rippleEffect"></span><i class="fi-rr-shop"></i><span>�޴�</span><i class="fi-rr-caret-right"></i></a>
                        <ul id="dashboard" class="iq-submenu collapse show" data-parent="#iq-sidebar-toggle">
                           <li><a href="index.jsp"><i class="fi-rr-home"></i>���� ������</a></li>
                           <li><a href="category.jsp"><i class="fi-rr-comment-alt"></i>ī�װ��� ������</a></li>
                           <%if(singledto == null ){ %>
								<li><a href="login.jsp"><i class="fi-rr-power"></i>�α���</a></li>
								<!-- if �� �߰� -->
								<li><a href="join.jsp"><i class="fi-rr-power"></i>ȸ������</a></li>
								<%} %>
                        </ul>
                     </li>
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
										class="fi-rr-comment-alt"></i>ī�װ��� ���</a></li>
								<li><a href="admin-author.jsp"><i
										class="fi-rr-following"></i>���� ����</a></li>
								<li><a href="admin-books.jsp"><i
										class="fi-rr-cloud-download"></i>å ����</a></li>
							</ul></li>
						<%}else System.out.println("admin �ƴ� admin:"+singledto.getAdmin_yn());}} %>
						<%if(singledto != null ){ %>
                     <li>
                        <a href="#userinfo" class="iq-waves-effect" data-toggle="collapse" aria-expanded="false"><span class="ripple rippleEffect"></span><i class="fi-rr-mode-portrait"></i><span>���� ������</span><i class="fi-rr-caret-right"></i></a>
                        <ul id="userinfo" class="iq-submenu collapse"
								data-parent="#iq-sidebar-toggle">
								<li><a href="mypage.jsp"><i class="fi-rr-user"></i>����������</a></li>
								<li><a href="mylist.jsp"><i class="fi-rr-comment-heart"></i>���ø���Ʈ</a></li>
						</ul>
                     </li>
                     <%} %>
                  </ul>
               </nav>
               <div id="sidebar-bottom" class="p-3 position-relative">
                  <div class="iq-card">
                     <div class="iq-card-body">
                        <div class="sidebarbottom-content">                        
                           <button type="submit" class="btn w-100 btn-primary mt-4 view-more">�ٷΰ���</button>
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
                        <div class="main-circle"><i class="fi-rr-indent"></i></div>
                     </div>
                     <div class="iq-navbar-logo d-flex justify-content-between">
                        <a href="index.jsp" class="header-logo">
                           <img src="images/logo.png" class="img-fluid rounded-normal" alt="">
                           <div class="logo-title">
                              <span class="text-primary text-uppercase">THE BOOK</span>
                           </div>
                        </a>
                     </div>
                  </div>
                  <div class="navbar-breadcrumb">
                     <h5 class="mb-0">�޴�</h5>
                     <nav aria-label="breadcrumb">
                        <ul class="breadcrumb">
                           <li class="breadcrumb-item"><a href="index.jsp">���� �� ������</a></li>
                        </ul>
                     </nav>
                  </div>
                  <!-- �� ����   ���� -->
                  <div class="iq-search-bar">
						<form action="searchProgram" class="searchbox">
							<input type="text" class="text search-input" placeholder="�˻�" name="text">
							<a class="search-link" href="#"><i class="fi-rr-search"></i></a>
						</form>
					</div>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"  aria-label="Toggle navigation">
                  <i class="fi-rr-user"></i>
                  </button>
                  <!-- ����� ���� �˻� ���� -->
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                     <ul class="navbar-nav ml-auto navbar-list">
                        <li class="nav-item nav-icon search-content">
                           <a href="#" class="search-toggle iq-waves-effect text-gray rounded">
                              <i class="fi-rr-search"></i>
                           </a>
                           <!-- ����Ϲ��� �˻� -->
                           <form action="searchProgram" class="search-box p-0">
                              <input type="text" class="text search-input" placeholder="�˻�â" name = "text">
                              <a class="search-link" href="#"><i class="fi-rr-search"></i></a>
                           </form>
                        </li>
                        <li class="nav-item nav-icon">
                           <a href="#" class="search-toggle iq-waves-effect text-gray rounded">
                           <i class="fi-rr-bell-school"></i>
                           <span class="bg-primary dots"></span>
                           </a>
                           <div class="iq-sub-dropdown">
                              <div class="iq-card shadow-none m-0">
                                 <div class="iq-card-body p-0">
                                    <div class="bg-primary p-3">
                                       <h5 class="mb-0 text-white">�˸�<small class="badge  badge-light float-right pt-1">4</small></h5>
                                    </div>
                                    <!-- �˸� ����Ʈ -->
                                    <a href="#" class="iq-sub-card" >
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/01.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Emma Watson Barry</h6>
                                             <small class="float-right font-size-12">Just Now</small>
                                             <p class="mb-0">95 MB</p>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card" >
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/02.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">New customer is join</h6>
                                             <small class="float-right font-size-12">5 days ago</small>
                                             <p class="mb-0">Cyst Barry</p>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card" >
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/03.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Two customer is left</h6>
                                             <small class="float-right font-size-12">2 days ago</small>
                                             <p class="mb-0">Cyst Barry</p>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card" >
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/04.jpg" alt="">
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
                           </div>
                        </li>
                        <li class="nav-item nav-icon dropdown">
                           <a href="#" class="search-toggle iq-waves-effect text-gray rounded">
                           <i class="fi-rr-comment-alt"></i>
                           <span class="bg-primary dots"></span>
                           </a>
                           <div class="iq-sub-dropdown">
                              <div class="iq-card shadow-none m-0">
                                 <div class="iq-card-body p-0 ">
                                    <div class="bg-primary p-3">
                                       <h5 class="mb-0 text-white">�޼���<small class="badge  badge-light float-right pt-1">5</small></h5>
                                    </div>
                                    <!-- �޼��� ����Ʈ -->
                                    <a href="#" class="iq-sub-card">
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/01.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Barry Emma Watson</h6>
                                             <small class="float-left font-size-12">13 Jun</small>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card">
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/02.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Lorem Ipsum Watson</h6>
                                             <small class="float-left font-size-12">20 Apr</small>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card">
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/03.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Why do we use it?</h6>
                                             <small class="float-left font-size-12">30 Jun</small>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card">
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/04.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Variations Passages</h6>
                                             <small class="float-left font-size-12">12 Sep</small>
                                          </div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card">
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="avatar-40 rounded" src="images/user/05.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Lorem Ipsum generators</h6>
                                             <small class="float-left font-size-12">5 Dec</small>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                              </div>
                           </div>
                        </li>
                        <li class="nav-item nav-icon dropdown">
                           <a href="#" class="search-toggle iq-waves-effect text-gray rounded">
                           <i class="fi-rr-shopping-cart-check"></i>
                           <span class="badge badge-danger count-cart rounded-circle">4</span>
                           </a>
                           <div class="iq-sub-dropdown">
                              <div class="iq-card shadow-none m-0">
                                 <div class="iq-card-body p-0 toggle-cart-info">
                                    <div class="bg-primary p-3">
                                       <h5 class="mb-0 text-white">�����丮<small class="badge  badge-light float-right pt-1">4</small></h5>
                                    </div>
                                    <!-- �����丮 -->
                                    <a href="#" class="iq-sub-card">
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="rounded" src="images/cart/01.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Night People book</h6>
                                             <p class="mb-0">$32</p>
                                          </div>
                                          <div class="float-right font-size-24 text-danger"><i class="ri-close-fill"></i></div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card">
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="rounded" src="images/cart/02.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">The Sin Eater Book</h6>
                                             <p class="mb-0">$40</p>
                                          </div>
                                          <div class="float-right font-size-24 text-danger"><i class="ri-close-fill"></i></div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card">
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="rounded" src="images/cart/03.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">the Orange Tree</h6>
                                             <p class="mb-0">$30</p>
                                          </div>
                                          <div class="float-right font-size-24 text-danger"><i class="ri-close-fill"></i></div>
                                       </div>
                                    </a>
                                    <a href="#" class="iq-sub-card">
                                       <div class="media align-items-center">
                                          <div class="">
                                             <img class="rounded" src="images/cart/04.jpg" alt="">
                                          </div>
                                          <div class="media-body ml-3">
                                             <h6 class="mb-0 ">Harsh Reality book</h6>
                                             <p class="mb-0">$25</p>
                                          </div>
                                          <div class="float-right font-size-24 text-danger"><i class="ri-close-fill"></i></div>
                                       </div>
                                    </a>
                                    <div class="d-flex align-items-center text-center p-3">
                                       <a class="btn btn-primary mr-2 iq-sign-btn" href="#" role="button">View Cart</a>
                                       <a class="btn btn-primary iq-sign-btn" href="#" role="button">Shop now</a>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </li>
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
         <div id="content-page" class="content-page">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-sm-12">
                     <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-header d-flex justify-content-between align-items-center">
                           <h4 class="card-title mb-0">å �� ����</h4>
                        </div>
                        <!-- ���� -->
                        <div class="iq-card-body pb-0">
                           <div class="description-contens align-items-top row">
                              <div class="col-md-6">
                           			<div class="row align-items-center">
                                  		<img src="<%=bp.getBook_image1()%>" class="img-fluid w-100 rounded" width = "700px" height="500px"> 
                                	</div>
                              </div>
                              <div class="col-md-6">
                                <div class="iq-card-transparent iq-card-block iq-card-stretch iq-card-height">
                                   <div class="iq-card-body p-0">
                                      <h3 class="mb-3"><%=bp.getBook_name()%></h3>
                                      <div class="price d-flex align-items-center font-weight-500 mb-2">
                                         <span class="font-size-24 text-dark"><%=bp.getBook_price()%>��</span>
                                      </div>
                                      <div class="mb-3 d-block">
                                        <span class="font-size-20 text-warning">
                                        <i class="fi-rr-star"></i>
                                        <i class="fi-rr-star"></i>
                                        <i class="fi-rr-star"></i>
                                        <i class="fi-rr-star"></i>
                                        <i class="fi-rr-star"></i>
                                        </span>
                                     </div>
                                      <span class="text-dark mb-4 pb-4 iq-border-bottom d-block">���ǻ� : <%=bp.getPublisher()%></span>
                                      <div class="text-primary mb-4">�� �� : <span class="text-body"><%=bp.getAuthor()%></span></div>
                                      <div class="mb-4 d-flex align-items-center">                                       
                                         <a href="<%=bp.getBook_link()%>" class="btn btn-primary view-more mr-2">�����ϱ�</a>
                                         <% if(singledto != null) {
															%>
                                         <a href="saveProgram?num=<%=bp.getSeq()%>&id=<%=singledto.getEmail()%>" class="btn btn-primary view-more mr-2">���ø���Ʈ ���</a>
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
                    </div>
                 </div>
                  <div class="col-lg-12">
                     <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-header d-flex justify-content-between align-items-center position-relative">
                           <div class="iq-header-title">
                              <h4 class="card-title mb-0">���� ����</h4>
                           </div>
                           <div class="iq-card-header-toolbar d-flex align-items-center">
                              <a href="category.jsp" class="btn btn-sm btn-primary view-more">������</a>
                           </div>
                        </div>
                        <div class="iq-card-body single-similar-contens">
                           <ul id="single-similar-slider" class="list-inline p-0 mb-0 row">
                              <%for(int i = num1; i<=num1+4;i++){ %>
                              <li class="col-md-3">
                                 <div class="row align-items-center">
                                    <div class="col-5">
                                       <div class="position-relative image-overlap-shadow">
                                          <a href="javascript:void();"><img class="img-fluid rounded w-100" src="<%= b2.get(i).getBook_image1() %>" alt=""></a>
                                          <div class="view-book">
                                             <a href="bookpageProgram?num=<%=+b2.get(i).getSeq()%>" class="btn btn-sm btn-white">������</a>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="col-7 pl-0">
                                       <h6 class="mb-2"><%= b2.get(i).getBook_name() %></h6>
                                       <p class="text-body"><%= b2.get(i).getAuthor() %></p>
                                       <a href="<%= b2.get(i).getBook_link() %>" class="text-dark" tabindex="-1">�ٷΰ���</a>
                                    </div>
                                 </div>
                              </li>
                              <%} %>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-12">
                     <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-header d-flex justify-content-between align-items-center position-relative mb-0 trendy-detail">
                           <div class="iq-header-title">
                              <h4 class="card-title mb-0">Ʈ���� ����</h4>
                           </div>
                           <div class="iq-card-header-toolbar d-flex align-items-center">
                              <a href="category.jsp" class="btn btn-sm btn-primary view-more">������</a>
                           </div>
                        </div>
                        <div class="iq-card-body trendy-contens">
                           <ul id="trendy-slider" class="list-inline p-0 mb-0 row">
                           	<%for(int i = num2; i<=num2+4;i++){  %>
                              <li class="col-md-3">
                                 <div class="d-flex align-items-center">
                                    <div class="col-5 p-0 position-relative image-overlap-shadow">
                                       <a href="javascript:void();"><img class="img-fluid rounded w-100" src="<%=b3.get(i).getBook_image1()%>"></a>
                                       <div class="view-book">
                                          <a href="book-page.jsp" class="btn btn-sm btn-white">������</a>
                                       </div>
                                    </div>
                                    <div class="col-7">
                                       <div class="mb-2">
                                          <h6 class="mb-1"><%=b3.get(i).getBook_name()%></h6>
                                          <p class="font-size-13 line-height mb-1"><%=b3.get(i).getAuthor()%></p>
                                          <div class="d-block">
                                             <span class="font-size-13 text-warning">
                                             <i class="fi-rr-star"></i>
                                             <i class="fi-rr-star"></i>
                                             <i class="fi-rr-star"></i>
                                             <i class="fi-rr-star"></i>
                                             <i class="fi-rr-star"></i>
                                             </span>
                                          </div>
                                       </div>
                                       <div class="price d-flex align-items-center">
                                          <h6><b><%=b3.get(i).getBook_price()%>��</b></h6>
                                       </div>
                                       <div class="iq-product-action">
                                          <a href="<%=b3.get(i).getBook_link()%>"><i class="fi-rr-shopping-cart"></i></a>
                                          <a href="javascript:void();" class="ml-2"><i class="fi-rr-heart"></i></a>
                                       </div>
                                    </div>
                                 </div>
                              </li>
                              <%} %>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-12">
                     <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-header d-flex justify-content-between align-items-center position-relative">
                           <div class="iq-header-title">
                              <h4 class="card-title mb-0">���� �м� ���� ��õ</h4>
                           </div>
                           <div class="iq-card-header-toolbar d-flex align-items-center">
                              <a href="category.jsp" class="btn btn-sm btn-primary view-more">������</a>
                           </div>
                        </div>                         
                        <div class="iq-card-body favorites-contens">
                           <ul id="favorites-slider" class="list-inline p-0 mb-0 row">
                              <li class="col-md-4">
                                 <div class="d-flex align-items-center">
                                    <div class="col-5 p-0 position-relative">
                                       <a href="javascript:void();">
                                          <img src="images/favorite/01.jpg" class="img-fluid rounded w-100" alt="">
                                       </a>                                
                                    </div>
                                    <div class="col-7">
                                       <h5 class="mb-2">����</h5>
                                       <p class="mb-2">�۰� �̸�</p>                                          
                                       <div class="d-flex justify-content-between align-items-center text-dark font-size-13">
                                          <span>�м���</span>
                                          <span class="mr-4">78%</span>
                                       </div>
                                       <div class="iq-progress-bar-linear d-inline-block w-100">
                                          <div class="iq-progress-bar iq-bg-primary">
                                             <span class="bg-primary" data-percent="78"></span>
                                          </div>
                                       </div>
                                       <a href="#" class="text-dark">�ٷΰ���</a>
                                    </div>
                                 </div>
                              </li>
                              <li class="col-md-4">
                                 <div class="d-flex align-items-center">
                                    <div class="col-5 p-0 position-relative">
                                       <a href="javascript:void();">
                                          <img src="images/favorite/02.jpg" class="img-fluid rounded w-100" alt="">
                                       </a>                                
                                    </div>
                                    <div class="col-7">
                                       <h5 class="mb-2">����</h5>
                                       <p class="mb-2">�۰� �̸�</p>                                          
                                       <div class="d-flex justify-content-between align-items-center text-dark font-size-13">
                                          <span>�м���</span>
                                          <span class="mr-4">78%</span>
                                       </div>
                                       <div class="iq-progress-bar-linear d-inline-block w-100">
                                          <div class="iq-progress-bar iq-bg-danger">
                                             <span class="bg-danger" data-percent="78"></span>
                                          </div>
                                       </div>
                                       <a href="#" class="text-dark">�ٷΰ���</a>
                                    </div>
                                 </div>
                              </li>
                              <li class="col-md-4">
                                 <div class="d-flex align-items-center">
                                    <div class="col-5 p-0 position-relative">
                                       <a href="javascript:void();">
                                          <img src="images/favorite/03.jpg" class="img-fluid rounded w-100" alt="">
                                       </a>                                
                                    </div>
                                    <div class="col-7">
                                       <h5 class="mb-2">����</h5>
                                       <p class="mb-2">�۰� �̸�</p>                                          
                                       <div class="d-flex justify-content-between align-items-center text-dark font-size-13">
                                          <span>�м���</span>
                                          <span class="mr-4">78%</span>
                                       </div>
                                       <div class="iq-progress-bar-linear d-inline-block w-100">
                                          <div class="iq-progress-bar iq-bg-info">
                                             <span class="bg-info" data-percent="78"></span>
                                          </div>
                                       </div>
                                       <a href="#" class="text-dark">�ٷΰ���</a>
                                    </div>
                                 </div>
                              </li>
                              <li class="col-md-4">
                                 <div class="d-flex align-items-center">
                                    <div class="col-5 p-0 position-relative">
                                       <a href="javascript:void();">
                                          <img src="images/favorite/04.jpg" class="img-fluid rounded w-100" alt="">
                                       </a>                                
                                    </div>
                                    <div class="col-7">
                                       <h5 class="mb-2">����</h5>
                                       <p class="mb-2">�۰� �̸�</p>                                          
                                       <div class="d-flex justify-content-between align-items-center text-dark font-size-13">
                                          <span>�м���</span>
                                          <span class="mr-4">78%</span>
                                       </div>
                                       <div class="iq-progress-bar-linear d-inline-block w-100">
                                          <div class="iq-progress-bar iq-bg-success">
                                             <span class="bg-success" data-percent="78"></span>
                                          </div>
                                       </div>
                                       <a href="#" class="text-dark">�ٷΰ���</a>
                                    </div>
                                 </div>
                              </li>
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
        <div class="buy-button"> <a class="color-full" href="#"><i class="fi-rr-caret-left"></i></a> </div>
        <div id="right-sidebar-scrollbar" class="iq-colorbox-inner">
           <div class="clearfix color-picker">
              <h3 class="iq-font-black">�÷� �ٲٱ� �׽�Ʈ</h3>
              <p class="iq-font-black">���� ��õ �޾ƿ� </p>
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
     <script src="js/jquery.min.js"></script>
     <script src="js/popper.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <!-- Appear JavaScript -->
     <script src="js/jquery.appear.js"></script>
     <!-- Countdown JavaScript -->
     <script src="js/countdown.min.js"></script>
     <!-- Counterup JavaScript -->
     <script src="js/waypoints.min.js"></script>
     <script src="js/jquery.counterup.min.js"></script>
     <!-- Wow JavaScript -->
     <script src="js/wow.min.js"></script>
     <!-- Apexcharts JavaScript -->
     <script src="js/apexcharts.js"></script>
     <!-- Slick JavaScript -->
     <script src="js/slick.min.js"></script>
     <!-- Select2 JavaScript -->
     <script src="js/select2.min.js"></script>
     <!-- Owl Carousel JavaScript -->
     <script src="js/owl.carousel.min.js"></script>
     <!-- Magnific Popup JavaScript -->
     <script src="js/jquery.magnific-popup.min.js"></script>
     <!-- Smooth Scrollbar JavaScript -->
     <script src="js/smooth-scroollbar.js"></script>
     <!-- lottie JavaScript -->
     <script src="js/lottie.js"></script>
     <!-- am core JavaScript -->
     <script src="js/core.js"></script>
     <!-- am charts JavaScript -->
     <script src="js/charts.js"></script>
     <!-- am animated JavaScript -->
     <script src="js/animated.js"></script>
     <!-- am kelly JavaScript -->
     <script src="js/kelly.js"></script>
     <!-- am maps JavaScript -->
     <script src="js/maps.js"></script>
     <!-- am worldLow JavaScript -->
     <script src="js/worldLow.js"></script>
     <!-- Raphael-min JavaScript -->
     <script src="js/raphael-min.js"></script>
     <!-- Morris JavaScript -->
     <script src="js/morris.js"></script>
     <!-- Morris min JavaScript -->
     <script src="js/morris.min.js"></script>
     <!-- Flatpicker Js -->
     <script src="js/flatpickr.js"></script>
     <!-- Style Customizer -->
     <script src="js/style-customizer.js"></script>
     <!-- Chart Custom JavaScript -->
     <script src="js/chart-custom.js"></script>
     <!-- Custom JavaScript -->
     <script src="js/custom.js"></script>
  </body>
</html>