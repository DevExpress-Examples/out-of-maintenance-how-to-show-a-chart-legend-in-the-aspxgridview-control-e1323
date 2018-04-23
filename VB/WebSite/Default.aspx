<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.XtraCharts.v9.3.Web, Version=9.3.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v9.3, Version=9.3.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

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
			DiagramTypeName="XYDiagram" Height="444px" SeriesDataMember="Sales Person" Width="797px">
			<SeriesTemplate ArgumentDataMember="CategoryName" LabelTypeName="StackedBarSeriesLabel"
				PointOptionsTypeName="PointOptions" SeriesViewTypeName="StackedBarSeriesView"
				ValueDataMembersSerializable="Expr1">
				<View HiddenSerializableString="to be serialized">
				</View>
				<Label HiddenSerializableString="to be serialized">
				</Label>
				<PointOptions HiddenSerializableString="to be serialized">
				</PointOptions>
				<LegendPointOptions HiddenSerializableString="to be serialized">
				</LegendPointOptions>
			</SeriesTemplate>
			<Diagram>
				<axisx visibleinpanesserializable="-1">
<Range SideMarginsEnabled="True"></Range>
</axisx>
				<axisy visibleinpanesserializable="-1">
<Range SideMarginsEnabled="True"></Range>
</axisy>
			</Diagram>
			<FillStyle FillOptionsTypeName="SolidFillOptions">
				<Options HiddenSerializableString="to be serialized" />
			</FillStyle>
			<Legend AlignmentHorizontal="Center" Direction="RightToLeft" EquallySpacedItems="False" SpacingVertical="0" Visible="False">
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