<%@ Page Title="" Language="VB" MasterPageFile="~/zADM_BORZAL_Master.master" AutoEventWireup="false" CodeFile="GrafikonPREDATNICA_MESEC.aspx.vb" Inherits="GrafikonPREDATNICA_MESEC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPOLista" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart", "table"], });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                title: 'BORZAL - proizvodi'
            };
            $.ajax({
                type: "POST",
                url: "GrafikonPREDATNICA_MESEC.aspx/GetChartData",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.ColumnChart($("#chart_div")[0]);
                    var tabledata = new google.visualization.Table(document.getElementById('table_div'));
                    //google.visualization.events.addListener(chart, 'ready', function () {
                    //    chart_div.innerHTML = '<img src="' + chart.getImageURI() + '">';
                    //    console.log(chart_div.innerHTML);
                    //});
                    chart.draw(data, options);
                    tabledata.draw(data, options);
                    //tabledata.draw(data, {showRowNumber: true, width: '100%', height: '100%'});

                },
                failure: function (r) {
                    alert(r.d);
                },
                error: function (r) {
                    alert(r.d);
                }
            });
        }
    </script>
    <h6 class="m-10 content-group text-semibold"><i class="glyphicon glyphicon-stats position-left text-primary-800"></i>PREDATO PROIZVODA IZ PREDATNICE PO MESECIMA - GRAFIKON</b> </h6>
    <div id="chart_div" style="width: 900px; height: 500px; margin-bottom: 40px">
    </div>
    <h6 class="m-10 content-group text-semibold"><i class="icon-file-spreadsheet position-left text-primary-800"></i>PREDATO PROIZVODA IZ PREDATNICE PO MESECIMA - TABELA</b> </h6>
    <div id="table_div" style="width: 900px; height: 500px;">
    </div>
</asp:Content>
