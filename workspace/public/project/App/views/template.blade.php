@php
    require_once __DIR__.'/../helpers.php';
@endphp
        <!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/favicon.ico" type="image/ico"/>

    <title>OFCAR</title>
    <!-- jQuery -->
    <script src="@php echo url("public/vendors/jquery/dist/jquery.min.js") @endphp"></script>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="@php echo url('public/vendors/bootstrap/dist/css/bootstrap.min.css') @endphp">
    {{--    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">--}}
    <!-- Font Awesome -->
    <link rel="stylesheet" href="@php echo url('public/vendors/font-awesome/css/font-awesome.min.css') @endphp">
    {{--    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">--}}
    <!-- NProgress -->
    <link rel="stylesheet" href="@php echo url('public/vendors/nprogress/nprogress.css') @endphp">
    {{--    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">--}}
    <!-- iCheck -->
    <link rel="stylesheet" href="@php echo url('public/vendors/iCheck/skins/flat/green.css') @endphp">
    {{--    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">--}}

    <!-- bootstrap-progressbar -->
    <link rel="stylesheet"
          href="@php echo url('public/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css') @endphp">
    {{--    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">--}}
    <!-- JQVMap -->
    <link rel="stylesheet" href="@php echo url('public/vendors/jqvmap/dist/jqvmap.min.css') @endphp">
    {{--    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>--}}
    <!-- bootstrap-daterangepicker -->
    <link rel="stylesheet" href="@php echo url('public/vendors/bootstrap-daterangepicker/daterangepicker.css') @endphp">
    {{--    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">--}}

    <!-- Datatables -->

    {{--    <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">--}}
    <link rel="stylesheet"
          href="@php echo url('public/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css') @endphp">
    {{--    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">--}}
    <link rel="stylesheet"
          href="@php echo url('public/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css') @endphp">
    {{--    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">--}}
    <link rel="stylesheet"
          href="@php echo url('public/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css') @endphp">
    {{--    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">--}}
    <link rel="stylesheet"
          href="@php echo url('public/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css') @endphp">
    {{--    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">--}}
    <link rel="stylesheet"
          href="@php echo url('public/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css') @endphp">

    <!-- Custom Theme Style -->
    <link rel="stylesheet" href="@php echo url('public/build/css/custom.min.css"') @endphp">
    <link rel="stylesheet" href="@php echo url('public/style.css"') @endphp">
    {{--    <link href="../build/css/custom.min.css" rel="stylesheet">--}}
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="@php echo url('dashboard'); @endphp" class="site_title"><i class="fa fa-gear"></i> <span>OFCAR</span></a>
                </div>
                <div class="clearfix"></div>
                <br/>

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <h3>Menu</h3>
                        <ul class="nav side-menu">
                            <li><a><i class="fa fa-home"></i> Home <span class="fa"></span></a>
                            </li>
                            <li><a><i class="fa fa-edit"></i> Cadastros <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="#">Produtos</a></li>
                                    <li><a href="<?php echo url('user');  ?>">Usuários</a></li>
                                    <li><a href="<?php echo url('profile');  ?>">Perfis de Usuário</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-file-text-o"></i> Relatórios <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="general_elements.html">Estoque</a></li>
                                    <li><a href="media_gallery.html">Vendas</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /sidebar menu -->
                <!-- /menu footer buttons -->
            </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <div class="nav toggle">
                    <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                </div>
                <nav class="nav navbar-nav">
                    <ul class=" navbar-right">
                        <li class="nav-item dropdown open" style="padding-left: 15px;">
                            <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true"
                               id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                                User
                            </a>
                            <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="login.html"><i class="fa fa-sign-out pull-right"></i> Log
                                    Out</a>
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
            @yield('content')
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
            <div class="pull-right">
                Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
</div>


<!-- Bootstrap -->
<script src="@php echo url("public/vendors/bootstrap/dist/js/bootstrap.bundle.min.js") @endphp"></script>
<!-- FastClick -->
<script src="@php echo url("public/vendors/fastclick/lib/fastclick.js") @endphp"></script>
<!-- NProgress -->
<script src="@php echo url("public/vendors/nprogress/nprogress.js") @endphp"></script>
<!-- Chart.js -->
<script src="@php echo url("public/vendors/Chart.js/dist/Chart.min.js") @endphp"></script>
<!-- gauge.js -->
<script src="@php echo url("public/vendors/gauge.js/dist/gauge.min.js") @endphp"></script>
<!-- bootstrap-progressbar -->
<script src="@php echo url("public/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js") @endphp"></script>
<!-- iCheck -->
<script src="@php echo url("public/vendors/iCheck/icheck.min.js") @endphp"></script>
<!-- Skycons -->
<script src="@php echo url("public/vendors/skycons/skycons.js") @endphp"></script>
<!-- Flot -->
<script src="@php echo url("public/vendors/Flot/jquery.flot.js") @endphp"></script>
<script src="@php echo url("public/vendors/Flot/jquery.flot.pie.js") @endphp"></script>
<script src="@php echo url("public/vendors/Flot/jquery.flot.time.js") @endphp"></script>
<script src="@php echo url("public/vendors/Flot/jquery.flot.time.js") @endphp"></script>
<script src="@php echo url("public/vendors/Flot/jquery.flot.stack.js") @endphp"></script>
<script src="@php echo url("public/vendors/Flot/jquery.flot.resize.js") @endphp"></script>
<!-- Flot plugins -->
<script src="@php echo url("public/vendors/flot.orderbars/js/jquery.flot.orderBars.js") @endphp"></script>
<script src="@php echo url("public/vendors/flot-spline/js/jquery.flot.spline.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/flot.curvedlines/curvedLines.js") @endphp"></script>
<!-- DateJS -->
<script src="@php echo url("public/vendors/DateJS/build/date.js") @endphp"></script>
<!-- JQVMap -->
<script src="@php echo url("public/vendors/jqvmap/dist/jquery.vmap.js") @endphp"></script>
<script src="@php echo url("public/vendors/jqvmap/dist/maps/jquery.vmap.world.js") @endphp"></script>
<script src="@php echo url("public/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js") @endphp"></script>
<!-- bootstrap-daterangepicker -->
<script src="@php echo url("public/vendors/moment/min/moment.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/bootstrap-daterangepicker/daterangepicker.js") @endphp"></script>
<!-- Custom Theme Scripts -->
<script src="@php echo url("public/build/js/custom.min.js") @endphp"></script>
<!-- Datatables -->
<script src="@php echo url("public/vendors/datatables.net/js/jquery.dataTables.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/datatables.net-buttons/js/dataTables.buttons.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/datatables.net-buttons/js/buttons.flash.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/datatables.net-buttons/js/buttons.html5.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/datatables.net-buttons/js/buttons.print.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/datatables.net-responsive/js/dataTables.responsive.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js") @endphp"></script>
<script src="@php echo url("public/vendors/datatables.net-scroller/js/dataTables.scroller.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/jszip/dist/jszip.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/pdfmake/build/pdfmake.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/pdfmake/build/vfs_fonts.js") @endphp"></script>
<script src="@php echo url("public/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/jquery.hotkeys/jquery.hotkeys.js") @endphp"></script>
<script src="@php echo url("public/vendors/google-code-prettify/src/prettify.js") @endphp"></script>
<script src="@php echo url("public/vendors/jquery.tagsinput/src/jquery.tagsinput.js") @endphp"></script>
<script src="@php echo url("public/vendors/switchery/dist/switchery.min.js") @endphp"></script>
<script src="@php echo url("public/vendors/starrr/dist/starrr.js") @endphp"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

@php
    if(isset($_SESSION['message'])) {
        echo "
          <script>
            Swal.fire({
              title: '" . $_SESSION['message'] . "',
              icon: '" . $_SESSION['message_type'] . "',
              confirmButtonText: 'OK'
            })
          </script>
          ";
      unset($_SESSION['message']);
      unset($_SESSION['message_type']);
    }
@endphp

</body>
</html>
