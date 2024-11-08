<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Bemet - Butcher & Meat Shop HTML Template</title>
        <meta name="description" content="Bemet - Butcher & Meat Shop HTML Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
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
        <button class="scroll-top scroll-to-target" data-target="html">
            <i class="fas fa-angle-up"></i>
        </button>
        <%@include file="./inc/header.jsp"%>

        <section class="breadcrumb-area tg-motion-effects breadcrumb-bg" data-background="assets/img/bg/breadcrumb_bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-content">
                            <h2 class="title">Shop Details</h2>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index-2.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">${product.name}</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb-area-end -->

        <!-- shop-details-area -->
        <section class="shop-details-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="shop-details-images-wrap">
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane show active" id="itemOne-tab-pane" role="tabpanel" aria-labelledby="itemOne-tab" tabindex="0">
                                    <a href="./assets/img/upload/${product.thumbnail}" class="popup-image">
                                        <img id="big-img" src="./assets/img/upload/${product.thumbnail}" alt="${product.name}" width="100%">
                                    </a>
                                </div>
                            </div>
                            <ul class="nav nav-tabs">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link">
                                        <img class="thumb-image" src="./assets/img/upload/${product.thumbnail}" alt="" width="125px">
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link">
                                        <img class="thumb-image" src="./assets/img/upload/${product.thumbnail}" alt="" width="125px">
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link">
                                        <img class="thumb-image" src="./assets/img/upload/${product.thumbnail}" alt="" width="125px">
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="shop-details-content">
                            <h2 class="title">${product.name}</h2>
                            <div class="review-wrap">
                                <div class="rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <span>(4 customer reviews)</span>
                            </div>
                            <h3 class="price">$${product.price}</h3>

                            <!-- Form thêm vào gi? hàng -->
                            <form action="CartServlet" method="post" class="single-pro-details">
                                <input type="hidden" name="action" value="create"/>
                                <input type="hidden" name="productId" value="${product.id}"/>
                                <input type="hidden" name="price" value="${product.price}"/>
                                <h6 class="text-muted">Home/ ${product.category.name}</h6>
                                <h4 class="product-title">${product.name}</h4>
                                <h2 class="product-price">$${product.price}</h2>
                                <div class="form-group">
                                    <label for="size" class="form-label">Select Size:</label>
                                    <select name="size" id="size" class="form-control">
                                        <option>Select</option>
                                        <option value="S">1kg</option>
                                        <option value="M">3kg</option>
                                        <option value="L">5kg</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="quantity" class="form-label">Quantity:</label>
                                    <input name="quantity" type="number" value="1" id="quantity" class="form-control">
                                </div>
                                <button class="btn btn-primary btn-block mt-3">Add To Cart</button>
                                <div class="product-details mt-4">
                                    <p class="text-muted">${product.description}</p>
                                </div>
                            </form>
                                <div class="qr-code" style="margin-top: 20px;">
                                    <c:set var="thumbnailUrl" value="${product.thumbnail}" />
                                    <c:set var="nameUrl" value="${product.name}" />
                                    <c:set var="priceUrl" value="${product.price}" />


                                    <c:set var="qrCodeUrl" value="${thumbnailUrl} ${nameUrl} ${priceUrl}" />


                                    <!-- QR Code Image -->
                                    <img src="https://api.qrserver.com/v1/create-qr-code/?data=${qrCodeUrl}&size=100x100" alt="QR Code for ${product.name}" class="img-qr" />

                                    <span class="tooltip">Scan for details</span>
                                </div>
                            <a href="#" class="buy-btn">Buy it now</a>
                            <div class="payment-method-wrap">
                                <span class="title">GUARANTEED SAFE CHECKOUT:</span>
                                <img src="assets/img/product/payment_method.png" alt="">
                            </div>
                            <div class="sd-category">
                                <span class="title">CATEGORY: ${product.category.name}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="product-desc-wrap">
                            <ul class="nav nav-tabs" id="descriptionTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="description-tab" data-bs-toggle="tab" data-bs-target="#description-tab-pane" type="button" role="tab" aria-controls="description-tab-pane" aria-selected="true">Description</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="reviews-tab" data-bs-toggle="tab" data-bs-target="#reviews-tab-pane" type="button" role="tab" aria-controls="reviews-tab-pane" aria-selected="false">Reviews (0)</button>
                                </li>
                            </ul>
                            <div class="tab-content" id="descriptionTabContent">
                                <div class="tab-pane fade show active" id="description-tab-pane" role="tabpanel" aria-labelledby="description-tab" tabindex="0">
                                    <div class="product-description-content">
                                        ${product.description}
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="reviews-tab-pane" role="tabpanel" aria-labelledby="reviews-tab" tabindex="0">
                                    <div class="product-desc-review">
                                        <div class="product-desc-review-title mb-15">
                                            <h5 class="title">Customer Reviews (0)</h5>
                                        </div>
                                        <div class="left-rc">
                                            <p>No reviews yet</p>
                                        </div>
                                        <div class="right-rc">
                                            <a href="#">Write a review</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="related-product-area pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title text-center mb-50">
                            <span class="sub-title">Organic Shop</span>
                            <h2 class="title">Related Products</h2>
                            <div class="title-shape" data-background="assets/img/images/title_shape.png"></div>
                        </div>
                    </div>
                </div>
                <div class="product-item-wrap-three">
                    <div class="row justify-content-center rp-active">
                        <c:forEach items="${newsProductList}" var="product">
                            <div class="col-xl-3">
                                <div class="product-item-three inner-product-item">
                                    <div class="product-thumb-three">
                                        <a href="ProductServlet?productId=${product.id}">
                                            <img src="./assets/img/upload/${product.thumbnail}" alt="${product.name}">
                                        </a>
                                        <span class="batch">New<i class="fas fa-star"></i></span>
                                    </div>
                                    <div class="product-content-three">
                                        <a href="shop.html" class="tag">Category: ${product.category.name}</a>
                                        <h2 class="title">
                                            <a href="ProductServlet?productId=${product.id}">${product.name}</a>
                                        </h2>
                                        <h2 class="price">$${product.price}</h2>
                                        <div class="product-cart-wrap">
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
        </section>
        <%@include file="./inc/footer.jsp"%>
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