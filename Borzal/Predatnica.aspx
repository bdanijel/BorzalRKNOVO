<%@ Page Title="" Language="VB" MasterPageFile="~/zADM_BORZAL_Master.master" AutoEventWireup="false" CodeFile="Predatnica.aspx.vb" Inherits="Predatnica" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="cPOLista" ContentPlaceHolderID="cphPOLista" runat="Server">
    <%--<li ><a class="text-semibold" href="javascript:window.print()"><span id="PDF" runat="server" class="NonPrintable"><i class="icon-file-pdf position-left text-size-16"></i>Штампај</span></a></li>--%>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="Server">
    <asp:ScriptManager ID="smZarade" runat="server"></asp:ScriptManager>
    <div class="content SPRLJ mt--20">
        <div id="rowUvod" class="row mt--20">
            <div class="col-md-12">
                <div id="POLista" class="panel panel-collapse collapse">
                    <div class="table-responsive form-group form-group-xs no-margin-bottom">
                        <table class="table table-bordered table-xxs no-border-top">
                            <thead>
                                <tr>
                                    <th>Име и презиме</th>
                                    <th>eMail</th>
                                    <th>Телефон</th>
                                </tr>
                            </thead>
                            <tbody id="tListaAdmin" runat="server"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <asp:UpdatePanel ID="upPREDATNICAID" runat="server">
            <ContentTemplate>

 <%-- BRISATI SAMO ZA PRIKAZ GREŠAKA U SQL!!!--%>
               
