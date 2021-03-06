<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <script src="https://cdn.auth0.com/js/lock-9.0.min.js"></script>
    <title>KoolTron</title>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Toys Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
  Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //Custom Theme files -->
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link href="css/styles.css?v=1.6" rel="stylesheet">
    <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
    <!-- js -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/scripts.js?v=1.7"></script>
    <!-- //js -->
    <!-- start-smoth-scrolling-->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!--//end-smoth-scrolling-->
</head>
<body>
<script type="text/javascript">

    <%!

        // Converts a relative path into a full path
        // Taken from http://stackoverflow.com/posts/5212336/revisions
       public String buildUrl(HttpServletRequest request, String relativePath) {


        String scheme      =    request.getScheme();        // http
        String serverName  =    request.getServerName();    // hostname.com
        int serverPort     =    request.getServerPort();    // 80
        String contextPath =    request.getContextPath();   // /mywebapp

        // Reconstruct original requesting URL
        StringBuffer url =  new StringBuffer();
        url.append(scheme).append("://").append(serverName);

        if ((serverPort != 80) && (serverPort != 443)) {
            url.append(":").append(serverPort);
        }

        url.append(contextPath).append(relativePath);

        return url.toString();

        }
     %>

    var lock = new Auth0Lock('<%= application.getInitParameter("auth0.client_id") %>', '<%= application.getInitParameter("auth0.domain") %>');

    function signin() {
        lock.show({
            callbackURL: '<%= buildUrl(request, "/callback") %>'
            , responseType: 'code'
            , authParams: {
                state: '${state}'
                , scope: 'openid name email picture'
            }
        });
    }
</script>
<% if ( request.getParameter("error") != null ) { %>
<%-- TODO Escape and encode ${param.error} properly. It can be done using jstl c:out. --%>
<span style="color: red;">${param.error}</span>
<% } %>

<!-- header -->
<div class="banner header-bg">
    <div class="navigation">
        <div class="container-fluid">
            <nav class="pull">
                <ul class="nav">
                    <li><a href="index.html" class="active"> Home</a></li>
                    <li><a href="dashboard.html" class="active">Dashboard</a></li>
                    <li><a href="about.html"> About</a></li>
                    <li><a href="contact.html"> Mail us</a></li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="header-top">
        <div class="container">
            <div class="head-logo">
                <h1><a href="index.html">KoolTron</a></h1>
            </div>
            <div class="top-nav">
                <div class="hero fa-navicon fa-2x nav_slide_button" id="hero">
                    <a href="#"><img src="images/menu-icon.png" alt=""></a>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <div class="account-wall">
                        <button class="btn btn-lg btn-primary btn-block" onclick="signin()">Hi! there, let's get started blah!</button>
                </div>
            </div>
        </div>
    </div>
    <div class="banner-info">
        <!-- container -->
        <div class="container">
            <!--banner Slider starts Here-->
            <script src="js/responsiveslides.min.js"></script>
            <script>
                // You can also use "$(window).load(function() {"
                $(function () {
                    // Slideshow 3
                    $("#slider3").responsiveSlides({
                        auto: true,
                        pager: true,
                        nav: false,
                        speed: 500,
                        namespace: "callbacks",
                        before: function () {
                            $('.events').append("<li>before event fired.</li>");
                        },
                        after: function () {
                            $('.events').append("<li>after event fired.</li>");
                        }
                    });

                });
            </script>
            <!--//End-slider-script-->
            <div  id="top" class="callbacks_container">
                <ul class="rslides" id="slider3">
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"> </div>
<!--//header -->
<!-- welcome-->
<div class="welcome">
    <div class="container">
        <h3 class="hdng">Welcome</h3>
        <p>KoolTron is an order management system to order your favourite toys. </p>
        <div class="welcome-info">
            <div class="col-md-4 welcome-grids">
                <div class="welcome-imgs welcm-top">
                    <img src="images/img1.jpg" class="img-responsive" alt="/">
                    <div class="textbox">
                        <h4>Check</h4>
                    </div>
                </div>
                <div class="welcome-imgs">
                    <img src="images/img2.jpg" class="img-responsive" alt="/">
                    <div class="textbox">
                        <h4>Check</h4>
                    </div>
                </div>
            </div>
            <div class="col-md-4 welcome-grids middle">
                <div class="welcome-imgs">
                    <img src="images/img3.jpg" class="img-responsive" alt="/">
                    <div class="textbox">
                        <h4>Check</h4>
                    </div>
                </div>
            </div>
            <div class="col-md-4 welcome-grids">
                <div class="welcome-imgs welcm-top">
                    <img src="images/img4.jpg" class="img-responsive" alt="/">
                    <div class="textbox">
                        <h4>Check</h4>
                    </div>
                </div>
                <div class="welcome-imgs">
                    <img src="images/img5.jpg" class="img-responsive" alt="/">
                    <div class="textbox">
                        <h4>Check</h4>
                    </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--//welcome-->
