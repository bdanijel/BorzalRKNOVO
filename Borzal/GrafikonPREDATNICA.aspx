<%@ Page Title="" Language="VB" MasterPageFile="~/zADM_BORZAL_Master.master" AutoEventWireup="false" CodeFile="GrafikonPREDATNICA.aspx.vb" Inherits="GrafikonPREDATNICA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPOLista" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" runat="Server">
    <script src="Content/js/bootstrap/moment.min.js"></script>
    <script src="Content/js/bootstrap/bootstrap-datepicker.js"></script>
    <script src="Content/js/jquery/picker.js"></script>  
    <script src="Content/js/jquery/picker.date.js"></script>
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
                url: "GrafikonPREDATNICA.aspx/GetChartData",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.BarChart($("#chart_div")[0]);
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
     <div id="Pocetna" class="content pt-20">
    <h6 class="m-10 content-group text-semibold"><i class="glyphicon glyphicon-stats position-left text-primary-800"></i><b>PRVIH PET PROIZVODA IZ PREDATNICE - GRAFIKON</b> </h6>
    <div id="chart_div" class="row" style="width: 900px; height: 500px; margin-bottom: 40px">
    </div>
    <h6 class="m-10 content-group text-semibold"><i class="icon-file-spreadsheet position-left text-primary-800"></i><b>PRVIH PET PROIZVODA IZ PREDATNICE - TABELA</b> </h6>
    <div id="table_div" class="row" style="width: 900px; height: 500px;">
    </div>
         </div>


     <script type="text/javascript">        
        function pageFunctions() {
            setTimeout(function () {
                $('body').addClass('loaded');
            }, 1500);
                $('body').addClass('loaded');
            var inputOd = $("#cphBody_txtDATUMPRIJEMAOD").pickadate({
                monthsFull: ['Januar', 'februar', 'Mart', 'April', 'Maj', 'Jun', 'Jul', 'Avgust', 'Septembar', 'Oktobar', 'Novembar', 'Decembar'],
                monthsShort: ['Jan', 'Feb', 'Mar', 'Apr', 'Maj', 'Jun', 'Jul', 'Avg', 'Sep', 'Okt', 'Nov', 'Dec'],
                showMonthsShort: true,
                weekdaysShort: ['Ned', 'Pon', 'Uto', 'Sre', 'Čet', 'Pet', 'Sub'],
                today: 'Danas',
                clear: 'Poništi',
                close: 'Zatvori',
                format: 'dd.mm.yyyy.',
                formatSubmit: 'yyyymmdd',
                firstDay: 1,
                labelMonthNext: 'Sledeći mesec',
                labelMonthPrev: 'Prethodni mesec',
                selectYears: 100,
                max: true
            });
            var inputDoNeakt = $("#cphBody_txtDATUMPRIJEMADO").pickadate({
                monthsFull: ['Januar', 'februar', 'Mart', 'April', 'Maj', 'Jun', 'Jul', 'Avgust', 'Septembar', 'Oktobar', 'Novembar', 'Decembar'],
                monthsShort: ['Jan', 'Feb', 'Mar', 'Apr', 'Maj', 'Jun', 'Jul', 'Avg', 'Sep', 'Okt', 'Nov', 'Dec'],
                showMonthsShort: true,
                weekdaysShort: ['Ned', 'Pon', 'Uto', 'Sre', 'Čet', 'Pet', 'Sub'],
                today: 'Danas',
                clear: 'Poništi',
                close: 'Zatvori',
                format: 'dd.mm.yyyy.',
                formatSubmit: 'yyyymmdd',
                firstDay: 1,
                labelMonthNext: 'Sledeći mesec',
                labelMonthPrev: 'Prethodni mesec',
                selectYears: 100,
                max: true
            });
            var pickerOd = inputOd.pickadate('picker');
            $('#OpenCalendarDATUMPRIJEMAOD').on('click', function (e) {
                if (pickerOd.get('open')) {
                    pickerOd.close()
                } else {
                    pickerOd.open()
                }
                e.stopPropagation()
            });
            var pickerDo = inputDoNeakt.pickadate('picker');
            $('#OpenCalendarDATUMPRIJEMADO').on('click', function (e) {
                if (pickerDo.get('open')) {
                    pickerDo.close()
                } else {
                    pickerDo.open()
                }
                e.stopPropagation()
            });
            $('.select-search').select2();
            $('.select-size-xs').select2();
            $('.colored').select2({
                containerCssClass: 'bg-inverse bg-greyNM-700'
            });
            $('.select-search').select2();
            $('.select-size-xs').select2({
                language: {
                    inputTooShort: function (args) {
                        return "Унесите најмање 3 карактера за претрагу";
                    },
                    errorLoading: function () {
                        return 'Преузимање података није успело.';
                    },
                    loadingMore: function () {
                        return 'Преузимање података…';
                    },
                    noResults: function () {
                        return 'Нема резултата претраге...';
                    },
                    searching: function () {
                        return 'Претрага…';
                    },
                    language: "sr"
                }
            });
            $('.opstine').select2({
                language: {
                    inputTooShort: function (args) {
                        return "Унесите најмање 3 карактера за претрагу";
                    },
                    errorLoading: function () {
                        return 'Преузимање података није успело.';
                    },
                    loadingMore: function () {
                        return 'Преузимање података…';
                    },
                    noResults: function () {
                        return 'Нема резултата претраге...';
                    },
                    searching: function () {
                        return 'Претрага…';
                    },
                    language: "sr"
                }
            });
            $('.btn-loading').click(function () {
                var btn = $(this);
                btn.button('loading')
                setTimeout(function () {
                    btn.button('Reset')
                }, 3000)
            });
        }
        $(document).ready(pageFunctions);

<%--        function setMB(a) {
            var aid = a.id
            document.getElementById("<%=txtMB.ClientID %>").value = aid;
            SPRLJ_ADM_Form.submit();
        };--%>
        setTimeout(function () {
            $('body').addClass('loaded');
        }, 1500);


        history.pushState(null, null, 'GrafikonPREDATNICA.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'GrafikonPREDATNICA.aspx');
        });
    </script>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(pageFunctions);
     </script>
</asp:Content>