<%-- /BRISATI SAMO ZA PRIKAZ GREŠAKA U SQL!!!--%>

                 <!-- ZAGLAVLJE OBRASCA -->
                 <div class="row">
                    <div class="col-md-12">
                        <h6 class="m-10 content-group text-semibold"><i class="icon-folder-open position-left text-primary-800"></i>UNOS PREDATNICE</b> </h6>
                    </div>
                </div>
                 <!-- /ZAGLAVLJE OBRASCA -->

                <!-- OSNOVNI PODACI -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel mb-10">
                            <div class="panel-heading pt-5 pb-5 alpha-GreyPurple img-bg">
                                <h6 class="panel-title text-semibold"><span class="text-size-base">Osnovni podaci</span></h6>
                            </div>
                            <div class="panel-body pt-15 pb-10">
                                <!-- BROJ -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span2" runat="server">Broj:</span></label>
                                            <div class="col-md-3 text-left">
                                                <div class="input-group col-md-3">
                                                    <asp:TextBox ID="txtBroj" runat="server" CssClass="form-control input-xs" onkeypress="return Broj(event, false);" placeholder="Broj" AutoPostBack="True"></asp:TextBox>
                                                </div>
                                                <span class="validation-valid-label" id="ValidBrojPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidBroj" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span4" runat="server"></span></label>
                                            <div>
                                                <asp:LinkButton ID="btnNoviBroj" runat="server" OnClick="NoviBroj_Click" CssClass="btn btn-primary btn-xs bg-primary-700" Style="left: 0px; top: 0px">NOVI BROJ<i class="glyphicon glyphicon-paperclip position-right"></i></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /BROJ-->
                                <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                <!-- RBR-->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span3" runat="server">Redni broj:</span></label>
                                            <div class="col-md-1 text-left">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtRBR" runat="server" CssClass="form-control input-xs" onkeypress="return Broj(event, false);" placeholder="R.br." AutoPostBack="true" Enabled="false"></asp:TextBox>
                                                </div>
                                                <span class="validation-valid-label" id="ValidRBRPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidRBR" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span6" runat="server"></span></label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /RBR-->
                                <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                <!-- ID_PROIZVOD-->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span5" runat="server">Proizvod:</span></label>
                                            <%--<div class="col-md-10 text-left">--%>
                                            <%-- <div class="input-group">--%>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="ddlProizvodID" runat="server" CssClass="col-md-4 select-size-xs" AutoPostBack="true"></asp:DropDownList>
                                            </div>
                                            <%-- </div>--%>
                                            <span class="validation-error-label" id="ValidProizvodPoruka" runat="server"></span>
                                            <%--   </div>--%>
                                            <label id="ValidProizvod" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span8" runat="server"></span></label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /ID_PROIZVOD -->
                                <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                <!-- JM -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span7" runat="server">Jedinica mere:</span></label>
                                            <div class="col-md-3 text-left">
                                                <div class="input-group">
                                                    <asp:Label ID="lblJM" runat="server" CssClass="form-control input-xs" placeholder="JM"></asp:Label>
                                                </div>
                                                <span class="validation-error-label" id="ValidJMPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidJM" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span10" runat="server"></span></label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /JM-->
                                <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                <!-- Kolicina -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span9" runat="server">Količina:</span></label>
                                            <div class="col-md-3 text-left">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtKolicina" runat="server" CssClass="form-control input-xs" placeholder="Količina" AutoPostBack="true"></asp:TextBox>
                                                </div>
                                                <span class="validation-error-label" id="ValidKolicinaPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidKolicina" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span13" runat="server"></span></label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Kolicina -->
                                <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                <!-- Datum -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="ValidDATREG" runat="server">Datum:</span></label>
                                            <div class="col-md-3 text-left">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtDATUM" runat="server" CssClass="form-control no-shadow pickadate" placeholder="Datum" AutoPostBack="True"></asp:TextBox>
                                                    <%--<span class="input-group-addon"><i class="icon-calendar3"></i></span>--%>
                                                    <span class="input-group-btn">
                                                        <button id="OpenCalendarDATUM" class="btn btn-default pt-5 pb-5" type="button"><i class="icon-calendar3"></i></button>
                                                    </span>
                                                </div>
                                                <span class="validation-error-label" id="ValidDATUMPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidDATUM" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span11" runat="server"></span></label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Datum -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /OSNOVNI PODACI -->

                <!-- PORUKA_GR -->
               <%-- spisak gresaka --%>
                <div id="PorukaGR" runat="server" class="row" visible="true">
                    <div class="col-md-12">
                        <div class="alert alert-info alert-styled-left alert-arrow-left alert-component border-danger-800 text-danger-800 no-margin-bottom">
                            <h6 id="lblPorukaGR" runat="server" ></h6>                            
                        </div>
                    </div>
                </div>


                <%-- DUGMIĆI --%>
                <!-- POTVRDI -->
                <div class="row">
                    <div class="col-md-12 pt-10">
                        <%-- <div class="row">
                            <div class="auto-style4">
                                <div class="alert alert-warning alert-styled-left alert-arrow-left alert-component border-info-700">
                                    <span class="alert-heading no-margin-bottom text-info-800">По завршеном попуњавању података о зарадама и часовима рада за ову локалну јединицу, обавезно кликните на дугме <b>ПОТВРДИ</b>. Уколико има неправилности, појавиће се одговарајућа порука и списак грешака које треба исправити. Уколико је све у реду добићете поруку да сте успешно доставили податке и могућност да одштампате упитник. </span>
                                </div>
                            </div>
                        </div>--%>
                        <div class="row mb-10">
                            <div class="col-md-12">
                                <div class="input-group-btn text-center">
                                    <asp:LinkButton ID="btnPotvrdiPREDATNICA" runat="server" OnClick="btnPotvrdiPREDATNICA_Click" CssClass="btn btn-info btn-xs bg-info-700" Style="left: 0px; top: 6px">POTVRDI <i class="icon-checkmark3 position-right"></i></asp:LinkButton><br />
                                </div>
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



                    <div class="row mb-12">
                        <div class="col-md-12">
                            <div class="input-group-btn text-center">
                                <asp:LinkButton ID="btnOdustaniLJ" OnClick="btnOdustaniLJ_Click" runat="server" CssClass="btn btn-xs btn-info bg-info-400" Style="left: 0px; top: 12px; margin-bottom: 20px"><i class="icon-table position-left"></i>VRATI SE NA SPISAK PREDATNICA</asp:LinkButton>
                            </div>
                        </div>
                    </div>
            </ContentTemplate>


        </asp:UpdatePanel>

    </div>
    <!-- /POTVRDI -->

    <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>


    <%-- JS --%>

    <script src="Content/js/bootstrap/moment.min.js"></script>
    <script src="Content/js/bootstrap/bootstrap-datepicker.js"></script>
    <script src="Content/js/jquery/picker.js"></script>  
    <script src="Content/js/jquery/picker.date.js"></script>



    <script type="text/javascript">
      function pageFunctions() {
          var inputOd = $("#cphBody_txtDATUM").pickadate({
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
          var inputDoNeakt = $("#cphBody_txtDatumRazvoda").pickadate({
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
          $('#OpenCalendarPRIJEM').on('click', function (e) {
              if (pickerOd.get('open')) {
                  pickerOd.close()
              } else {
                  pickerOd.open()
              }
              e.stopPropagation()
          });
          var pickerDo = inputDoNeakt.pickadate('picker');
          $('#OpenCalendarRAZVOD').on('click', function (e) {
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

          $('.btn-loading').click(function () {
              var btn = $(this);
              btn.button('loading')
              setTimeout(function () {
                  btn.button('Reset')
              }, 3000)
          });
      }
        $(document).ready(pageFunctions);

        $(document).keypress(function (e) {
            if (e.which == 13 && e.target.tagName != 'textarea') {
                var txt = $(e.target);
                var allOther = $("input[type=text]:not(:disabled, [readonly='readonly'])");
                var index = jQuery.inArray(txt[0], allOther);
                var next = $(allOther[index + 1]);
                if (next) next.focus();
                //debugger;
                //Need to set focus to next active text field here.
                return false;
            }
        });
        function Broj(e, decimal) {
            var key;
            var keychar;

            if (window.event) {
                key = window.event.keyCode;
            }
            else if (e) {
                key = e.which;
            }
            else {
                return true;
            }
            keychar = String.fromCharCode(key);

            if ((key == null) || (key == 0) || (key == 8) || (key == 9) || (key == 13) || (key == 27)) {
                return true;
            }
            else if ((("0123456789").indexOf(keychar) > -1)) {
                return true;
            }
                //else if (decimal && (keychar == ".")) {
                //    return true;
                //}
            else
                return false;
        }
       
        history.pushState(null, null, 'Predatnica.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Predatnica.aspx');
        });

    </script>
     <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(pageFunctions);
    </script>
</asp:Content>

