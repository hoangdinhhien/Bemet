<%-- 
    Document   : header
    Created on : 18 thg 9, 2024, 13:29:33
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="transparent-header">
    <div class="header-top-wrap">
        <div class="container custom-container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-8">
                    <div class="header-top-left">
                        <ul class="list-wrap">
                            <li class="header-location">
                                <i class="fas fa-map-marker-alt"></i>
                                33M Sun Central. New York
                            </li>
                            <li>
                                <i class="fas fa-envelope"></i>
                                <a href="mailto:info@example.com">info@example.com</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-4">
                    <div class="header-top-right">
                        <div class="header-top-menu">
                            <ul class="list-wrap">
                                <li><a href="contact.html">Help</a></li>
                                <li><a href="contact.html">Support</a></li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
                        </div>
                        <div class="header-top-social">
                            <ul class="list-wrap">
                                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                                <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="sticky-header" class="menu-area">
        <div class="container custom-container">
            <div class="row">
                <div class="col-12">
                    <div class="menu-wrap">
                        <div class="mobile-nav-toggler"><i class="fas fa-bars"></i></div>
                        <nav class="menu-nav">
                            <div class="logo">
                                <a href="HomeServlet"><img src="assets/img/logo/logo.png" alt="Logo"></a>
                            </div>
                            <div class="navbar-wrap main-menu d-none d-lg-flex">
                                <ul class="navigation">
                                    <li class="active menu-item-has-children">
                                        <a href="HomeServlet">Home</a>
                                    </li>
                                    <li>
                                        <a href="AboutServlet">ABOUT US</a>
                                    </li>
                                    <li class="menu-item-has-children">
                                        <a href="#">PRODUCTS</a>
                                        <ul class="sub-menu">
                                            <c:forEach items="${categoryList}" var="category">
                                                <li><a href="CategoryServlet?categoryId=${category.id}">${category.name}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </li>
                                    <li class="menu-item-has-children">
                                        <a href="BlogServlet">BLOG</a>
                                        <ul class="sub-menu">
                                            <li><a href="BlogServlet">Our Blog</a></li>
                                            <li><a href="BlogDetailsServlet">Blog Details</a></li>
                                        </ul>
                                    </li>
                                    <li class="menu-item-has-children">
                                        <a href="#">PAGES</a>
                                        <ul class="sub-menu">
                                            <li><a href="ServicesServlet">Services Page</a></li>
                                            <li><a href="ServicesDetailsServlet">Services Details</a></li>
                                            <li><a href="TeamDetailsServlet">Team Details</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="ContactServlet">Contact</a></li>
                                    <li><a href="OrderStatusServlet">Order Status</a></li>
                                </ul>
                            </div>

                            <div class="header-action d-none d-md-block">
                                <ul class="list-wrap">
                                    <li class="header-search">
                                        <a href="#"><i class="flaticon-search"></i></a>
                                    </li>
                                    <li class="header-shop-cart">
                                        <a href="CartServlet">
                                            <i class="flaticon-shopping-basket"></i>
                                            <span>${cartCount}</span>
                                        </a>
                                    </li>
                                    <li><a href=LoginServlet><i class="fa fa-solid fa-user"></i></a>
                                    <li>
                                        <c:if test="${sessionScope.user == null}">
                                            <a href="LoginServlet">Login</a>
                                        </c:if>

                                        <c:if test="${sessionScope.user != null}">
                                            <a href="LogoutServlet">Logout</a>
                                        </c:if>
                                    </li>

                                </ul>
                            </div>
                        </nav>
                    </div>

                    <!-- Mobile Menu  -->
                    <div class="mobile-menu">
                        <nav class="menu-box">
                            <div class="close-btn"><i class="fas fa-times"></i></div>
                            <div class="nav-logo">
                                <a href="index-2.html"><img src="assets/img/logo/logo.png" alt="Logo"></a>
                            </div>
                            <div class="menu-outer">
                                <!--Here Menu Will Come Automatically Via Javascript / Same Menu as in Header-->
                            </div>
                            <div class="social-links">
                                <ul class="clearfix list-wrap">
                                    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                                    <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                    <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                    <div class="menu-backdrop"></div>
                    <!-- End Mobile Menu -->

                </div>
            </div>
        </div>
    </div>

    <!-- header-search -->
    <div class="search-popup-wrap" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="search-wrap text-center">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="search-form">
                            <form action="#">
                                <input type="text" placeholder="Enter your keyword...">
                                <button class="search-btn"><i class="flaticon-search"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="search-backdrop"></div>
    <!-- header-search-end -->

</header>
