<%@ Page Title="" Language="VB" MasterPageFile="~/zADM_BORZAL_Master.master" AutoEventWireup="false" CodeFile="Sastavnica_Pretraga.aspx.vb" Inherits="Sastavnica_Pretraga" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="cPOLista" ContentPlaceHolderID="cphPOLista" Runat="Server">
    <%--<li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <i class="icon-file-text2 position-left"></i>Упутства<span class="caret"></span>
        </a>
        <ul class="dropdown-menu dropdown-menu-right">
            <li><a href="Content/doc/Uputstva/MetodoloskoUputstvo.pdf" target="_blank"><i class="icon text-size-18 icon-file-pdf position-left"></i>Методолошко упутство</a></li>
            <li><a href="Content/doc/Uputstva/KorisnickoUputstvo.pdf" target="_blank"><i class="icon text-size-18 icon-file-pdf position-left"></i>Упутство за коришћење апликације</a></li>
            <li><a href="Content/doc/Uputstva/OdgovoriNaNPP.pdf" target="_blank"><i class="icon text-size-18 icon-file-pdf position-left"></i>Одговори на најчешће постављена питања</a></li>
        </ul>
    </li>--%>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" Runat="Server">
    <div id="loader-wrapper">
        <div id="loader"></div>
        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
    </div>
    <asp:ScriptManager ID="smIzborMB" runat="server"></asp:ScriptManager>
    <!-- CONTENT -->
    <div class="Home content">
         <asp:UpdatePanel ID="upFilterTabela" runat="server">
            <ContentTemplate>
                <h6 class="m-10 content-group text-semibold"><i class="icon-box position-left text-primary-800"></i><span id="MBListaTitle" runat="server"></span></h6>
                <div id="filterTable" class="row no-border">
                    <div class="col-md-12">
                        <div class="row">
                            <div id="divBROJ" class="col-md-4 form-group"><asp:DropDownList ID="DDLBROJ" runat="server" CssClass="col-md-4 opstine godine" AutoPostBack="true"></asp:DropDownList></div>
                             <div class="col-md-1">
                                 <div class="input-group">
                                <button type="button" id="Reset" runat="server" onserverclick="ResetClick" data-loading-text="PONIŠTI IZBOR <i class='icon-sync spinner text-white position-right'></i>" class="btn btn-info btn-xs btn-loading text-size-mini">PONIŠTI IZBOR <i class="icon-sync position-right"></i></button>
                            </div>
                                  </div>
                        </div>
                      </div>
                   </div>
                <div class="row">
                    <div class="col-md-12">
                        <h6 class="font-family-Roboto text-semibold validation-error-label" id="MBListaError" runat="server"></h6>
                        <div class="panel no-border">
                            <div class="table-responsive">                        
                                <asp:GridView ID="gvMB" runat="server" CssClass="table table-bordered table-xxs"
                                            AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True"
                                            DataSourceID="odsMB"
                                            PagerStyle-CssClass="pagination-nm"
                                            DataKeyNames="BROJ, RBR" BorderWidth="0px" HeaderStyle-CssClass="alpha-grey img-bg" PagerSettings-Mode="NumericFirstLast" PagerStyle-Wrap="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="BROJ" HeaderStyle-Width="50" SortExpression="BROJ">
                                             <ItemTemplate>
                                                <asp:LinkButton ID="btnMBIzmena" runat="server" CommandName="MBIzmena" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' Text='<%# Bind("BROJ") %>' CausesValidation="False"></asp:LinkButton>
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="RBR" HeaderText="RBR" SortExpression="RBR" />
                                         <asp:BoundField DataField="Naziv proizvoda" HeaderText="NAZIV PROIZVODA" SortExpression="Naziv proizvoda" />
                                        <asp:BoundField DataField="Naziv sirovine" HeaderText="NAZIV SIROVINE" SortExpression="Naziv sirovine" />
                                         <asp:BoundField DataField="JM" HeaderText="JM" SortExpression="JM" />
                                          <asp:BoundField DataField="KOLICINA" HeaderText="KOLICINA" SortExpression="KOLICINA" />
                                         <asp:TemplateField HeaderText="EXCEL" HeaderStyle-Width="30" SortExpression="MB">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnExcelExport" runat="server" CommandName="ExcelExport" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CausesValidation="False"><i class="icon-file-excel text-slate"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="divExcel" class="row">
                    <div class="col-md-12">
                        <div class="panel no-border"><div class="SPRLJ table-responsive">                        
                                <asp:GridView ID="gvExcel" runat="server" CssClass="table table-bordered table-xxs"
                                            AllowSorting="False" AutoGenerateColumns="False" AllowPaging="False"
                                            DataKeyNames="BROJ, RBR" BorderWidth="0px" HeaderStyle-CssClass="alpha-grey img-bg">
                                    <AlternatingRowStyle CssClass="bg-slate-50 img-bg" />
                                    <Columns>
                                        <asp:BoundField DataField="ID_PROIZVOD" HeaderText="ID_PROIZVOD" />
                                        <asp:BoundField DataField="BROJ" HeaderText="BROJ" />
                                        <asp:BoundField DataField="RBR" HeaderText="RBR" />
                                        <asp:BoundField DataField="ID_SIROVINA" HeaderText="ID_SIROVINA" />
                                        <asp:BoundField DataField="JM" HeaderText="JM" />
                                        <asp:BoundField DataField="KOLICINA" HeaderText="KOLICINA" />
                                     </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <!-- /CONTENT -->

    <asp:ObjectDataSource ID="odsMB" runat="server" SelectMethod="DajDS_IzUpita_lokal" TypeName="ADM_MM">
        <SelectParameters>
            <asp:SessionParameter Name="Upit" DefaultValue="SELECT * FROM vSastavnica order by broj, rbr" SessionField="UpitMB" Type="String" />
            <asp:Parameter Name="konekcija" Type="String" DefaultValue="<%$ ConnectionStrings:BORZALConnectionString %>" />
        </SelectParameters>
    </asp:ObjectDataSource>

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
                minimumInputLength: 3,
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
            $('.godine').select2({
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


        history.pushState(null, null, 'Sastavnica_Pretraga.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Sastavnica_Pretraga.aspx');
        });
    </script>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(pageFunctions);
     </script>
</asp:Content>

