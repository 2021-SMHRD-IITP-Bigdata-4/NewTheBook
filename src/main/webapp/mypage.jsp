<%@page import="java.util.Random"%>
<%@page import="DTO.UserDTO"%>
<%@page import="DTO.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- icon ��ó -->
    <link rel="stylesheet" href="css/uicons-regular-rounded.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Typography CSS -->
    <link rel="stylesheet" href="css/typography.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- font css -->
    <link rel="stylesheet" href="font/font.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	int bestint = ran.nextInt(5)+1;
	
	System.out.println(bestint);
	%>

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
                        <span class="text-primary text-uppercase">Logo</span>
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
                            <a href="#dashboard" class="iq-waves-effect" data-toggle="collapse"
                                aria-expanded="true"><span class="ripple rippleEffect"></span><i
                                    class="fi-rr-shop"></i><span>�޴�</span><i class="fi-rr-caret-right"></i></a>
                            <ul id="dashboard" class="iq-submenu collapse show" data-parent="#iq-sidebar-toggle">
                                <li class="active"><a href="index.jsp"><i class="fi-rr-home"></i>���� ������</a></li>
                                <li><a href="category.jsp"><i class="fi-rr-comment-alt"></i>ī�װ� ������</a></li>
                                <li><a href="wishlist.jsp"><i class="fi-rr-comment-heart"></i>���ø���Ʈ</a></li>
                                <%if(singledto == null ){ %>
								<li><a href="login.jsp"><i class="fi-rr-power"></i>�α���</a></li>
								<!-- if �� �߰� -->
								<li><a href="join.jsp"><i class="fi-rr-power"></i>ȸ������</a></li>
								<%} %>
                            </ul>
                        </li>
                        <!-- ���� ������ if �� �߰� -->
                        <li>
                            <a href="#userinfo" class="iq-waves-effect" data-toggle="collapse"
                                aria-expanded="false"><span class="ripple rippleEffect"></span><i
                                    class="fi-rr-mode-portrait"></i><span>���� ������</span><i
                                    class="fi-rr-caret-right"></i></a>
                            <ul id="userinfo" class="iq-submenu collapse"
								data-parent="#iq-sidebar-toggle">
								<li><a href="mypage.jsp"><i class="fi-rr-user"></i>����������</a></li>
						</ul>
                        </li>
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
                                    <span class="text-primary text-uppercase">Booksto</span>
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
                        <form action="#" class="searchbox">
                            <input type="text" class="text search-input" placeholder="�˻��ؤ�����">
                            <a class="search-link" href="#"><i class="fi-rr-search"></i></a>
                        </form>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-label="Toggle navigation">
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
                                <form action="#" class="search-box p-0">
                                    <input type="text" class="text search-input" placeholder="�˻�â�̿ýô�">
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
                                                <h5 class="mb-0 text-white">�˸�<small
                                                        class="badge  badge-light float-right pt-1">4</small></h5>
                                            </div>
                                            <!-- �˸� ����Ʈ -->
                                            <a href="#" class="iq-sub-card">
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
                                            <a href="#" class="iq-sub-card">
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
                                            <a href="#" class="iq-sub-card">
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
                                            <a href="#" class="iq-sub-card">
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
                                                <h5 class="mb-0 text-white">�޼���<small
                                                        class="badge  badge-light float-right pt-1">5</small></h5>
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
                                                <h5 class="mb-0 text-white">�����丮<small
                                                        class="badge  badge-light float-right pt-1">4</small></h5>
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
                                                    <div class="float-right font-size-24 text-danger"><i
                                                            class="ri-close-fill"></i></div>
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
                                                    <div class="float-right font-size-24 text-danger"><i
                                                            class="ri-close-fill"></i></div>
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
                                                    <div class="float-right font-size-24 text-danger"><i
                                                            class="ri-close-fill"></i></div>
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
                                                    <div class="float-right font-size-24 text-danger"><i
                                                            class="ri-close-fill"></i></div>
                                                </div>
                                            </a>
                                            <div class="d-flex align-items-center text-center p-3">
                                                <a class="btn btn-primary mr-2 iq-sign-btn" href="#" role="button">View
                                                    Cart</a>
                                                <a class="btn btn-primary iq-sign-btn" href="#" role="button">Shop
                                                    now</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="line-height pt-3">
                                <a href="#" class="search-toggle iq-waves-effect d-flex align-items-center">
                                    <div class="caption">
                                        <%if(singledto !=null){ %>
										<h6 class="mb-1 line-height"><%=singledto.getName() %> ��</h6>
										<p class="mb-0 text-primary">ȯ���մϴ�</p>
									<%}else{ %>
										<h6 class="mb-1 line-height">�α���</h6>
										<p class="mb-0 text-primary">�α����ϼ���</p>
									<%} %>
                                    </div>
                                </a>
                                <div class="iq-sub-dropdown iq-user-dropdown">
                                    <div class="iq-card shadow-none m-0">
                                        <div class="iq-card-body p-0 ">
                                            <div class="bg-primary p-3">
                                                <h5 class="mb-0 text-white line-height">�ڱ�Ұ�</h5>
                                                <span class="text-white font-size-12">����</span>
                                            </div>
                                            <a href="profile.html" class="iq-sub-card iq-bg-primary-hover">
                                                <div class="media align-items-center">
                                                    <div class="rounded iq-card-icon iq-bg-primary">
                                                        <i class="fi-rr-user"></i>
                                                    </div>
                                                    <div class="media-body ml-3">
                                                        <h6 class="mb-0 ">������</h6>
                                                        <p class="mb-0 font-size-12">View personal profile details.</p>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="profile-edit.html" class="iq-sub-card iq-bg-primary-hover">
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
                                                <a class="bg-primary iq-sign-btn" href="sign-in.jsp"
                                                    role="button">�α׾ƿ�</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- ����Ʈ���� ���̺� -->
    <div id="content-page" class="content-page">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-header d-flex justify-content-between align-items-center position-relative">
                            <div class="iq-header-title">
                                <h4 class="card-title mb-0">����ڴ� ����������</h4>
                            </div>
                        </div>
                        <!-- js -->
                        <div class="iq-card-body">
                            <div class="row">
                                <div class="col-sm-6 col-md-4 col-lg-3">
                                    <div
                                        class="iq-card iq-card-block iq-card-stretch iq-card-height browse-bookcontent">
                                        <div class="iq-card-body p-0">
                                            <div class="d-flex align-items-center">
                                                <div class="container">
                                                    <form action="myPage">
														<div class="form-group" style="margin-left: 500px">
															���̵� <input type="email" class="form-control" id="email"
																placeholder="���̵�" name="email" style="width: 500px;" >
														</div>
														<div class="form-group" style="margin-left: 500px">
															��й�ȣ ���� <input type="password" class="form-control"
																id="pwd" placeholder="��й�ȣ ����" name="pwd"
																style="width: 500px;">
														</div>
														<div class="form-group" style="margin-left: 500px">
															��й�ȣ Ȯ�� <input type="password" class="form-control"
																id="pwd" placeholder="��й�ȣ ����Ȯ��" name="pwd"
																style="width: 500px;">
														</div>
														<div class="form-group" style="margin-left: 500px">
															�̸�:
															<p>ȫ�浿</p>
														</div>
														<div class="form-group" style="margin-left: 500px">
															���� <input type="date" class="form-control" id="birthdate"
																placeholder="����" name="birthdate" style="width: 500px;">
														</div>
														<div class="form-group" style="margin-left: 500px">
															����:
															<p>����</p>
														</div>
														<div class="form-group" style="margin-left: 500px">
															<label class="radio-inline"><input type="radio"
																name="marriage" value="y" checked>��ȥ</label> <label
																class="radio-inline"><input type="radio"
																name="marriage" value="n">��ȥ</label>
														</div>
														<div class="form-group" style="margin-left: 500px">
															������ ���� <input type="image" class="form-control"
																id="picture" placeholder="������ ����" name="profile"
																style="width: 500px;">
														</div>
														<div class="form-group" style="margin-left: 500px">
															�帣
															<div style="margin-left: 100px;">
																<select name="genre" id="genre" style="width: 300px;">
																	<option value="health">�ǰ�/���</option>
																	<option value="comic">��ȭ/����Ʈ�뺧</option>
																	<option value="novel">�Ҽ�/��/���</option>
																	<option value="humanities">�ι�</option>
																	<option value="selfdevelop">�ڱ���</option>
																	<option value="essay">������</option>
																	<option value="regilon">����</option>
																	<option value="artic">����</option>

																</select>
															</div>
														</div>
														<div class="form-group" style="margin-left: 500px">
															ī�װ� <input type="text" class="form-control"
																id="category" placeholder="��ȣ�ϴ� ī�װ�" name="category"
																style="width: 500px;">
														</div>
														<button type="submit" class="btn btn-default"
															style="margin-left: 700px;">ȸ������ ����</button>
													</form>
                                                  </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</body>

</html>