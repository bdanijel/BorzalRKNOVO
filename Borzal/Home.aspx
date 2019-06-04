<%@ Page Title="" Language="VB" MasterPageFile="~/zADM_PISARNICA_Master.master" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Home" %>

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
                <div id="UputstvaLista" class="panel panel-collapse collapse">
                    <div class="panel-body p-10">
                        <ul class="list-feed" id="Uputstva">
                            <li class="border-purple-300"><a href="Content/doc/Uputstva/MetodoloskoUputstvo.pdf" target="_blank"><i class="icon text-size-18 icon-file-pdf position-left"></i>Методолошко упутство</a></li>
                            <li class="border-purple-300"><a href="Content/doc/Uputstva/KorisnickoUputstvo.pdf" target="_blank"><i class="icon text-size-18 icon-file-pdf position-left"></i>Упутство за коришћење апликације</a></li>
                            <li class="border-purple-300"><a href="Content/doc/Sifarnici/Lista popisa akata.pdf" target="_blank"><i class="icon text-size-18 icon-file-pdf position-left"></i>Листа пописа аката</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>     

     <div class="row">
                    <div class="col-md-12">
                        <h6 class="m-10 content-group text-semibold"><i class="icon-list position-left text-primary-800"></i><span id="MBListaTitle" runat="server">Листа пописа аката</span></h6>
                        <h6 class="font-family-Roboto text-semibold validation-error-label" id="H1" runat="server"></h6>
                        <div class="panel no-border">
                            <div class="table-responsive">                        
                                <asp:GridView ID="gvMB" runat="server" CssClass="table table-bordered table-xxs"
                                            AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True"
                                            DataSourceID="odsMB"
                                            PagerStyle-CssClass="pagination-nm"
                                            DataKeyNames="rbr" BorderWidth="0px" HeaderStyle-CssClass="alpha-grey img-bg" PagerSettings-Mode="NumericFirstLast" PagerStyle-Wrap="False">
                                    <Columns>
                                         <asp:BoundField DataField="rbr" HeaderText="Редни број" SortExpression="rbr" />
                                         <asp:BoundField DataField="opis" HeaderText="Опис" SortExpression="opis" />
                                        <asp:BoundField DataField="KlasifikacioniBrojID" HeaderText="Класификациони број ИД" SortExpression="KlasifikacioniBrojID" />
                                        <asp:BoundField DataField="KlasifikacioniBroj" HeaderText="Класификација опис" SortExpression="KlasifikacioniBroj" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
         </div>

    <asp:TextBox ID="txtID_Korisnika" runat="server" CssClass="hidden"></asp:TextBox>

    <div id="Pocetna" class="content pt-20">
        <div class="row">
            <div class="col-md-8 col-md-push-2">
                <div class="alert alert-info alert-styled-left alert-arrow-left alert-component border-primary-800 text-primary-800">
                    <button type="button" class="close" data-dismiss="alert"><span>&times;</span><span class="sr-only">Close</span></button>
                    <h6 class="alert-heading text-default no-margin-bottom pb-20">Поштовани,</h6>
                    <h6 class="alert-heading text-default no-margin-bottom">Тестирање апликације за рад писарнице почиње</h6>
                    <h6 class="alert-heading text-default no-margin-bottom">у четвртак, 18.10.2018. у 14 часова.</h6>
                </div>
            </div>
        </div>
    </div>

<asp:ObjectDataSource ID="odsMB" runat="server" SelectMethod="DajDS_IzUpita" TypeName="ADM_MM">
        <SelectParameters>
            <asp:SessionParameter Name="Upit" DefaultValue="SELECT * FROM vPopisAkata order by rbr" SessionField="UpitMB" Type="String" />
            <asp:Parameter Name="konekcija" Type="String" DefaultValue="<%$ ConnectionStrings:BORZALConnectionString %>" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

