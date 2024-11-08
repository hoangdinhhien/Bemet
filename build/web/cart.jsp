<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        <%@include file="./inc/header.jsp"  %>

        <section class="breadcrumb-area tg-motion-effects breadcrumb-bg" data-background="assets/img/bg/breadcrumb_bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-content">
                            <h2 class="title">Your Shopping Cart</h2>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="HomeServlet">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Your favorites</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb-area-end -->

        <!-- contact-area -->
        <section class="contact-area">
            <div class="contact-wrap">
                <div class="container">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Image</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th></th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach items="${cart}" var="orderItem" varStatus="status">
                                <tr>
                                    <td scope="row">${status.index+1}</td>
                                    <td>
                                        <img src="./assets/img/upload/${orderItem.product.thumbnail}" width="60">
                                    </td>
                                    <td>${orderItem.product.name}</td>
                                    <td>${orderItem.price}</td>
                                    <td>
                                        <form action="CartServlet" method="post">
                                            <input type="hidden" name="action" value="update"/>
                                            <input type="hidden" name="productId" value="${orderItem.productId}">
                                            <input type="number" value="${orderItem.quantity}" name="quantity" style="width: 60px; text-align:center">
                                            <button type="submit"><i class="fa fa-save"></i></button>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="CartServlet" method="post">
                                            <input type="hidden" name="action" value="delete"/>
                                            <input type="hidden" name="productId" value="${orderItem.productId}"/>
                                            <button type="submit" class="fas fa-trash"></button>
                                        </form>
                                    </td>
                                    <td>${orderItem.price * orderItem.quantity}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <br>
                    <div class="text-center">
                        <a href="HomeServlet" class="btn btn-primary">Continue shopping</a>
                        <c:if test="${not empty cart}">
                            <a href="CheckoutServlet" class="btn btn-success">Check</a>
                        </c:if>
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