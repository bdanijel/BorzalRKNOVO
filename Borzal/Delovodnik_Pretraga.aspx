<%@ Page Title="" Language="VB" MasterPageFile="~/zADM_PISARNICA_Master.master" AutoEventWireup="false" CodeFile="Delovodnik_Pretraga.aspx.vb" Inherits="Delovodnik_Pretraga" %>

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
                <asp:label ID="lblPoruka1" runat="server"></asp:label>
                <asp:label ID="lblPoruka2" runat="server"></asp:label>
                <asp:label ID="lblPoruka3" runat="server"></asp:label>
                <h6 class="m-10 content-group text-semibold"><i class="icon-office position-left text-primary-800"></i><span id="MBListaTitle" runat="server"></span></h6>
                <div id="filterTable" class="row no-border">
                    <div class="col-md-12">
                        <div class="row">
                            <div id="divGODINA" class="col-md-5 form-group"><asp:DropDownList ID="DDLGODINA" runat="server" CssClass="col-md-5 godine" AutoPostBack="true"></asp:DropDownList></div>
                            <div id="divKLASIFIKACIJABROJID" class="col-md-4 form-group"><asp:DropDownList ID="DDLKLASIFIKACIONIBROJID" runat="server" CssClass="col-md-4 opstine select-size-xs" AutoPostBack="true"></asp:DropDownList></div>
                        </div>
                       <div class="row">
                           <div id="divTEKST" class="col-md-4 form-group"><asp:DropDownList ID="DDLTEKST" runat="server" CssClass="col-md-4 select-size-xs" AutoPostBack="true"></asp:DropDownList></div>
                            <div id="divPRIMEDBA" class="col-md-4 form-group"><asp:DropDownList ID="DDLPRIMEDBA" runat="server" CssClass="col-md-4 select-size-xs" AutoPostBack="true"></asp:DropDownList></div>
                            <div id="divORGJEDID" class="col-md-4 form-group"><asp:DropDownList ID="DDLORGJEDID" runat="server" CssClass="col-md-4 select-size-xs" AutoPostBack="true"></asp:DropDownList></div>
                            <div id="divNAMENJENO" class="col-md-4 form-group"><asp:DropDownList ID="DDLNAMENJENO" runat="server" CssClass="col-md-4 select-size-xs" AutoPostBack="true"></asp:DropDownList></div>
                       </div>
                        <div class="row">
                            <div class="col-md-2 form-group"><label class="control control--checkbox"><asp:checkbox ID="chkPopisAkata" runat="server" AutoPostBack="true" /><div class="control-indicator primary"><span class="icon"></span></div><span class="text-semibold ml-15">Попис аката?</span></label></div>
                            <div class="col-md-2 form-group"><label class="control control--checkbox"><asp:checkbox ID="chkPreuzeo" runat="server" AutoPostBack="true" /><div class="control-indicator primary"><span class="icon"></span></div><span class="text-semibold ml-15">Преузео?</span></label></div>
                            <div class="col-md-2 form-group"><label class="control control--checkbox"><asp:checkbox ID="chkINDLinkZaDokument" runat="server" AutoPostBack="true" /><div class="control-indicator primary"><span class="icon"></span></div><span class="text-semibold ml-15">Прилог?</span></label></div>
                            <div class="col-md-2 form-group"><label class="control control--checkbox"><asp:checkbox ID="chkRacun" runat="server" AutoPostBack="true" /><div class="control-indicator primary"><span class="icon"></span></div><span class="text-semibold ml-15">Рачун?</span></label></div>
                        </div>
                        <div class="row">
                             <div class="col-md-3 text-left">
                                 <div class="input-group">
                                                    <asp:TextBox ID="txtDATUMPRIJEMAOD" runat="server" CssClass="form-control no-shadow pickadate" placeholder="Датум од..." AutoPostBack="True"></asp:TextBox>
                                                    <%--<span class="input-group-addon"><i class="icon-calendar3"></i></span>--%>
                                                    <span class="input-group-btn"><button id="OpenCalendarDATUMPRIJEMAOD" class="btn btn-default pt-5 pb-5" type="button"><i class="icon-calendar3"></i></button></span>
                                                </div>
                                 </div>
                             <div class="col-md-3 text-left">
                                 <div id="divDatumPrijemaDO" class="input-group" visible="false">
                                                    <asp:TextBox ID="txtDATUMPRIJEMADO" runat="server" CssClass="form-control no-shadow pickadate" placeholder="Датум до..." AutoPostBack="True" Visible="false"></asp:TextBox>
                                                    <%--<span class="input-group-addon"><i class="icon-calendar3"></i></span>--%>
                                                    <span class="input-group-btn"><button id="OpenCalendarDATUMPRIJEMADO" class="btn btn-default pt-5 pb-5" type="button"><i class="icon-calendar3"></i></button></span>
                                                </div>
                                 </div>
                             <div class="col-md-1">
                                 <div class="input-group">
                                <button type="button" id="Reset" runat="server" onserverclick="ResetClick" data-loading-text="ПОНИШТИ ИЗБОР <i class='icon-sync spinner text-white position-right'></i>" class="btn btn-info btn-xs btn-loading text-size-mini">ПОНИШТИ ИЗБОР <i class="icon-sync position-right"></i></button>
                            </div>
                                  </div>
                        </div>
                        <div class="row">
                           
                        </div>
                    </div>
                    <div class="ROW">
                    <div class="col-md-4">
                        <div class="row text-center">
                            <div class="col-md-6">
                                <div class="content-group">
                                    <h5 class="text-semibold no-margin"><i class="icon-minus3 position-left text-purple-300"></i><span class="text-slate text-size-small">НИЈЕ ОЗНАЧЕНО</span></h5>                                    
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="content-group">
                                    <h5 class="text-semibold no-margin"><i class="icon-checkmark3 position-left text-info"></i><span class="text-slate text-size-small">ОЗНАЧЕНО ЈЕ</span></h5>                                    
                                </div>
                            </div>
