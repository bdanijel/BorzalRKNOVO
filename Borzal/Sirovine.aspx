<%@ Page Title="" Language="VB" MasterPageFile="~/zADM_BORZAL_Master.master" AutoEventWireup="false" CodeFile="Sirovine.aspx.vb" Inherits="Sirovine" %>

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
                  <!-- ZAGLAVLJE OBRASCA -->
                <div class="row">
                    <div class="col-md-12">
                        <h6 class="m-10 content-group text-semibold"><i class="icon-box position-left text-primary-800"></i>SIROVINE</b> </h6>
                    </div>
                </div>
                <!-- /ZAGLAVLJE OBRASCA -->


                <asp:label ID="lblPoruka1" runat="server"></asp:label>
                <asp:label ID="lblPoruka2" runat="server"></asp:label>
                <asp:label ID="lblPoruka3" runat="server"></asp:label>
                
                    
                    <div class="col-md-12">
                        <div class="panel mb-10">
                            <div class="panel-heading pt-5 pb-5 alpha-GreyPurple img-bg">
                                <h6 class="panel-title text-semibold"><span class="text-size-base">Naziv sirovine</span></h6>
                            </div>
                            <div class="panel-body pt-15 pb-10">
                                <!-- SIROVINA - Naziv -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span14" runat="server">Naziv sirovine:</span></label>
                                            <div class="col-md-8 text-left">
                                                <div class="input-group col-md-8">
                                                    <asp:TextBox ID="txtNaziv" runat="server" CssClass="form-control input-xs" placeholder="Naziv sirovine"></asp:TextBox>
                                            </div>
                                                <span class="validation-error-label" id="ValidTekstPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidTekst" runat="server" class="col-md-1 control-label text-size-base text-semibold no-padding-right"><span id="Span16" runat="server"></span></label>
                                           </div>
                                    </div>
                                </div>
                                <!-- /SIROVINA - Naziv -->
 <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                         <!-- SIROVINA - JM -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span1" runat="server">Jedinica mere:</span></label>
                                            <div class="col-md-8 text-left">
                                                <div class="input-group col-md-8">
                                                    <asp:TextBox ID="txtJM" runat="server" CssClass="form-control input-xs" placeholder="JM"></asp:TextBox>
                                            </div>
                                                <span class="validation-error-label" id="Span2" runat="server"></span>
                                            </div>
                                            <label id="Label1" runat="server" class="col-md-1 control-label text-size-base text-semibold no-padding-right"><span id="Span3" runat="server"></span></label>
                                           </div>
                                    </div>
                                </div>
                                <!-- /SIROVINA - JM -->


                                                          </div>
                            </div>
                        </div>

                          <asp:TextBox ID="txtID" runat="server" CssClass="form-control input-xs" visible="false"></asp:TextBox>

                        <div class="row">
                             <div class="col-md-12">
                                <div class="input-group-btn text-center">
                                    <asp:LinkButton ID="btnPotvrdiSIROVINA" runat="server" OnClick="btnPotvrdiSIROVINA_Click" CssClass="btn btn-info btn-xs bg-info-700" style="left: 0px; top: 6px; margin-bottom:40px">POTVRDI <i class="icon-checkmark3 position-right"></i></asp:LinkButton><br />
                                     </div>
                            </div>
                   </div>


                    <div id="rowPorukaNeuspesno" runat="server" class="row" visible="False">
                        <div class="col-md-6 col-md-push-3">
                            <div class="alert alert-info alert-styled-left alert-arrow-left alert-component border-danger-800 text-danger-800">
                                <button type="button" class="close" data-dismiss="alert"><span>&times;</span><span class="sr-only">Close</span></button>
                                <h6 id="PorukaInfoNeuspesno" runat="server" class="alert-heading text-semibold no-margin-bottom"></h6>
                            </div>
                        </div>
                    </div>


                    <div id="rowPorukaUspesno" class="row" runat="server" visible="False">
                        <div class="col-md-6 col-md-push-3">
                            <div class="alert alert-info alert-styled-left alert-arrow-left alert-component border-green-700 text-green-700">
                                <button type="button" class="close" data-dismiss="alert"><span>&times;</span><span class="sr-only">Close</span></button>
                                <h6 id="PorukaInfoUspesno" runat="server" class="alert-heading text-semibold no-margin-bottom"></h6>
                            </div>
                        </div>
                    </div>

 <%-- spisak gresaka --%>
                <div id="PorukaGR" runat="server" class="row" visible="false">
                    <div class="col-md-12">
                        <div class="alert alert-info alert-styled-left alert-arrow-left alert-component border-danger-800 text-danger-800 no-margin-bottom">
                            <h6 id="lblPorukaGR" runat="server" ></h6>                            
                        </div>
                    </div>
                </div>
                   
                </div>
                <h6 class="m-10 content-group text-semibold"><i class="icon-fas fa-dolly-flatbed position-left text-primary-800"></i><span id="MBListaTitle" runat="server"></span></h6>
                <div id="filterTable" class="row no-border">
                    
                <div class="row">
                    <div class="col-md-12">
                        <h6 class="font-family-Roboto text-semibold validation-error-label" id="MBListaError" runat="server"></h6>
                        <div class="panel no-border">
                            <div class="table-responsive">                        
                                <asp:GridView ID="gvSIROVINA" runat="server" CssClass="table table-bordered table-xxs"
                                            AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True"
                                            DataSourceID="odsSIROVINA"
                                            PagerStyle-CssClass="pagination-nm"
                                            DataKeyNames="ID, NAZIV, JM" BorderWidth="0px" HeaderStyle-CssClass="alpha-grey img-bg" PagerSettings-Mode="NumericFirstLast" PagerStyle-Wrap="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID" HeaderStyle-Width="120" SortExpression="ID">
                                            <ItemTemplate>
                                        <asp:LinkButton ID="btnSIROVINAIzmena" runat="server" CommandName="SIROVINAIzmena" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' Text='<%# Bind("ID") %>' CausesValidation="False"></asp:LinkButton>
                                                 </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="NAZIV" HeaderText="NAZIV SIROVINE" SortExpression="NAZIV" />
                                         <asp:BoundField DataField="JM" HeaderText="JEDINICA MERE" SortExpression="JM" />
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
                                            DataKeyNames="ID" BorderWidth="0px" HeaderStyle-CssClass="alpha-grey img-bg">
                                    <AlternatingRowStyle CssClass="bg-slate-50 img-bg" />
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" />
                                        <asp:BoundField DataField="NAZIV" HeaderText="NAZIV" />
                                        <asp:BoundField DataField="JM" HeaderText="JM" />
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

    <asp:ObjectDataSource ID="odsSIROVINA" runat="server" SelectMethod="DajDS_IzUpita_lokal" TypeName="ADM_MM">
        <SelectParameters>
            <asp:SessionParameter Name="Upit" DefaultValue="SELECT * FROM SIROVINA" SessionField="UpitSIROVINA" Type="String" />
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


        history.pushState(null, null, 'Sirovine.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Sirovine.aspx');
        });
    </script>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(pageFunctions);
     </script>
</asp:Content>

