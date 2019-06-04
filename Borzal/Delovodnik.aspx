<%@ Page Title="" Language="VB" MasterPageFile="~/zADM_PISARNICA_Master.master" AutoEventWireup="false" CodeFile="Delovodnik.aspx.vb" Inherits="DELOVODNIK" %>
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
        <asp:UpdatePanel ID="upDELOVODNIKID" runat="server">
            <ContentTemplate>

 <%-- BRISATI SAMO ZA PRIKAZ GREŠAKA U SQL!!!--%>
               
<%-- /BRISATI SAMO ZA PRIKAZ GREŠAKA U SQL!!!--%>

                 <!-- ZAGLAVLJE OBRASCA -->
                 <div class="row">
                    <div class="col-md-12">
                        <h6 class="m-10 content-group text-semibold"><i class="icon-folder-open position-left text-primary-800"></i>ОБРАЗАЦ ЗА УНОС ДЕЛОВОДНИКА</b> </h6>
                    </div>
                </div>
                 <!-- /ZAGLAVLJE OBRASCA -->

 <!-- OSNOVNI PODACI -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel mb-10">
                            <div class="panel-heading pt-5 pb-5 alpha-GreyPurple img-bg">
                                <h6 class="panel-title text-semibold"><span class="text-size-base">Основни подаци</span></h6>
                            </div>
                            <div class="panel-body pt-15 pb-10">
                                 <!-- Godina -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span17" runat="server">Година:</span></label>
                                            <div class="col-md-1 text-left">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtGodina" runat="server" CssClass="form-control input-xs" placeholder="Година" AutoPostBack="false" Enabled="false"></asp:TextBox>
                                            </div>
                                                <span class="validation-error-label" id="Span18" runat="server"></span>
                                            </div>
                                            <label id="Label3" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span19" runat="server"></span></label>
                                             <div>
                                                 <asp:LinkButton ID="btnReset"  runat="server" OnClick="Reset_Click" CssClass="btn btn-danger btn-xs bg-danger-700" style="left: 0px; top: 0px">БРИШИ СВЕ<i class="glyphicon glyphicon-remove position-right"></i></asp:LinkButton>
                                             </div>
                                           </div>
                                    </div>
                                </div>
                                <!-- /Godina-->
                                  <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                <!-- Redni broj-->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span2" runat="server">Редни број:</span></label>
                                            <div class="col-md-3 text-left">
                                                <div class="input-group col-md-3">
                                                    <asp:TextBox ID="txtRbr" runat="server" CssClass="form-control input-xs" onkeypress="return Broj(event, false);" placeholder="Ред.бр." AutoPostBack="True"></asp:TextBox>
                                            </div>
                                        <span class="validation-valid-label" id="ValidRbrPoruka" runat="server"></span>
                                            </div>
                                                <label id="ValidRbr" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span4" runat="server"></span></label>
                                             <div>
                                                 <asp:LinkButton ID="btnRazvod"  runat="server" OnClick="Razvod_Click" CssClass="btn btn-primary btn-xs bg-primary-700" style="left: 0px; top: 0px">РАЗВОЂЕЊЕ<i class="glyphicon glyphicon-paperclip position-right"></i></asp:LinkButton>
                                             </div>
                                              </div>
                                    </div>
                                </div>
                                <!-- /Redni broj-->
                                <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                <!-- Pod broj-->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span3" runat="server">Под број:</span></label>
                                            <div class="col-md-1 text-left">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtPodBroj" runat="server" CssClass="form-control input-xs" onkeypress="return Broj(event, false);" placeholder="Под бр." AutoPostBack="true" Enabled="false"></asp:TextBox>
                                            </div>
                                                <span class="validation-valid-label" id="ValidPodBrojPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidPodBroj" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span6" runat="server"></span></label>
                                           </div>
                                    </div>
                                </div>
                                <!-- /Pod broj-->
 <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                     <!-- Klasifikacioni broj-->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span5" runat="server">Класификациони број:</span></label>
                                         <%--<div class="col-md-10 text-left">--%>
                                               <%-- <div class="input-group">--%>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlKlasifikacioniBrojID" runat="server" CssClass="col-md-4 select-size-xs" AutoPostBack="true"></asp:DropDownList>

                                                    </div>
                                                    <div class="col-md-1">
                                                        <asp:Label ID="lblKlasifikacioniBroj" runat="server" CssClass="form-control input-xs" Enabled="true"></asp:Label>
                                                    </div> 
                                               <%-- </div>--%>
                                                  <span class="validation-error-label" id="ValidKlasifikacioniBrojIDPoruka" runat="server"></span>
                                          <%--   </div>--%>
                                             <label id="ValidKlasifikacioniBrojID" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span8" runat="server"></span></label>
                                            </div>
                                        </div>
                                    </div>
                                <!-- /Klasifikacioni broj -->
    <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                <!-- Delovodni broj -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span7" runat="server">Деловодни број:</span></label>
                                            <div class="col-md-3 text-left">
                                                <div class="input-group">
                                                    <asp:label ID="lblDelovodniBroj" runat="server" CssClass="form-control input-xs" placeholder="Деловодни број" ></asp:label>
                                            </div>
                                                <span class="validation-error-label" id="ValidDelovodniBrojPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidDelovodniBroj" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span10" runat="server"></span></label>
                                           </div>
                                    </div>
                                </div>
                                <!-- /Delovodni broj-->
    <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                     <!-- Datum prijema -->
                                    <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="ValidDATREG" runat="server">Датум пријема:</span></label>
                                            <div class="col-md-3 text-left">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtDATUMPRIJEMA" runat="server" CssClass="form-control no-shadow pickadate" placeholder="Датум пријема" AutoPostBack="True"></asp:TextBox>
                                                    <%--<span class="input-group-addon"><i class="icon-calendar3"></i></span>--%>
                                                    <span class="input-group-btn"><button id="OpenCalendarDATUMPRIJEMA" class="btn btn-default pt-5 pb-5" type="button"><i class="icon-calendar3"></i></button></span>
                                                </div>
                                                <span class="validation-error-label" id="ValidDATUMPRIJEMAPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidDATUMPRIJEMA" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span11" runat="server"></span></label>
                                           </div>
                                    </div>
                                </div>
                                     <!-- /Datum prijema -->
