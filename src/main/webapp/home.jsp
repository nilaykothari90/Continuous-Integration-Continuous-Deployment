<%@ page import="com.auth0.Auth0User" %>
<%@ page import="edu.sjsu.cohort6.cloudservices.dao.Products" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>KoolTron</title>
  <!-- Custom Theme files -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="keywords" content="Toys Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
  Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
  <!-- //Custom Theme files -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
  <link href="${pageContext.request.contextPath}/css/styles.css?v=1.6" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" media="all">
  <!-- js -->
  <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/scripts.js?v=1.7"></script>
  <!-- //js -->
  <!-- start-smoth-scrolling-->
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/move-top.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/easing.js"></script>
  <script type="text/javascript">
    jQuery(document).ready(function($) {
      $(".scroll").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
      });
    });
  </script>
  <!--//end-smoth-scrolling-->
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <title>Welcome</title>
  <script src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
<script type="text/javascript">

  <%!
    // Converts a relative path into a full path
    public String buildUrl(HttpServletRequest request, String relativePath) {
      final String scheme = request.getScheme();
      final String serverName = request.getServerName();
      final int serverPort = request.getServerPort();
      final String contextPath = request.getContextPath();
      // Reconstruct original requesting URL
      final StringBuffer url =  new StringBuffer();
      url.append(scheme).append("://").append(serverName);
      if ((serverPort != 80) && (serverPort != 443)) {
        url.append(":").append(serverPort);
      }
      url.append(contextPath).append(relativePath);
      return url.toString();
    }
  %>

  <% Auth0User user = (Auth0User) request.getAttribute("user"); %>
  <% List<Products> products = (List<Products>) request.getAttribute("products"); %>

  function logout() {
    return window.location = '<%= buildUrl(request, "/logout") %>'
  }

</script>
<!-- header -->
<div class="banner about-bnr">
  <div class="navigation">
    <div class="container-fluid">
      <nav class="pull">
        <ul class="nav">
         <li><a href="index.html"> Home</a></li>
          <li><a href="about.html"> About</a></li>
          <li><a href="dashboard.html" class="active"> Dashboard</a></li>
          <li><a href="contact.html"> Mail us</a></li>
          <button class="btn btn-lg btn-primary btn-block" id="logout">Logout</button>
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
          <a href="#"><img src="${pageContext.request.contextPath}/images/menu-icon.png" alt=""></a>
        </div>
      </div>
      <div class="clearfix"> </div>
    </div>
  </div>
</div>
<!--//header -->
<!--Shortcodes-page -->
<div class="codes">
  <div class="container">
    <table style="width:100%">
      <tbody><tr>
        <td>
          <img src="<%=user.getPicture()%>"/>
          <br />
          Hello <%=user.getName()%>!</p>
          <p>Your nickname is: <%=user.getNickname()%></p>
        </td>
        <td colspan="6">
          <h3 class="hdng">Dashboard</h3>
        </td>
        <td>

        </td>
        <td>
          <input type="button" class="btn btn-primary" onclick="location.href='https://avengerskooltron.slack.com/';" value="Go to Slack">

        </td>
        <td>

        </td>
        <td>
          <input type="button" class="btn btn-primary" onclick="location.href='https://cmpe282-avengers.auth0.com/login?client=Lay944zkO31fUjUiLmhTKinLLhJjqvEB&protocol=samlp&state=&redirect_uri=&request_id=&prompt=';" value="Go to Dropbox">
        </td>

      </tr>

      </tbody>
    </table>


    <div>


    </div>
    <div class="bs-docs-example">
      <table class="table table-hover">
        <thead>
        <tr>
          <th>Product Code</th>
          <th>Product Name</th>
          <th>Product Line</th>
          <th>product Vendor</th>
          <th>product Description</th>
          <th>Quantity InStock</th>
          <th>Buy Price</th>
          <th>MSRP</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="product">
          <tr>
            <td>${product.productCode}</td>
            <td>${product.productName}</td>
            <td>${product.productLine}</td>
            <td>${product.productVendor}</td>
            <td>${product.productDescription}</td>
            <td>${product.quantityInStock}</td>
            <td>${product.buyPrice}</td>
            <td>${product.MSRP}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>
<!-- //typography-page -->
<!--footer-->
<div class="footer">
  <div class="container">
    <div class="footer-row">
      <div class="col-md-3 footer-grids">
        <h3>Flickr Posts</h3>
        <div class="footer-grd">
          <a href="#">
            <img src="${pageContext.request.contextPath}/images/f1.jpg" class="img-responsive" alt=" ">
          </a>
        </div>
        <div class="footer-grd">
          <a href="#">
            <img src="${pageContext.request.contextPath}/images/f2.jpg" class="img-responsive" alt=" ">
          </a>
        </div>
        <div class="footer-grd">
          <a href="#">
            <img src="${pageContext.request.contextPath}/images/f3.jpg" class="img-responsive" alt=" ">
          </a>
        </div>
        <div class="clearfix"> </div>
        <div class="footer-grd">
          <a href="#">
            <img src="${pageContext.request.contextPath}/images/f4.jpg" class="img-responsive" alt=" ">
          </a>
        </div>
        <div class="footer-grd">
          <a href="#">
            <img src="${pageContext.request.contextPath}/images/f5.jpg" class="img-responsive" alt=" ">
          </a>
        </div>
        <div class="footer-grd">
          <a href="#">
            <img src="${pageContext.request.contextPath}/images/f6.jpg" class="img-responsive" alt=" ">
          </a>
        </div>
        <div class="clearfix"> </div>
      </div>
      <div class="col-md-3 footer-grids">
        <h3>Navigation</h3>
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="about.html">About us</a></li>
          <li><a href="dashboard.html">Dashboard</a></li>
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
        <p>It was popularised in the 1960s with the release Ipsum. <p>
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
    <p> © 2016 KoolTron . All rights reserved</p>
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
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<script>
  $("#logout").click(function(e) {
    e.preventDefault();
    logout();
  });

</script>

</body>
</html>
