<%@ Page Title="" Language="VB" MasterPageFile="~/zADM_BORZAL_Master.master" AutoEventWireup="false" CodeFile="rTrebovanje.aspx.vb" Inherits="rTrebovanje" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPOLista" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" Runat="Server">
    <div class="Home content">
    <div id="Pocetna" class="content pt-20">
        <div class="row">
            <asp:Label ID="lblPoruka1" runat="server"></asp:Label>
            <asp:Label ID="lblPoruka2" runat="server"></asp:Label>
            <asp:Label ID="lblPoruka3" runat="server"></asp:Label>
</div>
        <div class="row">
<%--            <div class="auto-style1">
                <div class="alert alert-info alert-styled-left alert-arrow-left alert-component border-primary-800 text-primary-800">
                    <button type="button" class="close" data-dismiss="alert"><span>&times;</span><span class="sr-only">Close</span></button>
                    <h6 class="alert-heading text-default no-margin-bottom pb-20">Поштовани,</h6>
                    <h6 class="alert-heading text-default no-margin-bottom">Истраживање о локалним јединицама и зарадама пословног субјекта почиње</h6>
                    <h6 class="alert-heading text-default no-margin-bottom">у четвртак, 18.10.2018. у 14 часова.</h6>
                </div>
            </div>--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
             <br />
            <asp:ObjectDataSource ID="dsTrebovanje" runat="server" SelectMethod="DajDS_IzUpita_lokal" TypeName="ADM_MM">
                <SelectParameters>
                    <asp:SessionParameter Name="Upit" DefaultValue="SELECT *,DATALENGTH(BROJ) as broj2 FROM vTREBOVANJE ORDER BY BROJ2,BROJ, RBR"  SessionField="UpitTrebovanje" Type="String" />
                    <asp:Parameter Name="konekcija" Type="String" DefaultValue="<%$ ConnectionStrings:BORZALConnectionString %>" />
                </SelectParameters>
            </asp:ObjectDataSource>
               <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="100%" AsyncRendering="False" SizeToReportContent="True"  ClientIDMode="AutoID">
                <LocalReport ReportPath="Izvestaji\rTrebovanje.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="dsTrebovanje" Name="dsTrebovanje" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
                 </div>
         </div>
        </div>


<script src="Content/js/bootstrap/moment.min.js"></script>
    <script src="Content/js/bootstrap/bootstrap-datepicker.js"></script>
    <script src="Content/js/jquery/picker.js"></script>  
    <script src="Content/js/jquery/picker.date.js"></script>


    <script type="text/javascript">        
        function pageFunctions() {
            setTimeout(function () {
                $('body').addClass('loaded');
            }, 1500);
                $('body').addClass('loaded');
            var inputOd = $("#cphBody_txtDATUMPRIJEMAOD").pickadate({
                monthsFull: ['Јануар', 'Фебруар', 'Март', 'Април', 'Мај', 'Јун', 'Јул', 'Август', 'Септембар', 'Октобар', 'Новембар', 'Децембар'],
                monthsShort: ['Јан', 'Феб', 'Мар', 'Апр', 'Мај', 'Јун', 'Јул', 'Авг', 'Сеп', 'Окт', 'Нов', 'Дец'],
                showMonthsShort: true,
                weekdaysShort: ['Нед', 'Пон', 'Уто', 'Сре', 'Чет', 'Пет', 'Суб'],
                today: 'Данас',
                clear: 'Поништи',
                close: 'Затвори',
                format: 'dd.mm.yyyy.',
                formatSubmit: 'yyyymmdd',
                firstDay: 1,
                labelMonthNext: 'Следећи месец',
                labelMonthPrev: 'Претходни месец',
                selectYears: 100,
                max: true
            });
            var inputDoNeakt = $("#cphBody_txtDATUMPRIJEMADO").pickadate({
                monthsFull: ['Јануар', 'Фебруар', 'Март', 'Април', 'Мај', 'Јун', 'Јул', 'Август', 'Септембар', 'Октобар', 'Новембар', 'Децембар'],
                monthsShort: ['Јан', 'Феб', 'Мар', 'Апр', 'Мај', 'Јун', 'Јул', 'Авг', 'Сеп', 'Окт', 'Нов', 'Дец'],
                showMonthsShort: true,
                weekdaysShort: ['Нед', 'Пон', 'Уто', 'Сре', 'Чет', 'Пет', 'Суб'],
                today: 'Данас',
                clear: 'Поништи',
                close: 'Затвори',
                format: 'dd.mm.yyyy.',
                formatSubmit: 'yyyymmdd',
                firstDay: 1,
                labelMonthNext: 'Следећи месец',
                labelMonthPrev: 'Претходни месец',
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


        history.pushState(null, null, 'rTrebovanje.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'rTrebovanje.aspx');
        });
    </script>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(pageFunctions);
     </script>

</asp:Content>


