Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Drawing

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Public Property GridViewDataSource() As List(Of MyLegendItem)
		Get
			If Session("Legend") Is Nothing Then
				Session("Legend") = GridDataSource.GenerateLegendItems(WebChartControl1)
			End If
			Return CType(Session("Legend"), List(Of MyLegendItem))
		End Get
		Set(ByVal value As List(Of MyLegendItem))
			Session("Legend") = value
		End Set
	End Property

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		ASPxGridView1.DataSource = GridViewDataSource
		If (Not IsPostBack) Then
			ASPxGridView1.DataBind()
		End If
	End Sub

	Protected Sub ASPxGridView1_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs)
		e.Row.BackColor = CType(e.GetValue("ItemColor"), Color)
	End Sub
End Class