<div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                     <!-- Klasa dokumenta-->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span9" runat="server">Класа документа:</span></label>
                                         <%--<div class="col-md-9 text-left">--%>
                                               <%-- <div class="input-group">--%>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="ddlKlasaDokumentaID" runat="server" CssClass="select-size-xs" AutoPostBack="true"></asp:DropDownList>
                                                    </div>
                                                <%--</div>--%>
                                                  <span class="validation-error-label" id="Span13" runat="server"></span>
                                           <%--  </div>--%>
                                            </div>
                                        </div>
                                    </div>
                                <!-- /Klasa dokumenta -->
                            </div>
                            </div>
                            </div>
                    </div>
    <!-- /OSNOVNI PODACI -->     


 <!-- OPIS DOKUMENTA -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel mb-10">
                            <div class="panel-heading pt-5 pb-5 alpha-GreyPurple img-bg">
                                <h6 class="panel-title text-semibold"><span class="text-size-base">Опис документа</span></h6>
                            </div>
                            <div class="panel-body pt-15 pb-10">
                                <!-- Opis dokumenta -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span14" runat="server">Опис документа:</span></label>
                                            <div class="col-md-8 text-left">
                                                <div class="input-group col-md-8">
                                                    <asp:TextBox ID="txtTekst" runat="server" CssClass="form-control input-xs" placeholder="Опис документа"></asp:TextBox>
                                            </div>
                                                <span class="validation-error-label" id="ValidTekstPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidTekst" runat="server" class="col-md-1 control-label text-size-base text-semibold no-padding-right"><span id="Span16" runat="server"></span></label>
                                           </div>
                                    </div>
                                </div>
                                <!-- /Opis dokumenta-->
                                <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                <!-- Primedba -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span15" runat="server">Примедба:</span></label>
                                            <div class="col-md-8 text-left">
                                                <div class="input-group col-md-8">
                                                    <asp:TextBox ID="txtPrimedba" runat="server" CssClass="form-control input-xs" placeholder="Примедба"></asp:TextBox>
                                            </div>
                                                <span class="validation-error-label" id="ValidPrimedbaPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidPrimedba" runat="server" class="col-md-1 control-label text-size-base text-semibold no-padding-right"><span id="Span21" runat="server"></span></label>
                                           </div>
                                    </div>
                                </div>
                                <!-- /Primedba -->
                                <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                 <!-- Pošiljaoc -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span22" runat="server">Пошиљаоц:</span></label>
                                            <div class="col-md-8 text-left">
                                                <div class="input-group col-md-8">
                                                    <asp:TextBox ID="txtPosiljaoc" runat="server" CssClass="form-control input-xs" placeholder="Пошиљаоц"></asp:TextBox>
                                            </div>
                                                <span class="validation-error-label" id="ValidPosiljaocPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidPosiljaoc" runat="server" class="col-md-1 control-label text-size-base text-semibold no-padding-right"><span id="Span24" runat="server"></span></label>
                                           </div>
                                    </div>
                                </div>
                                <!-- /Pošiljaoc -->
                                <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                    <!-- Iznos -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span20" runat="server">Износ:</span></label>
                                            <div class="col-md-3 text-left">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtIznos" runat="server" CssClass="form-control input-xs" placeholder="Износ"></asp:TextBox>
                                            </div>
                                                <span class="validation-error-label" id="ValidIznosPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidIznos" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span25" runat="server"></span></label>
                                           </div>
                                    </div>
                                </div>
                                <!-- /Iznos -->
                                </div>
                            </div>
                        </div>
                    </div>
 <!-- /OPIS DOKUMENTA -->