<!-- services -->
<!-- //services -->
<!--footer-->
<div class="footer">
    <div class="container">
        <div class="footer-row">
            <div class="col-md-3 footer-grids">
                <h3>Flickr Posts</h3>
                <div class="footer-grd">
                    <a href="#">
                        <img src="images/f1.jpg" class="img-responsive" alt=" ">
                    </a>
                </div>
                <div class="footer-grd">
                    <a href="#">
                        <img src="images/f2.jpg" class="img-responsive" alt=" ">
                    </a>
                </div>
                <div class="footer-grd">
                    <a href="#">
                        <img src="images/f3.jpg" class="img-responsive" alt=" ">
                    </a>
                </div>
                <div class="clearfix"> </div>
                <div class="footer-grd">
                    <a href="#">
                        <img src="images/f4.jpg" class="img-responsive" alt=" ">
                    </a>
                </div>
                <div class="footer-grd">
                    <a href="#">
                        <img src="images/f5.jpg" class="img-responsive" alt=" ">
                    </a>
                </div>
                <div class="footer-grd">
                    <a href="#">
                        <img src="images/f6.jpg" class="img-responsive" alt=" ">
                    </a>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-3 footer-grids">
                <h3>Navigation</h3>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="codes.html">Dashboard</a></li>
                    <li><a href="about.html">About us</a></li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-grids">
                <h3>Support</h3>
                <ul>
                    <li><a href="index.html">Services</a></li>
                    <li><a href="#">Help Center</a></li>
                    <li><a href="contact.html">Mail to Us</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-grids">
                <h3>Newsletter</h3>
                <p>Checkout the latest toy story collection.<p>
                <form>
                    <input type="text" class="text" value="Enter Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter Email';}">
                    <input type="submit" value="Go">
                </form>
                <div class="clearfix"> </div>
                <div class="icons">
                    <ul>
                        <li><a href="#" data-toggle="tooltip" data-placement="bottom" title="Facebook"> </a></li>
                        <li><a class="twt" href="#" data-toggle="tooltip" data-placement="bottom" title="Twitter"> </a></li>
                        <li><a class="gps" href="#" data-toggle="tooltip" data-placement="bottom" title="Google+"> </a></li>
                        <li><a class="in" href="#" data-toggle="tooltip" data-placement="bottom" title="LinkedIn"> </a></li>
                    </ul>
                    <script>$(function () {
                        $('[data-toggle="tooltip"]').tooltip()
                    })</script>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<div class="footer-bottom">
    <div class="container">
        <p> © 2016 KoolTron . All rights reserved </p>
    </div>
</div>
<!--//footer-->
<!--smooth-scrolling-of-move-up-->
<script type="text/javascript">
    $(document).ready(function() {
        /*
         var defaults = {
         containerID: 'toTop', // fading element id
         containerHoverID: 'toTopHover', // fading element hover id
         scrollSpeed: 1200,
         easingType: 'linear'
         };
         */

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!--//smooth-scrolling-of-move-up-->
<!-- Bootstrap core JavaScript
  ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/bootstrap.js"></script>
</body>
</html>
