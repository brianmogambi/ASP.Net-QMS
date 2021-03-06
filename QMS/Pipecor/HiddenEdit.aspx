﻿<%@ Page Language="C#" MasterPageFile="~/Master/Pipecor.master" AutoEventWireup="true" CodeFile="HiddenEdit.aspx.cs" Inherits="Pipecor.Pipecor_HiddenEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script language="javascript">
        document.getElementById("edit").className = "active";
    </script>
    <link href="../Styles.css" rel="stylesheet" type="text/css"/>
    <link href="../prompts/default.css" rel="stylesheet" type="text/css"/>
    <div style="margin: 0px; width: 1200px;">
        <h3>Pipecore - Edit queue</h3>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="AutoRefreshTimer" runat="server" Interval="100000" ontick="AutoRefreshTimer_Tick"/>
            <table style="margin-top: 0px; width: 1200px;">
                <tr>
                    <td style="text-align: left; vertical-align: top;">
                        <asp:Panel ID="PanelExp" Height="420px" Visible="false" runat="server">
                            <h4>EXPORT QUEUE</h4>
                            <div class="gridBorder" style="min-height: 335px">
                                <asp:GridView ID="GridExp" runat="server" Width="1200px" AutoGenerateColumns="False" DataSourceID="SqlExportSource"
                                              DataKeyNames="QueueID" BackColor="#CCCCCC" EnableViewState="false" AllowPaging="true" PageSize="10" AutoGenerateEditButton="true"
                                              BorderColor="#000" BorderStyle="Solid" GridLines="Both" BorderWidth="1px" CellPadding="4" EnableSortingAndPagingCallbacks="true"
                                              CellSpacing="2" ForeColor="Black" onrowdatabound="GridExp_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="Queue_No" HeaderText="No."
                                                        SortExpression="Queue_No"/>
                                        <asp:BoundField DataField="Shipper" ItemStyle-Width="120px" HeaderText="OMC"
                                                        SortExpression="Shipper"/>
                                        <asp:BoundField DataField="Registration" ItemStyle-Width="200px" HeaderText="REGISTRATION"
                                                        SortExpression="Registration"/>
                                        <asp:BoundField DataField="LO_NO" HeaderText="L.O.NO"
                                                        SortExpression="LO_NO"/>
                                        <asp:BoundField DataField="Quantity" HeaderText="QUANTITY"
                                                        SortExpression="Quantity"/>
                                        <asp:BoundField DataField="Product" HeaderText="PRODUCT" ControlStyle-Width="70px" ItemStyle-Width="70px"
                                                        SortExpression="Product"/>
                                        <asp:BoundField DataField="Status" ItemStyle-Width="300px" HeaderText="STATUS"
                                                        SortExpression="Status"/>
                                        <asp:BoundField DataField="StatusTime" HeaderText="TIME IN" ItemStyle-Width="250px" DataFormatString="{0:MMM-dd-yyyy hh:mm tt}" ReadOnly="true"
                                                        SortExpression="StatusTime"/>
                                        <asp:BoundField DataField="Entitlement" ItemStyle-CssClass="Visibility" ControlStyle-CssClass="Visibility" HeaderStyle-CssClass="Visibility"
                                                        SortExpression="Entitlement"/>
                                        <asp:BoundField DataField="Suspended" ControlStyle-CssClass="Visibility" HeaderStyle-CssClass="Visibility" ItemStyle-CssClass="Visibility" HeaderText=""
                                                        SortExpression="Suspended"/>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC"/>
                                    <HeaderStyle BackColor="Black" Font-Bold="True" Height="25px" Font-Size="18px" ForeColor="White"/>
                                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" Height="25px"/>
                                    <RowStyle Font-Size="16px" BackColor="White" Font-Bold="true" Height="18px" HorizontalAlign="Right"/>
                                    <AlternatingRowStyle Font-Size="16px" Font-Bold="true" Height="18px" HorizontalAlign="Right"/>
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"/>
                                    <EmptyDataTemplate>
                                        <div style="width: 100%;">No trucks in the system</div>
                                    </EmptyDataTemplate>
                                    <PagerStyle HorizontalAlign="Right" BackColor="White" VerticalAlign="Bottom"/>
                                    <PagerSettings Mode="NumericFirstLast" NextPageText="Next" PreviousPageText="Prev"/>
                                </asp:GridView>

                            </div>
                            <p style="vertical-align: bottom;">
                                <asp:Button ID="LocSwitchBtn" runat="server" CssClass="btn" Text="Switch to Local Queue"
                                            onclick="LocSwitchBtn_Click"/>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="PanelLoc" Height="420px" runat="server">
                            <h4>LOCAL QUEUE</h4>
                            <div class="gridBorder" style="min-height: 335px;">
                                <asp:GridView ID="GridLocal" runat="server" Width="1200px" AutoGenerateColumns="False"
                                              DataKeyNames="QueueID" BackColor="#CCCCCC" EnableViewState="false" DataSourceID="SqlLocalSource"
                                              AllowPaging="true" PageSize="10" EnableSortingAndPagingCallbacks="true" AutoGenerateEditButton="true"
                                              BorderColor="#000" BorderStyle="Solid" GridLines="Both" BorderWidth="1px" CellPadding="4"
                                              CellSpacing="2" ForeColor="Black" onrowdatabound="GridLocal_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="Queue_No" HeaderText="No."
                                                        SortExpression="Queue_No"/>
                                        <asp:BoundField DataField="Shipper" ItemStyle-Width="120px" HeaderText="SHIPPER"
                                                        SortExpression="Shipper"/>
                                        <asp:BoundField DataField="Registration" ItemStyle-Width="200px" HeaderText="REGISTRATION"
                                                        SortExpression="Registration"/>
                                        <asp:BoundField DataField="LO_NO" HeaderText="L.O.NO"
                                                        SortExpression="LO_NO"/>
                                        <asp:BoundField DataField="MSP" HeaderText="MSP"
                                                        SortExpression="MSP"/>
                                        <asp:BoundField DataField="AGO" HeaderText="AGO"
                                                        SortExpression="AGO"/>
                                        <asp:BoundField DataField="KERO" HeaderText="KERO"
                                                        SortExpression="KERO"/>
                                        <asp:BoundField DataField="Status" ItemStyle-Width="300px" HeaderText="STATUS"
                                                        SortExpression="Status"/>
                                        <asp:BoundField DataField="StatusTime" HeaderText="TIME IN" ItemStyle-Width="250px" DataFormatString="{0:MMM-dd-yyyy hh:mm tt}" ReadOnly="true"
                                                        SortExpression="StatusTime"/>
                                        <asp:BoundField DataField="Entitlement" ItemStyle-CssClass="Visibility" ControlStyle-CssClass="Visibility" HeaderStyle-CssClass="Visibility"
                                                        SortExpression="Entitlement"/>
                                        <asp:BoundField DataField="Suspended" ControlStyle-CssClass="Visibility" HeaderStyle-CssClass="Visibility" ItemStyle-CssClass="Visibility" HeaderText=""
                                                        SortExpression="Suspended"/>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC"/>
                                    <HeaderStyle BackColor="Black" Font-Bold="True" Height="25px" Font-Size="18px" ForeColor="White"/>
                                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" Height="25px"/>
                                    <RowStyle Font-Size="16px" BackColor="White" Font-Bold="true" Height="18px" HorizontalAlign="Right"/>
                                    <AlternatingRowStyle Font-Size="16px" Font-Bold="true" Height="18px" HorizontalAlign="Right"/>
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"/>
                                    <EmptyDataTemplate>
                                        <div style="width: 100%;">No trucks in the system</div>
                                    </EmptyDataTemplate>
                                    <PagerStyle HorizontalAlign="Right" BackColor="White" VerticalAlign="Bottom"/>
                                    <PagerSettings Mode="NumericFirstLast" NextPageText="Next" PreviousPageText="Prev"/>
                                </asp:GridView>

                            </div>
                            <p style="vertical-align: bottom;">
                                <asp:Button ID="ExpSwitchBtn" runat="server" CssClass="btn" Text="Switch to Export Queue"
                                            onclick="ExpSwitchBtn_Click"/>
                            </p>
                        </asp:Panel>

                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlLocalSource" runat="server"
                               ConnectionString="<%$ ConnectionStrings:SecureConnectionString %>"
                               SelectCommand="SELECT * FROM NewQueue WHERE (NewQueue.Type = 'Local') AND (NewQueue.Status = 'SECURITY' OR NewQueue.Status = 'UNAVAILABLE-SECURITY' OR NewQueue.Status = 'NO TRUCK-SECURITY') AND (NewQueue.Archived IS NULL) AND (NewQueue.Finished IS NULL) AND (NewQueue.Withdrawal IS NULL OR NewQueue.Withdrawal = 'False') AND (NewQueue.SetDate = @TheDate) ORDER BY NewQueue.Queue_No"
                               UpdateCommand="UPDATE NewQueue SET Shipper = @Shipper, Registration = @Registration, LO_NO = @LO_NO, MSP = @MSP, AGO = @AGO, KERO = @KERO, Status = @Status WHERE QueueID = @QueueID">
                <UpdateParameters>
                    <asp:Parameter Name="Shipper"/>
                    <asp:Parameter Name="Registration"/>
                    <asp:Parameter Name="LO_NO"/>
                    <asp:Parameter Name="MSP"/>
                    <asp:Parameter Name="AGO"/>
                    <asp:Parameter Name="KERO"/>
                    <asp:Parameter Name="Status"/>
                    <asp:Parameter Name="QueueID"/>
                </UpdateParameters>
                <SelectParameters>
                    <asp:Parameter Name="TheDate" Type="DateTime"/>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlExportSource" runat="server"
                               ConnectionString="<%$ ConnectionStrings:SecureConnectionString %>"
                               SelectCommand="SELECT * FROM NewQueue WHERE (NewQueue.Type = 'Export') AND (NewQueue.Status = 'SECURITY' OR NewQueue.Status = 'UNAVAILABLE-SECURITY' OR NewQueue.Status = 'NO TRUCK-SECURITY') AND (NewQueue.Archived IS NULL) AND (NewQueue.Finished IS NULL) AND (NewQueue.Withdrawal IS NULL OR NewQueue.Withdrawal = 'False') AND (NewQueue.SetDate = @TheDate) ORDER BY NewQueue.Queue_No"
                               UpdateCommand="UPDATE NewQueue SET Shipper = @Shipper, Registration = @Registration, LO_NO = @LO_NO, Quantity = @Quantity, Product = @Product, Status = @Status WHERE QueueID = @QueueID">
                <UpdateParameters>
                    <asp:Parameter Name="Shipper"/>
                    <asp:Parameter Name="Registration"/>
                    <asp:Parameter Name="LO_NO"/>
                    <asp:Parameter Name="Quantity"/>
                    <asp:Parameter Name="Product"/>
                    <asp:Parameter Name="Status"/>
                    <asp:Parameter Name="QueueID"/>
                </UpdateParameters>
                <SelectParameters>
                    <asp:Parameter Name="TheDate" Type="DateTime"/>
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LoginContent" Runat="Server">
</asp:Content>