<!-- RAZVOĐENJE -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel mb-10">
                            <div class="panel-heading pt-5 pb-5 alpha-GreyPurple img-bg">
                                <h6 class="panel-title text-semibold"><span class="text-size-base">Развођење</span></h6>
                            </div>
                            <div class="panel-body pt-15 pb-10">
                                  
                                  <!-- Datum razvoda -->
                                    <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span28" runat="server">Датум развођења:</span></label>
                                            <div class="col-md-3 text-left">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtDatumRazvoda" runat="server" CssClass="form-control no-shadow pickadate" placeholder="Датум развођења" AutoPostBack="True"></asp:TextBox>
                                                    <%--<span class="input-group-addon"><i class="icon-calendar3"></i></span>--%>
                                                    <span class="input-group-btn"><button id="OpenCalendarDATUMRAZVODA" class="btn btn-default pt-5 pb-5" type="button"><i class="icon-calendar3"></i></button></span>
                                                </div>
                                                <span class="validation-error-label" id="ValidDatumRazvodaPoruka" runat="server"></span>
                                            </div>
                                            <label id="ValidDatumRazvoda" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span31" runat="server"></span></label>
                                           </div>
                                    </div>
                                </div>
                                     <!-- /Datum razvoda -->
                                  <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                <!-- Organizaciona jedinica -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span23" runat="server">Организациона јединица:</span></label>
                                        <%-- <div class="col-md-10 text-left">--%>
                                                <%--<div class="input-group">--%>
                                                    <div class="col-md-5"><asp:DropDownList ID="ddlOrgJedID" runat="server" CssClass="select-size-xs" AutoPostBack="true"></asp:DropDownList></div>
                                                    <div class="col-md-1"><asp:label ID="lblOrgJedNaziv" runat="server" CssClass="form-control input-xs" Enabled="true"></asp:label></div> 
                                               <%-- </div>--%>
                                                  <span class="validation-error-label" id="ValidOrgJedNazivPoruka" runat="server"></span>
                                           <%--  </div>--%>
                                              <label id="ValidOrgJedNaziv" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span27" runat="server"></span></label>
                                            </div>
                                        </div>
                                    </div>
                               
                                <!-- /Organizaciona jedinica -->
                                <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                               <!-- Kome je namenjeno -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span26" runat="server">Коме је намењено:</span></label>
                                        <%-- <div class="col-md-10 text-left">
                                                <div class="input-group">--%>
                                                    <div class="col-md-5">
                                                        <asp:DropDownList ID="ddlNamenjeno" runat="server" CssClass="select-size-xs" AutoPostBack="true"></asp:DropDownList></div>
                                                    <div class="col-md-1">
                                                        <asp:label ID="lblNamenjenoImePrezime" runat="server" CssClass="form-control input-xs" Enabled="true"></asp:label></div> 
                                               <%-- </div>--%>
                                                  <span class="validation-error-label" id="ValidNamenjenoPoruka" runat="server"></span>
                                            <%-- </div>--%>
                                              <label id="ValidNamenjeno" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span29" runat="server"></span></label>
                                            </div>
                                        </div>
                                    </div>
                               <!-- /Kome je namenjeno -->
                               <%-- <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>--%>
                             
                              </div>
                                                </div>
                     </div>
                            </div>
