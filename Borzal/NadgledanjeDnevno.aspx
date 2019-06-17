<%@ Page Title="" Language="VB" MasterPageFile="~/zADM_BORZAL_Master.master" AutoEventWireup="false" CodeFile="NadgledanjeDnevno.aspx.vb" Inherits="NadgledanjeDnevno" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" Runat="Server">
    <link href="Content/js/highcharts/highcharts.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="cPOLista" ContentPlaceHolderID="cphPOLista" Runat="Server">
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" Runat="Server">
    <div class="content">
        <h6 class="m-10 content-group text-semibold"><i class="icon-stats-bars position-left text-purple-300"></i>Укупан број попуњених извештаја: <span class="text-slate" id="BrojIzvestaja" runat="server"></span></h6>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-body">
                    <div id="GraphBrojIzvestajaPoDanima"></div>
                </div>
            </div>
        </div>
    </div>
    <asp:TextBox ID="txtID_Korisnika" runat="server" CssClass="hidden"></asp:TextBox>
    <asp:TextBox ID="txtJSON_BrojIzvestajaPoDanima" runat="server" ClientIDMode="Static" CssClass="hidden"></asp:TextBox>

    <script type="text/javascript" src="Content/js/highcharts/highcharts.js"></script>
    <script type="text/javascript" src="Content/js/highcharts/heatmap.js"></script>
    <script type="text/javascript" src="Content/js/highcharts/data.js"></script>
    <script type="text/javascript" src="Content/js/highcharts/exporting.js"></script>
    <script type="text/javascript" src="Content/js/highcharts/export-data.js"></script>
    <script type="text/javascript" src="Content/js/highcharts/grid-light.js"></script>
    <script type="text/javascript" src="Content/js/highcharts/Graph.js"></script>
</asp:Content>


