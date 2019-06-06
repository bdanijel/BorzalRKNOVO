<%@ Page Title="" Language="VB" MasterPageFile="~/zADM_BORZAL_Master.master" AutoEventWireup="false" CodeFile="Kontakt.aspx.vb" Inherits="Kontakt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPOLista" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" Runat="Server">

    <div class="col-md-12">
        <div class="panel mb-10">
            <div class="panel-heading pt-5 pb-5 alpha-GreyPurple img-bg">
                <h6 class="panel-title text-semibold"><span class="text-size-base">Kontakt</span></h6>
            </div>
            <div class="panel-body pt-15 pb-10">
                <!-- PROIZVOD - Naziv -->
                <div class="form-horizontal">
                    <div class="form-group form-group-xs no-margin-bottom">
                        <div class="row">
                            <label class="col-md-3 control-label text-size-base text-semibold no-padding-right"><span id="Span14" runat="server">Poruka za slanje:</span></label>
                            <div class="col-md-8 text-left">
                                <div class="input-group col-md-8">
                                    <asp:TextBox ID="txtPoruka" runat="server" Height="137px" TextMode="MultiLine" Width="323px" CssClass="form-control input-xs"  style="margin-bottom:20px" placeholder="Ovde napisati poruku..."></asp:TextBox>
                                </div>
                                  <span class="validation-error-label" id="ValidTekstPoruka" runat="server"></span>
                            </div>
                            <label id="ValidTekst" runat="server" class="col-md-1 control-label text-size-base text-semibold no-padding-right"><span id="Span16" runat="server"></span></label>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="input-group-btn text-center">
                                    <asp:LinkButton ID="btnPoruka" runat="server" CssClass="btn btn-info btn-xs bg-info-700" style="margin-bottom:20px">POŠALJI PORUKU <i class="icon-checkmark3 position-right"></i></asp:LinkButton><br />
                                </div>
                            </div>
                        </div>
                        <asp:Label ID="lblSlanjePoruke" runat="server"></asp:Label>
                    </div>
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

    <%-- spisak gresaka --%>
    <div id="PorukaGR" runat="server" class="row" visible="false">
        <div class="col-md-12">
            <div class="alert alert-info alert-styled-left alert-arrow-left alert-component border-danger-800 text-danger-800 no-margin-bottom">
                <h6 id="lblPorukaGR" runat="server"></h6>
            </div>
        </div>
    </div>

    <div id="Pocetna" class="content pt-20">
        <div class="row">
            <div class="col-md-8 col-md-push-2">
                <div class="alert alert-info alert-styled-left alert-arrow-left alert-component border-primary-800 text-primary-800">
                    <button type="button" class="close" data-dismiss="alert"><span>&times;</span><span class="sr-only">Close</span></button>
                    <h6 class="alert-heading text-default no-margin-bottom pb-20">Poštovani,</h6>
                    <h6 class="alert-heading text-default no-margin-bottom">Ovim putem možete slati poruke u vezi primedbi i predloga</h6>
                    <h6 class="alert-heading text-default no-margin-bottom">vezanih za rad programa.</h6>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