<!-- /RAZVOĐENJE -->



 <!-- POPIS AKATA -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel mb-10">
                            <div class="panel-heading pt-5 pb-5 alpha-GreyPurple img-bg">
                                <h6 class="panel-title text-semibold"><span class="text-size-base">Попис аката</span></h6>
                            </div>
                            <div class="panel-body pt-15 pb-10">
                                <!-- Popis akata -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                                            <div class="check">
                                                            <label class="control control--checkbox"><asp:CheckBox ID="chkPopisAkata" runat="server" AutoPostBack="True" /><div class="control-indicator primary"><span class="icon"></span></div><span class="text-semibold ml-15">Попис аката</span></label>
                                           </div>
                                    </div>
                                </div>
                                <!-- /Popis akata -->
                                <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                <!-- Da li je aktivan -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                                            <div class="check">
                                                            <label class="control control--checkbox"><asp:CheckBox ID="chkAktivanPopisAkata" runat="server" AutoPostBack="True" /><div class="control-indicator primary"><span class="icon"></span></div><span class="text-semibold ml-15">Активан попис аката</span></label>
                                                        </div>
                                    </div>
                                </div>
                                <!-- /Da li je aktivan -->
                                </div>
                            </div>
                        </div>
                    </div>
 <!-- /POPIS AKATA -->

<!-- PREUZIMANJE PREBAČENO U KO JE PREUZEO DEO, OVDE SAMO ZBOG CONTROLA -->
              
                                                     <asp:CheckBox ID="chkPreuzeo" runat="server" AutoPostBack="False" enabled="false" visible="false" />
                                                    <asp:TextBox ID="txtPreuzeoKO" runat="server" CssClass="form-control input-xs" enabled="false" Visible="false"></asp:TextBox>
                                                    <asp:label ID="lblPreuzeoKOImePrezime" runat="server" CssClass="form-control input-xs" Visible="false"></asp:label>
                                                    <asp:label ID="lblPreuzeoKOLokacija" runat="server" CssClass="form-control input-xs" Visible="false" ></asp:label>
                                                    <asp:label ID="lblPreuzeoKODirektni" runat="server" CssClass="form-control input-xs" Visible="false" ></asp:label>
                                                    <asp:TextBox ID="txtDatumPreuzeo" runat="server" CssClass="form-control input-xs" placeholder="Датум преузимања" Enabled ="false" Visible="false"></asp:TextBox>
      
 <!-- /PREUZIMANJE -->

                <%--  KO JE PREUZEO --%>
              
                <div id="Div1" runat="server" class="row" >
                    <div class="col-md-12">
                        <h6 class="m-10 content-group text-semibold"><i class="icon-pencil position-left text-primary-800"></i>Подаци о особи која је преузела документ:</h6>
                        <div class="panel mb-10 no-border-top">
                            <div class="table-responsive">
                                <table id="tPREUZEO" class="Zarade table table-bordered table-xs">
                                    <tr class="border-top-grey-100">
                                        <td class="width-15per text-semibold text-right">Документ преузео: </td><td><span id="PreuzeoKOImePrezime" runat="server"></span></td>
                                        <td class="width-15per text-semibold text-right">Датум преузимања: </td><td><span id="DatumPreuzeo" runat="server"></span></td>
                                        <td class="width-15per text-semibold text-right">Контакт телефон: </td><td><span id="PreuzeoKODirektni" runat="server"></span></td>
                                        <td class="width-15per text-semibold text-right">Седиште: </td><td><span id="PreuzeoKOLokacija" runat="server"></span></td>
                                    </tr>                                                
                                </table>
                            </div>
                        </div>
                    </div>
                </div>  



