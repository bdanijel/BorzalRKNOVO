<%@ Page Title="" Language="VB" MasterPageFile="~/zADM_BORZAL_Master.master" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Home" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" Runat="Server"></asp:Content>
<asp:Content ID="cPOLista" ContentPlaceHolderID="cphPOLista" Runat="Server">
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" Runat="Server">
     <!-- Content area -->
    <div class="Home content">        
        <div id="rowUvod" class="row mt--20">
            <div class="col-md-12">
                <div id="POLista" class="panel panel-collapse collapse">
                    <div class="table-responsive form-group form-group-xs no-margin-bottom">
                        <table class="table table-bordered table-xxs no-border-top">
                            <thead><tr><th>Име и презиме</th><th>eMail</th><th>Телефон</th></tr></thead>
                            <tbody id="tListaAdmin" runat="server"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>     

    <%-- <div class="row">
                    <div class="col-md-12">
                        <h6 class="m-10 content-group text-semibold"><i class="icon-list position-left text-primary-800"></i><span id="MBListaTitle" runat="server">Tabela sa trebovanjem</span></h6>
                        <h6 class="font-family-Roboto text-semibold validation-error-label" id="H1" runat="server"></h6>
                        <div class="panel no-border">
                            <div class="table-responsive">                        
                                <asp:GridView ID="gvMB" runat="server" CssClass="table table-bordered table-xxs"
                                            AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True"
                                            DataSourceID="odsMB"
                                            PagerStyle-CssClass="pagination-nm"
                                            DataKeyNames="id" BorderWidth="0px" HeaderStyle-CssClass="alpha-grey img-bg" PagerSettings-Mode="NumericFirstLast" PagerStyle-Wrap="False">
                                    <Columns>
                                         <asp:BoundField DataField="id" HeaderText="Редни број" SortExpression="id" />
                                        <asp:BoundField DataField="broj" HeaderText="Редни број" SortExpression="rbr" />
                                         <asp:BoundField DataField="rbr" HeaderText="Опис" SortExpression="rbr" />
                                        <asp:BoundField DataField="naziv" HeaderText="Класификациони број ИД" SortExpression="naziv" />
                                        <asp:BoundField DataField="jm" HeaderText="Класификација опис" SortExpression="jm" />
                                        <asp:BoundField DataField="kolicina" HeaderText="Класификација опис" SortExpression="kolicina" />
                                        <asp:BoundField DataField="datum" HeaderText="Класификација опис" SortExpression="datum" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>--%>
         </div>

    <asp:TextBox ID="txtID_Korisnika" runat="server" CssClass="hidden"></asp:TextBox>

    <div id="Pocetna" class="content pt-20">
        <div class="row">
            <div class="col-md-8 col-md-push-2">
                <div class="alert alert-info alert-styled-left alert-arrow-left alert-component border-primary-800 text-primary-800">
                    <button type="button" class="close" data-dismiss="alert"><span>&times;</span><span class="sr-only">Close</span></button>
                    <h6 class="alert-heading text-default no-margin-bottom pb-20">Poštovani,</h6>
                    <h6 class="alert-heading text-default no-margin-bottom">Ukoliko imate nekih pitanja, možete se obratiti se klikom na <i class="icon-envelope"></i></h6>
                    <h6 class="alert-heading text-default no-margin-bottom">koji se nalazi u gornjem desnom uglu ekrana.</h6>
                </div>
            </div>
        </div>
    </div>

<%--<asp:ObjectDataSource ID="odsMB" runat="server" SelectMethod="DajDS_IzUpita_lokal" TypeName="ADM_MM">
        <SelectParameters>
            <asp:SessionParameter Name="Upit" DefaultValue="SELECT * FROM vTrebovanje order by broj,rbr" SessionField="UpitMB" Type="String" />
            <asp:Parameter Name="konekcija" Type="String" DefaultValue="<%$ ConnectionStrings:BORZALConnectionString %>" />
        </SelectParameters>
    </asp:ObjectDataSource>--%>
</asp:Content>

