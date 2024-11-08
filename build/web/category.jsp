<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html class="no-js" lang="en">

    <!-- Mirrored from themegenix.net/html/bemet/shop.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Nov 2023 02:25:48 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Bemet - Butcher & Meat Shop HTML Template</title>
        <meta name="description" content="Bemet - Butcher & Meat Shop HTML Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/odometer.css">
        <link rel="stylesheet" href="assets/css/jquery-ui.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/default.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
    </head>
    <body> 
        <div id="preloader">
            <div id="loading-center">
                <div class="loader">
                    <div class="loader-outter"></div>
                    <div class="loader-inner"></div>
                </div>
            </div>
        </div>
        <!-- preloader-end -->

        <!-- Scroll-top -->
        <button class="scroll-top scroll-to-target" data-target="html">
            <i class="fas fa-angle-up"></i>
        </button>
        <%@include file="./inc/header.jsp"  %>

        <section class="breadcrumb-area tg-motion-effects breadcrumb-bg" data-background="assets/img/bg/breadcrumb_bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-content">
                            <h2 class="title">Our Shop</h2>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index-2.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">${category.name}</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb-area-end -->

        <!-- shop-area -->
        <section class="shop-area shop-bg" data-background="assets/img/bg/shop_bg.jpg">
            <div class="container custom-container-five">
                <div class="shop-inner-wrap">
                    <div class="row">
                        <div class="col-xl-9 col-lg-8">
                            <div class="shop-top-wrap">
                                <div class="row align-items-center">
                                    <div class="col-md-6">
                                        <div class="shop-showing-result">
                                            <p>Showing 1?09 of 20 results</p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="shop-ordering">
                                            <select name="orderby" class="orderby">
                                                <option value="Default sorting">Sort by Top Rating</option>
                                                <option value="Sort by popularity">Sort by popularity</option>
                                                <option value="Sort by average rating">Sort by average rating</option>
                                                <option value="Sort by latest">Sort by latest</option>
                                                <option value="Sort by latest">Sort by latest</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="shop-item-wrap">
                                <div class="row">
                                    <c:forEach items="${productList}" var="product">
                                        <div class="col-xl-4 col-md-6">
                                            <div class="product-item-three inner-product-item">
                                                <div class="product-thumb-three">
                                                    <a href="ProductServlet?productId=${product.id}">
                                                        <img src="${product.thumbnail}" alt="">
                                                    </a>
                                                    <span class="batch">New<i class="fas fa-star"></i></span>
                                                </div>
                                                <div class="product-content-three">
                                                    <a href="shop.html" class="tag">${category.name}</a>
                                                    <h2 class="title"><a href="ProductServlet?productId=${product.id}">${product.name}</a></h2>
                                                    <h2 class="price">${product.price}</h2>
                                                    <div class="product-cart-wrap">
                                                        <form action="#">
                                                            <div class="cart-plus-minus">
                                                                <input type="text" value="1">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="product-shape-two">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 303 445" preserveAspectRatio="none">
                                                    <path d="M319,3802H602c5.523,0,10,5.24,10,11.71l-10,421.58c0,6.47-4.477,11.71-10,11.71H329c-5.523,0-10-5.24-10-11.71l-10-421.58C309,3807.24,313.477,3802,319,3802Z" transform="translate(-309 -3802)" />
                                                    </svg>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                        </div>
                        <div class="col-xl-3 col-lg-4">
                            <div class="shop-sidebar">
                                <div class="shop-widget">
                                    <h4 class="sw-title">FILTER BY</h4>
                                    <div class="price_filter">
                                        <div id="slider-range"></div>
                                        <div class="price_slider_amount">
                                            <input type="submit" class="btn" value="Filter">
                                            <span>Price :</span>
                                            <input type="text" id="amount" name="price" placeholder="Add Your Price"/>
                                        </div>
                                        <div class="clear-btn">
                                            <button type="reset"><i class="far fa-trash-alt"></i>Clear all</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="shop-widget">
                                    <h4 class="sw-title">Category</h4>
                                    <div class="shop-cat-list">
                                        <ul class="list-wrap">
                                            <li>
                                                <div class="shop-cat-item">
                                                    <input class="form-check-input" type="checkbox" value="" id="catOne">
                                                    <label class="form-check-label" for="catOne">UI Templates <span>05</span></label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="shop-cat-item">
                                                    <input class="form-check-input" type="checkbox" value="" id="catTwo">
                                                    <label class="form-check-label" for="catTwo">Mutton <span>07</span></label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="shop-cat-item">
                                                    <input class="form-check-input" type="checkbox" value="" id="catThree">
                                                    <label class="form-check-label" for="catThree">Chicken <span>12</span></label>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="shop-widget">
                                    <h4 class="sw-title">Latest Products</h4>
                                    <div class="latest-products-wrap">
                                        <div class="lp-item">
                                            <div class="lp-thumb">
                                                <a href="shop-details.html"><img src="assets/img/product/lp_img01.jpg" alt=""></a>
                                            </div>
                                            <div class="lp-content">
                                                <h4 class="title"><a href="shop-details.html">roast chicken</a></h4>
                                                <span class="price">$4.99</span>
                                            </div>
                                        </div>
                                        <div class="lp-item">
                                            <div class="lp-thumb">
                                                <a href="shop-details.html"><img src="assets/img/product/lp_img02.jpg" alt=""></a>
                                            </div>
                                            <div class="lp-content">
                                                <h4 class="title"><a href="shop-details.html">Venison meat</a></h4>
                                                <span class="price">$4.99</span>
                                            </div>
                                        </div>
                                        <div class="lp-item">
                                            <div class="lp-thumb">
                                                <a href="shop-details.html"><img src="assets/img/product/lp_img03.jpg" alt=""></a>
                                            </div>
                                            <div class="lp-content">
                                                <h4 class="title"><a href="shop-details.html">roast chicken</a></h4>
                                                <span class="price">$4.99</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="shop-widget">
                                    <h4 class="sw-title">instagram</h4>
                                    <div class="sidebar-instagram">
                                        <ul class="list-wrap">
                                            <li>
                                                <a href="#"><img src="assets/img/product/s_insta_img01.jpg" alt=""></a>
                                            </li>
                                            <li>
                                                <a href="#"><img src="assets/img/product/s_insta_img02.jpg" alt=""></a>
                                            </li>
                                            <li>
                                                <a href="#"><img src="assets/img/product/s_insta_img03.jpg" alt=""></a>
                                            </li>
                                            <li>
                                                <a href="#"><img src="assets/img/product/s_insta_img04.jpg" alt=""></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="./inc/footer.jsp"  %>

        <script src="assets/js/vendor/jquery-3.6.0.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/imagesloaded.pkgd.min.js"></script>
        <script src="assets/js/jquery.countdown.min.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/jquery.odometer.min.js"></script>
        <script src="assets/js/jquery.appear.js"></script>
        <script src="assets/js/tween-max.min.js"></script>
        <script src="assets/js/slick.min.js"></script>
        <script src="assets/js/slick-animation.min.js"></script>
        <script src="assets/js/jquery-ui.min.js"></script>
        <script src="assets/js/ajax-form.js"></script>
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>

</html>