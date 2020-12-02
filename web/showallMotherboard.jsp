<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.*" %>
<%@ page import="entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" autoFlush="false" buffer="300kb"%>

<html>

<head>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DB Management Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="dbmanagePage/assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="dbmanagePage/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="dbmanagePage/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="dbmanagePage/assets/css/themify-icons.css">
    <link rel="stylesheet" href="dbmanagePage/assets/css/metisMenu.css">
    <link rel="stylesheet" href="dbmanagePage/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="dbmanagePage/assets/css/slicknav.min.css">
    <!-- Start datatable css -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
    <!-- others css -->
    <link rel="stylesheet" href="dbmanagePage/assets/css/typography.css">
    <link rel="stylesheet" href="dbmanagePage/assets/css/default-css.css">
    <link rel="stylesheet" href="dbmanagePage/assets/css/styles.css">
    <link rel="stylesheet" href="dbmanagePage/assets/css/responsive.css">
    <!-- modernizr css -->
    <script src="dbmanagePage/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<!-- preloader area start -->
<div id="preloader">
    <div class="loader"></div>
</div>
<!-- preloader area end -->
<!-- page container area start -->
<div class="page-container">
    <!-- sidebar menu area start -->
    <div class="sidebar-menu">
        <div class="sidebar-header">
            <div class="logo">
                <a href="showall.jsp"><img src="dbmanagePage/assets/images/icon/logo.png" alt="logo"></a>
            </div>
        </div>
        <div class="main-menu">
            <div class="menu-inner">
                <nav>
                    <ul class="metismenu" id="menu">

                        <li class="active">
                            <a href="javascript:void(0)" aria-expanded="true"><i class="fa fa-table"></i>
                                <span>Tables</span></a>
                            <ul class="collapse">
                                <li><a href="dbmanagePage/datatable.html">basic table</a></li>
                                <li><a href="showall.jsp">table layout</a></li>
                                <li><a href="showallCPU.jsp">CPU</a></li>
                                <li><a href="showallGPU.jsp">GPU</a></li>
                                <li class="active"><a href="showallMotherboard.jsp">Motherboard</a></li>
                                <li><a href="showallMemory.jsp">Memory</a></li>
                                <li><a href="showallStorage.jsp">Storage</a></li>
                                <li><a href="showallCoolingSystem.jsp">Cooler</a></li>
                                <li><a href="showallComputercase.jsp">Case</a></li>
                                <li><a href="showallPowerSupply.jsp">Power Supply</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <!-- sidebar menu area end -->
    <!-- main content area start -->
    <div class="main-content">
        <!-- header area start -->
        <div class="header-area">
            <div class="row align-items-center">
                <!-- nav and search button -->
                <div class="col-md-6 col-sm-8 clearfix">
                    <div class="nav-btn pull-left">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    <div class="search-box pull-left">
                        <form action="#">
                            <input type="text" name="search" placeholder="Search..." required>
                            <i class="ti-search"></i>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- header area end -->
        <!-- page title area start -->
        <div class="page-title-area">
            <div class="row align-items-center">
                <div class="col-sm-6">
                    <div class="breadcrumbs-area clearfix">
                        <h4 class="page-title pull-left">Dashboard</h4>
                        <ul class="breadcrumbs pull-left">
                            <li><a href="dbmanagePage/index.html">Home</a></li>
                            <li><span>Table Layout</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 clearfix">
                    <div class="user-profile pull-right">
                        <img class="avatar user-thumb" src="dbmanagePage/assets/images/author/avatar.png" alt="avatar">
                        <h4 class="user-name dropdown-toggle" data-toggle="dropdown">Administrator <i class="fa fa-angle-down"></i></h4>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Message</a>
                            <a class="dropdown-item" href="#">Settings</a>
                            <a class="dropdown-item" href="#">Log Out</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- page title area end -->
        <div class="main-content-inner">
            <div class="row">
                <!-- data table start -->
                <div class="col-12 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <div class="data-tables">
                                <table id="CPU" class="text-center">
                                    <thead>
                                    <tr>
                                        <th scope="col">partsName</th>
                                        <th scope="col">ratings</th>
                                        <th scope="col">price</th>
                                        <th scope="col">brand</th>
                                        <th scope="col">Compatible Socket</th>
                                        <th scope="col">PCIe Version</th>
                                        <th scope="col">Number of PCIe X1 port</th>
                                        <th scope="col">USB 3.0 Support?</th>
                                        <th scope="col">Number of M.2 port</th>
                                        <th scope="col">size</th>
                                        <th scope="col">Delete</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <%
                                        MotherboardDAO daoMB = new MotherboardDAO();
                                        ArrayList<Motherboard> Motherboards = daoMB.getAllMotherboard();
                                        for (Motherboard M : Motherboards) {
                                    %>
                                    <tr>
                                        <td data-label="partsName"><%=M.getPartsName()%></td>
                                        <td data-label="ratings"><%=M.getRatings()%></td>
                                        <td data-label="price"><%=M.getPrice()%></td>
                                        <td data-label="brand"><%=M.getBrand()%></td>
                                        <td data-label="Compatible Socket"><%=M.getCompatible_socket()%></td>
                                        <td data-label="PCIe_version"><%=M.getPCIe_version()%></td>
                                        <td data-label="number_of_PCIe_X1"><%=M.getNumber_of_PCIe_X1()%></td>
                                        <td data-label="Number of m.2"><%=M.getNumber_of_m2()%></td>
                                        <td data-label="USB3.0 supported?"><%=M.getUSB3_supported()%></td>
                                        <td data-label="Motherboard Type"><%=M.getMotherboard_type()%></td>
                                        <td><a class="ti-trash" href="DeleteServlet?id=<%=M.getPartsID() %>"></a></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- data table end -->



            </div>
        </div>
    </div>
    <!-- main content area end -->
    <!-- footer area start-->
    <footer>
        <div class="footer-area">
            <p><a href="${pageContext.request.contextPath}/insertMotherboard.jsp">insert</a><br></p>
            <p><a href="${pageContext.request.contextPath}/index.jsp">back</a></p>
        </div>
    </footer>
    <!-- footer area end-->
</div>
<!-- page container area end -->
<!-- offset area start -->
<!-- offset area end -->
<!-- jquery latest version -->
<script src="dbmanagePage/assets/js/vendor/jquery-2.2.4.min.js"></script>
<!-- bootstrap 4 js -->
<script src="dbmanagePage/assets/js/popper.min.js"></script>
<script src="dbmanagePage/assets/js/bootstrap.min.js"></script>
<script src="dbmanagePage/assets/js/owl.carousel.min.js"></script>
<script src="dbmanagePage/assets/js/metisMenu.min.js"></script>
<script src="dbmanagePage/assets/js/jquery.slimscroll.min.js"></script>
<script src="dbmanagePage/assets/js/jquery.slicknav.min.js"></script>

<!-- Start datatable js -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>

<!-- others plugins -->
<script src="dbmanagePage/assets/js/plugins.js"></script>
<script src="dbmanagePage/assets/js/scripts.js"></script>
</body>

</html>