<!-- OSTALO -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel mb-10">
                            <div class="panel-heading pt-5 pb-5 alpha-GreyPurple img-bg">
                                <h6 class="panel-title text-semibold"><span class="text-size-base">Остало</span></h6>
                            </div>
                            <div class="panel-body pt-15 pb-10">
                                  <!-- Link za dokument -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                                <asp:TextBox ID="txtLinkZaDokument" runat="server" CssClass="form-control input-xs text-left" onkeypress="return numbersonly(event, false);" MaxLength="9"></asp:TextBox></td>
                                                 <asp:FileUpload ID="FileUploadDOKUMENT" runat="server" ToolTip="Изаберите документ који желите да сачувате" />
     <asp:Button ID="btnUpload" Text="Сачувај документ" runat="server" OnClick="UploadButton_Click" />
      <br />
      <asp:Label ID="lblStatusUpload" Text="Upload status: " runat="server" />  <br />
      <asp:Button ID="btnDownload" Text="Прикажи документ" runat="server" OnClick="DownloadButton_Click" Visible="false"/>
           <ul id="linkPrikaz" runat="server" clientid="static"></ul>    
                                    </div>
                                </div>
                                <!-- /Link za dokument -->
                                 <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                <!-- INDLinkZaDokument -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                                            <div class="check">
                                                            <asp:CheckBox ID="chkINDLinkZaDokument" runat="server" enabled="false" visible="false" />
                    <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="lblINDLinkZaDokument" runat="server"></span></label>
                                                                
                                           </div>
                                    </div>
                                </div>
                                <!-- /INDLinkZaDokument -->
                                   <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                <!-- Smer kretanja dokumenta -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <div class="col-md-12">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="ValidIndSed" runat="server">Смер кретања документа:</span></label>
                                                    <%--<div class="col-md-9 pt-4">--%>
                                                        <label class="control control--radio col-md-2"><asp:RadioButton ID="radioSmerPrimljeno" runat="server" GroupName="INDSED" AutoPostBack="true" /><div class="control-indicator primary"><span class="icon"></span></div><span class="ml-15">ПРИМЉЕНО</span></label>
                                                        <label class="control control--radio col-md-2"><asp:RadioButton ID="radioSmerPoslato" runat="server" GroupName="INDSED" AutoPostBack="true" /><div class="control-indicator primary"><span class="icon"></span></div><span class="ml-15">ПОСЛАТО</span></label>
                                                        <label class="control control--radio col-md-2"><asp:RadioButton ID="radioSmerOdneto" runat="server" GroupName="INDSED" AutoPostBack="true" /><div class="control-indicator primary"><span class="icon"></span></div><span class="ml-15">ОДНЕТО</span></label>
                                                        <span class="validation-error-label" id="ValidIndSedPoruka" runat="server"></span>
                                                   <%-- </div>--%>
                                            
                                           </div>
                                            </div>
                                    </div>
                                </div>
                                <!-- /Smer kretanja dokumenta -->
                                 <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                  <!-- Korisnik - na kraju prebaciti u hidden polje -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span1" runat="server">Корисник иденр:</span></label>
                                            <div class="col-md-3 text-left">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtKorisnik" runat="server" CssClass="form-control input-xs text-right"  ></asp:TextBox></td>
                                            </div>
                                                <span class="validation-error-label" id="Span37" runat="server"></span>
                                            </div>
                                            <label id="Label5" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span38" runat="server"></span></label>
                                           </div>
                                    </div>
                                </div>
                                <!-- /Korisnik - na kraju prebaciti u hidden polje -->
                                                             <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>
                                  <!-- PodOd - na kraju prebaciti u hidden polje -->
                                <div class="form-horizontal">
                                    <div class="form-group form-group-xs no-margin-bottom">
                                        <div class="row">
                                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span39" runat="server">ПодОд3:</span></label>
                                            <div class="col-md-3 text-left">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtPodOd3" runat="server" CssClass="form-control input-xs text-right"  ></asp:TextBox></td>
                                            </div>
                                                <span class="validation-error-label" id="Span40" runat="server"></span>
                                            </div>
                                            <label id="Label6" runat="server" class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span41" runat="server"></span></label>
                                           </div>
                                    </div>
                                </div>
                                <!-- /PodOd - na kraju prebaciti u hidden polje -->
                                </div>
                            </div>
                        </div>
                    </div>
 <!-- /OSTALO -->


                  <!-- PORUKA_GR -->
               <%-- spisak gresaka --%>
                <div id="PorukaGR" runat="server" class="row" visible="true">
                    <div class="col-md-12">
                        <div class="alert alert-info alert-styled-left alert-arrow-left alert-component border-danger-800 text-danger-800 no-margin-bottom">
                            <h6 id="lblPorukaGR" runat="server" ></h6>                            
                        </div>
                    </div>
                </div>



                <%--  KO JE UNEO PODATKE--%>
              
                <div id="rowKontakt" runat="server" class="row" >
                    <div class="col-md-12">
                        <h6 class="m-10 content-group text-semibold"><i class="icon-person position-left text-primary-800"></i>Подаци о особи која је попунила деловодник:</h6>
                        <div class="panel mb-10 no-border-top">
                            <div class="table-responsive">
                                <table id="tKONTAKT" class="Zarade table table-bordered table-xs">
                                    <tr class="border-top-grey-100">
                                        <td class="width-15per text-semibold text-right">Попунио: </td><td><span id="txtKontaktOsoba" runat="server"></span></td>
                                        <td class="width-15per text-semibold text-right">Контакт телефон: </td><td><span id="txtKontaktTelefon" runat="server"></span></td>
                                        <td class="width-15per text-semibold text-right">Седиште: </td><td><span id="txtKontaktLokacija" runat="server"></span></td>
                                    </tr>                                                
                                </table>
                            </div>
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
                                    <asp:LinkButton ID="btnPotvrdiDELOVODNIK" runat="server" OnClick="btnPotvrdiDELOVODNIK_Click" CssClass="btn btn-info btn-xs bg-info-700" style="left: 0px; top: 6px">ПОТВРДИ <i class="icon-checkmark3 position-right"></i></asp:LinkButton><br />
                                    <asp:LinkButton ID="btnOmotSpisaStampa"  runat="server" OnClick="OmotSpisaStampa_Click" CssClass="btn btn-primary btn-xs bg-primary-400" style="left: 0px; top: 12px">ОМОТ СПИСА<i class="glyphicon glyphicon-print position-right"></i></asp:LinkButton>
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
                                <asp:LinkButton ID="btnOdustaniLJ" OnClick="btnOdustaniLJ_Click" runat="server" CssClass="btn btn-xs btn-info bg-info-400" style="left: 0px; top: 12px; margin-bottom: 20px"><i class="icon-table position-left"></i>ВРАТИ СЕ НА СПИСАК ДОКУМЕНАТА У ДЕЛОВОДНИКУ</asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <%--                KLJUČEVI!!    
                <asp:TextBox ID="txtID_Korisnika" runat="server" CssClass="hidden"></asp:TextBox>
                <asp:TextBox ID="txtMB" runat="server" CssClass="hidden"></asp:TextBox>
                <asp:TextBox ID="txtVRPROMENE" runat="server" CssClass="hidden"></asp:TextBox>
                <asp:TextBox ID="txtIDLJ" runat="server" CssClass="hidden"></asp:TextBox>--%>
            </ContentTemplate>
             <Triggers>
                <asp:PostBackTrigger ControlID="btnUpload" />
             </Triggers>

         

   </asp:UpdatePanel>

            
    </div>

    <!-- /POTVRDI -->
    <div class="content-divider text-muted form-group no-margin-top no-margin-bottom"><span></span></div>


    <asp:TextBox ID="txtID_Korisnika" runat="server" CssClass="hidden"></asp:TextBox>
    <asp:Button ID="btnCreate" runat="server" CssClass="hidden"></asp:Button>
    <asp:Button ID="btnPrint" runat="server" CssClass="hidden"></asp:Button>
    
        <%-- IZVEŠTAJ - OMOT SPISA --%>
   
        <rsweb:ReportViewer ID="rwOmotSpisa" runat="server" Visible="true" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" ExportContentDisposition="AlwaysInline" Height="11.69in" Width="8.27in" PageCountMode="Actual" InternalBorderColor="Black" InternalBorderWidth="2px" ShowBackButton="False" ShowCredentialPrompts="False" ShowDocumentMapButton="False" ShowParameterPrompts="False" ShowPromptAreaButton="False" ShowRefreshButton="false" ShowZoomControl="False">
            <LocalReport ReportPath="Izvestaji\rOmotSpisa.rdlc">
            </LocalReport>
        </rsweb:ReportViewer>


    <%-- JS --%>

    <script src="Content/js/bootstrap/moment.min.js"></script>
    <script src="Content/js/bootstrap/bootstrap-datepicker.js"></script>
    <script src="Content/js/jquery/picker.js"></script>  
    <script src="Content/js/jquery/picker.date.js"></script>



    <script type="text/javascript">
      function pageFunctions() {
          var inputOd = $("#cphBody_txtDATUMPRIJEMA").pickadate({
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
       
        history.pushState(null, null, 'Delovodnik.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Delovodnik.aspx');
        });

    </script>
     <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(pageFunctions);
    </script>
</asp:Content>