<%--                            <div class="col-md-4">
                                <div class="content-group">
                                    <h5 class="text-semibold no-margin"><i class="icon-cross2 position-left text-SDG-12"></i><span class="text-slate text-size-small">НЕ ПОПУЊАВА СЕ ЗА ЗАРАДЕ</span></h5>                                    
                                </div>
                            </div>--%>
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
                                            DataKeyNames="Godina,rbr,podbroj,podod3,LinkZaDokument" BorderWidth="0px" HeaderStyle-CssClass="alpha-grey img-bg" PagerSettings-Mode="NumericFirstLast" PagerStyle-Wrap="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Деловодни број" HeaderStyle-Width="120" SortExpression="DelovodniBroj">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnMBIzmena" runat="server" CommandName="MBIzmena" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' Text='<%# Bind("DelovodniBroj") %>' CausesValidation="False"></asp:LinkButton>
                                                <%--<span id="SpanMBIzmena" runat="server" class="text-semibold"><%# Eval("DelovodniBroj")%></span>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:BoundField DataField="godina" HeaderText="Година" SortExpression="godina" />
                                        <asp:BoundField DataField="podod3" HeaderText="Подручно одељење" SortExpression="podod3" />
                                         <asp:BoundField DataField="rbr" HeaderText="Редни број" SortExpression="rbr" />
                                         <asp:BoundField DataField="podbroj" HeaderText="Подброј" SortExpression="podbroj" />
                                        <asp:BoundField DataField="KlasifikacioniBrojID" HeaderText="Класификациони број ИД" SortExpression="KlasifikacioniBrojID" />
                                        <asp:BoundField DataField="KlasifikacioniBroj" HeaderText="Класификација опис" SortExpression="KlasifikacioniBroj" />
                                        <asp:TemplateField HeaderText="Опис у деловоднику" SortExpression="tekst">
                                            <ItemTemplate>
                                                <span class="text-slate text-size-mini"><%# Eval("tekst")%></span><br />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:BoundField DataField="primedba" HeaderText="Примедба" SortExpression="primedba" />
                                         <%--<asp:BoundField DataField="DatumPrijema" HeaderText="Датум пријема" SortExpression="DatumPrijema" />--%>
                                        <asp:TemplateField HeaderText ="Датум пријема" SortExpression="DatumPrijema">
                                             <ItemTemplate>
                                                <asp:Label ID="lblDatumPrijema" runat="server" 
                                                    Text='<%# Eval("DatumPrijema", "{0:dd.MM.yyyy.}") %>' />
                                                </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EXCEL" HeaderStyle-Width="30" SortExpression="MB">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnExcelExport" runat="server" CommandName="ExcelExport" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CausesValidation="False"><i class="icon-file-excel text-slate"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="PopisAkata" HeaderText="Попис аката?" SortExpression="PopisAkata" />
                                        <asp:BoundField DataField="AktivanPopisAkata" HeaderText="Активан попис аката?" SortExpression="AktivanPopisAkata" />
                                        <asp:BoundField DataField="Preuzeo" HeaderText="Преузео?" SortExpression="Preuzeo" />
                                        <asp:BoundField DataField="INDLinkZaDokument" HeaderText="Прилог?" SortExpression="INDLinkZaDokument" />
                                         <asp:hyperlinkfield headertext="Преузми прилог"
                                                            DataTextField="DelovodniBroj"
                                             DataNavigateUrlFields="LinkZaDokument"
                                             DataNavigateUrlFormatString="{0}" 
                                             Target="_new"
                                             SortExpression="LinkZaDokument"/>  
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
                                            DataKeyNames="GODINA, RBR,PODBROJ,PODOD3" BorderWidth="0px" HeaderStyle-CssClass="alpha-grey img-bg">
                                    <AlternatingRowStyle CssClass="bg-slate-50 img-bg" />
                                    <Columns>
                                        <asp:BoundField DataField="GODINA" HeaderText="Година" />
                                        <asp:TemplateField HeaderText="Р.бр./подброј" HeaderStyle-CssClass="active border-bottom-double width-10per">
                                            <ItemTemplate>
                                                <p id="LJ" runat="server">
                                                    <b><%# Eval("RBR")%></b><br />
                                                    <span class="text-slate text-size-mini"><%# Eval("PODBROJ")%></span>
                                                </p>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Деловодни број/Класификација/Одељење" HeaderStyle-CssClass="active border-bottom-double width-5per">
                                            <ItemTemplate>
                                                <p id="adresa" runat="server">
                                                    <b>Деловодни број:</b> <%# Eval("DELOVODNIBROJ")%><br />
                                                    <b>Класификациони број:</b><span class="text-slate text-semibold text-size-mini"><%# Eval("KLASIFIKACIONIBROJID")%></span><br /><b>Класификација:</b><span class="text-slate text-semibold text-size-mini"><%# Eval("KLASIFIKACIONIBROJ")%></span><br /><b>Одељење:</b> <%# Eval("NAZORGJED")%><br />
                                                </p>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText ="Датум пријема" SortExpression="DatumPrijema">
                                             <ItemTemplate>
                                                       <%# Eval("DatumPrijema", "{0:dd.MM.yyyy.}") %>
                                                </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="TEKST" HeaderText="Опис" />
                                        <asp:BoundField DataField="PRIMEDBA" HeaderText="Примедба" />
                                        <asp:TemplateField HeaderText="Пошиљаоц и износ" HeaderStyle-CssClass="active border-bottom-double width-15per" ItemStyle-CssClass="bg-slate-50 img-bg">
                                            <ItemTemplate>
                                                <%# Eval("POSILJAOC")%><br />
                                                <span class="text-slate"><%# Eval("IZNOS")%></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ORGJEDID" HeaderText="Орг. јед." />
                                        <asp:BoundField DataField="ImePrezime" HeaderText="Намењено" />
                                        <asp:TemplateField HeaderText ="Датум развођења" SortExpression="DATUMRAZVODA">
                                             <ItemTemplate>
                                                    <%# Eval("DATUMRAZVODA", "{0:dd.MM.yyyy.}") %>
                                                </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText ="Датум преузео" SortExpression="DATUMPREUZEO">
                                             <ItemTemplate>
                                                    <%# Eval("DATUMPREUZEO", "{0:dd.MM.yyyy.}") %>
                                                </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="SMER" HeaderText="Смер" />
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
    <asp:TextBox ID="txtID_Korisnika" runat="server" CssClass="hidden"></asp:TextBox>
     <asp:TextBox ID="txtGodina" runat="server" CssClass="hidden"></asp:TextBox>
    <asp:TextBox ID="txtMB" runat="server" CssClass="hidden"></asp:TextBox>

    <asp:ObjectDataSource ID="odsMB" runat="server" SelectMethod="DajDS_IzUpita" TypeName="ADM_MM">
        <SelectParameters>
            <asp:SessionParameter Name="Upit" DefaultValue="SELECT * FROM vDELOVODNIK" SessionField="UpitMB" Type="String" />
            <asp:Parameter Name="konekcija" Type="String" DefaultValue="<%$ ConnectionStrings:PISARNICAConnectionString %>" />
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


        history.pushState(null, null, 'Delovodnik_Pretraga.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Delovodnik_Pretraga.aspx');
        });
    </script>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(pageFunctions);
     </script>
</asp:Content>

