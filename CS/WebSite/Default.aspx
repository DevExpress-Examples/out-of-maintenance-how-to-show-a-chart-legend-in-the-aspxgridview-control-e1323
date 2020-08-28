<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.XtraCharts.v15.2.Web, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;</div>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT CategoryName, [Sales Person], SUM(UnitPrice * Quantity) AS Expr1 FROM SalesPerson GROUP BY CategoryName, [Sales Person]">
        </asp:AccessDataSource>
        &nbsp;
        <table style="width: 647px">
            <tr>
                <td style="width: 19px">
                </td>
                <td style="width: 514px">
        <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" DataSourceID="AccessDataSource1"
             Height="444px" SeriesDataMember="Sales Person" Width="797px" CrosshairEnabled="True">
            <SeriesTemplate ArgumentDataMember="CategoryName" 
                 
                ValueDataMembersSerializable="Expr1">
                <ViewSerializable>
<cc1:StackedBarSeriesView>
                </cc1:StackedBarSeriesView>
</ViewSerializable>
                <LabelSerializable>
<cc1:StackedBarSeriesLabel>
                </cc1:StackedBarSeriesLabel>
</LabelSerializable>
            </SeriesTemplate>
            <DiagramSerializable>
<cc1:XYDiagram>
                <axisx visibleinpanesserializable="-1">
</axisx>
                <axisy visibleinpanesserializable="-1">
</axisy>
            </cc1:XYDiagram>
</DiagramSerializable>
            <FillStyle >
                <OptionsSerializable>
<cc1:SolidFillOptions/>
</OptionsSerializable>
            </FillStyle>
            <Legend AlignmentHorizontal="Center" Direction="RightToLeft" 
                EquallySpacedItems="False"
                visibility="False">
<Padding Top="0" Bottom="0"></Padding>
            </Legend>
        </dxchartsui:WebChartControl>
                </td>
                <td style="width: 100px">
        <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
             OnHtmlRowPrepared="ASPxGridView1_HtmlRowPrepared">
            <Columns>
                <dxwgv:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="0">
                    <Settings AllowSort="False" />
                </dxwgv:GridViewDataTextColumn>
            </Columns>
        </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
    </form>
</body>
</html>
