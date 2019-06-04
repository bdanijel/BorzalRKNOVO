﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LogIn.aspx.vb" Inherits="LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge, Chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>СПР - Логовање</title>
    
    <!-- core CSS files -->
    <link href="Content/font/icomoon/styles.css" rel="stylesheet" />
    <link href="Content/font/NataM/NataM.css" rel="stylesheet" />
    <link href="Content/font/Roboto/Roboto.css" rel="stylesheet" />
    <link href="Content/css/bootstrap.css" rel="stylesheet" />
    <link href="Content/css/GeneralStyle.css" rel="stylesheet" />
    <link href="Content/css/GeneralElements.css" rel="stylesheet" />
    <link href="Content/css/Colors.css" rel="stylesheet" />
    <!-- /core CSS files -->
     <!-- core JS files -->
    <script src="Content/js/jquery/jquery-2.1.4.js"></script>
    
    <script src="Content/js/bootstrap/bootstrap.min.js"></script>
    <script src="Content/js/jquery/jquery.validate.min.js"></script>
    <script src="Content/js/jquery/jquery-ui-1.12.1.min.js"></script>
    <script src="Content/js/jquery/jquery.ui.touch-punch.js"></script>
    <!-- /core JS files -->


    <link href="Content/images/favicon/favicon_slate.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body class="login-container">
    
    <!-- Main navbar -->
    <div class="navbar navbar-inverse bg-primary-700">
        <div class="navbar-header">
            <span class="navbar-brand bg-hover pt-5 pb-5 no-padding-left"><span class="text-semibold"><img src="Content/images/logo/SPR_Logo_FIN_White.svg" width="70" height="40" alt="SPR Logo" /> ПИСАРНИЦА РЗС</span></span>
            <ul class="nav navbar-nav pull-right visible-xs-block">
                <li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
            </ul>
        </div>
        <div class="navbar-collapse collapse" id="navbar-mobile">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="SPRLJ_Home.aspx"><span class="text-semibold"><i class="icon-home2 position-left"></i>Почетна</span></a></li>
                <li><a href="Content/doc/Uputstva/UputstvoZaLogovanje.pdf" target="_blank"><i class="icon text-size-18 icon-file-pdf position-left"></i>Упутство за логовање</a></li>
                <li>
					<a href="mailTo:sprlj@stat.gov.rs">
						<i class="icon-envelope"></i>
						<span class="visible-xs-inline-block position-right">Контактирај администратора</span>
					</a>						
				</li>
            </ul>
        </div>
    </div>
    <!-- /main navbar -->


    <!-- Page container -->
    <div class="page-container">

        <!-- Page content -->
        <div class="page-content">

            <!-- Main content -->
            <div class="content-wrapper">

                <!-- Content area -->
                <div class="content">
                    <!-- LogIn form -->
                    <form id="LoginForm" runat="server">
                        <div class="panel panel-body login-form">
                            <div class="text-center">
                                <div class="icon-object border-slate-300 text-slate-300"><i class="icon-reading"></i></div>
                                <h5 id="Logovanje" runat="server" class="content-group">Логовање <small class="display-block">У поља испод унесите Ваше податке</small></h5>
                            </div>

                            <div class="form-group has-feedback has-feedback-left">
                                <input type="text" id="Nalog" runat="server" class="form-control" placeholder="Кориснички налог" name="Nalog" />
                                <div class="form-control-feedback">
                                    <i class="icon-user text-muted"></i>
                                </div>
                            </div>
                            <div class="form-group has-feedback has-feedback-left">
                                <input type="password" id="Lozinka" runat="server" class="form-control" placeholder="Лозинка" name="Lozinka" />
                                <div class="form-control-feedback">
                                    <i class="icon-lock2 text-muted"></i>
                                </div>
                            </div>
                            <div id="LogPoruke" runat="server" class="text-left pt-0 pb-10">
                                <span id="PorukaUspesno" runat="server" class="validation-success-label"></span>
                                <span id="PorukaNeuspesno" runat="server" class="validation-error-label"></span>
                            </div>
                            <div class="form-group">
                                <button id="LoginButton" runat="server" onserverclick="LoginButton_Click" class="btn btn-xs bg-primary-800 btn-block">ЛОГУЈТЕ СЕ <i class="icon-circle-right2 position-right"></i></button>
<%--                                <asp:LinkButton ID="LoginButton" runat="server" OnClick="LoginButton_Click"  CssClass="btn btn-xs btn-primary bg-primary-800 btn-block">ЛОГУЈТЕ СЕ<i class="icon-circle-right2 position-right"></i></asp:LinkButton>--%>
                            </div>
                            <div class="content-divider text-muted form-group"><span>Немате налог?</span></div>
                            <div class="form-group">
                                <asp:LinkButton ID="IdiNaRegistracijuButton" runat="server" OnClick="IdiNaRegistracijuButton_Click" CssClass="btn btn-xs btn-default btn-block">КРЕИРАЊЕ НАЛОГА<i class="icon-plus3 position-right"></i></asp:LinkButton>
                            </div>
                        </div>
                    </form>
                    <!-- /LogIn form --> 
                    <div class="content">
                        <div class="row">
                            <div class="col-md-4 col-md-push-4">
                                <!-- Info alert -->
                                <div class="alert alert-info alert-styled-left alert-arrow-left alert-component border-primary-800 text-primary-800">
                                    <h6 class="alert-heading">Ако имате проблема при логовању обратите се администратору кликом на <i class="icon-envelope"></i> у горњем десном углу екрана.</h6>
                                </div>
                                <!-- /info alert -->
                            </div>
                        </div>
                        <!-- footer -->
                        <div class="footer text-slate text-center">
                            <div class="logoRZS">
                                <a href="http://www.stat.gov.rs/" target="_blank">
                                    <span class="text-size-24 nmicon-RZSLogo position-left">
                                        <span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span><span class="path5"></span><span class="path6"></span><span class="path7"></span><span class="path8"></span><span class="path9"></span><span class="path10"></span><span class="path11"></span><span class="path12"></span></span>
                                </a>
                            </div>
                            <div class="copyright">Републички завод за статистику &copy; <%: DateTime.Now.Year %>  - Статистички пословни регистар</div>
                        </div>
                        <!-- /footer -->
                    </div>
                </div>
                <!-- /content area -->
            </div>
            <!-- /main content -->
        </div>
        <!-- /page content -->
    </div>
    <!-- /page container -->
    <!-- JS files -->
    <%--<script src="Content/js/core/general.js"></script>--%>
    <!-- /JS files -->
     <script type="text/javascript">
         //$(document).keypress(function (e) {
         //    if (e.which == 13 && e.target.tagName != 'textarea') {
         //        var txt = $(e.target);
         //        var allOther = $("input[type=text]:not(:disabled, [readonly='readonly'])");
         //        var index = jQuery.inArray(txt[0], allOther);
         //        var next = $(allOther[index + 1]);
         //        if (next) next.focus();
         //        //debugger;
         //        //Need to set focus to next active text field here.
         //        return false;
         //    }
         //});

        history.pushState(null, null, 'LogIn.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'LogIn.aspx');
        });
    </script>
</body>
</html>
