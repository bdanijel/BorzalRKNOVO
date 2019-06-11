<%@ Page Title="" Language="VB" MasterPageFile="~/zADM_BORZAL_Master.master" AutoEventWireup="false" CodeFile="rRazlika.aspx.vb" Inherits="rRazlika" %>

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
            <div class="col-md-3 text-left">
                <div class="input-group">
                    <asp:TextBox ID="txtDATUMPRIJEMAOD" runat="server" CssClass="form-control no-shadow pickadate" placeholder="Датум од..." AutoPostBack="True"></asp:TextBox>
                    <%--<span class="input-group-addon"><i class="icon-calendar3"></i></span>--%>
                    <span class="input-group-btn">
                        <button id="OpenCalendarDATUMPRIJEMAOD" class="btn btn-default pt-5 pb-5" type="button"><i class="icon-calendar3"></i></button>
                    </span>
                </div>
            </div>
            <div class="col-md-3 text-left">
                <div id="divDatumPrijemaDO" class="input-group" visible="false">
                    <asp:TextBox ID="txtDATUMPRIJEMADO" runat="server" CssClass="form-control no-shadow pickadate" placeholder="Датум до..." AutoPostBack="True" Visible="false"></asp:TextBox>
                    <%--<span class="input-group-addon"><i class="icon-calendar3"></i></span>--%>
                    <span class="input-group-btn">
                        <button id="OpenCalendarDATUMPRIJEMADO" class="btn btn-default pt-5 pb-5" type="button"><i class="icon-calendar3"></i></button>
                    </span>
                </div>
            </div>
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
            <asp:ObjectDataSource ID="dsRazlika" runat="server" SelectMethod="DajDS_IzUpita_lokal" TypeName="ADM_MM">
                <SelectParameters>
                    <asp:SessionParameter Name="Upit" DefaultValue="with TrebovanjeSumarDATUM as (SELECT dbo.sirovine.ID, dbo.sirovine.NAZIV, SUM(dbo.trebovanje.KOLICINA) AS TrebovanoUkupno, dbo.sirovine.JM, dbo.trebovanje.DATUM FROM  dbo.sirovine INNER JOIN dbo.trebovanje ON dbo.sirovine.ID = dbo.trebovanje.ID_SIROVINE GROUP BY dbo.sirovine.ID, dbo.sirovine.NAZIV, dbo.sirovine.JM, dbo.trebovanje.DATUM having trebovanje.DATUM >= '01.01.2019' and trebovanje.DATUM <= '01.01.2020'), TrebovanjeSumar as (select id,naziv,  JM, sum(TrebovanoUkupno) as TrebovanjeUkupnoSUMAR FROM TrebovanjeSumarDATUM group by id,naziv,jm), UtrosenoSumarDATUM as (SELECT ID, NAZIV, JM, SUM(Utroseno) AS UtrosenoUkupno, DATUM FROM dbo.vUtrosenoDATUM GROUP BY ID, NAZIV, JM, DATUM HAVING DATUM >= '01.01.2019' and DATUM <= '01.01.2020'), UtrosenoSumar as (select ID,naziv,jm,SUM(UtrosenoUkupno) as UtrosenoUkupnoSUMAR FROM UtrosenoSumarDATUM group by ID, NAZIV,jm) select TrebovanjeSumar.id, TrebovanjeSumar.naziv, TrebovanjeSumar.jm, TrebovanjeUkupnoSUMAR,UtrosenoUkupnoSUMAR, (TrebovanjeUkupnoSUMAR - UtrosenoUkupnoSUMAR) as Razlika FROM TrebovanjeSumar join UtrosenoSumar on TrebovanjeSumar.ID=UtrosenoSumar.ID"  SessionField="UpitRazlika" Type="String" />
                    <asp:Parameter Name="konekcija" Type="String" DefaultValue="<%$ ConnectionStrings:BORZALConnectionString %>" />
                </SelectParameters>
            </asp:ObjectDataSource>
               <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="100%" AsyncRendering="False" SizeToReportContent="True"  ClientIDMode="AutoID">
                <LocalReport ReportPath="Izvestaji\rRazlika.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="dsRazlika" Name="DataSet1" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
                 </div>
         </div>
        </div>
        <asp:TextBox ID="txtID_Korisnika" runat="server" CssClass="hidden"></asp:TextBox>
        <asp:TextBox ID="txtGodina" runat="server" CssClass="hidden"></asp:TextBox>

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


        history.pushState(null, null, 'rRazlika.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'rRazlika.aspx');
        });
    </script>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(pageFunctions);
     </script>

</asp:Content>


