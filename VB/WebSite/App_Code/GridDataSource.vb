Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Drawing
Imports System.Collections.Generic
Imports System.Web.SessionState
Imports DevExpress.XtraCharts.Web
Imports DevExpress.XtraCharts

''' <summary>
''' Summary description for GridDataSource
''' </summary>
Public Class GridDataSource
    Public Shared Function GenerateLegendItems(ByVal chart As WebChartControl) As List(Of MyLegendItem)
        Dim collection As New List(Of MyLegendItem)()
        Dim p As Palette = chart.PaletteRepository(chart.PaletteName)
        chart.DataBind()
        For i As Integer = 0 To chart.Series.Count - 1
            Dim item As New MyLegendItem(chart.Series(i).Name,p(i Mod p.Count).Color)
            collection.Add(item)
        Next i
        Return collection
    End Function
End Class

Public Class MyLegendItem

    Private itemName_Renamed As String

    Private itemColor_Renamed As Color
    Public Sub New(ByVal name As String, ByVal color As Color)
        itemName_Renamed = name
        itemColor_Renamed = color
    End Sub
    Public Property ItemColor() As Color
        Get
            Return itemColor_Renamed
        End Get
        Set(ByVal value As Color)
            itemColor_Renamed = value
        End Set
    End Property
    Public Property ItemName() As String
        Get
            Return itemName_Renamed
        End Get
        Set(ByVal value As String)
            itemName_Renamed = value
        End Set
    End Property

End Class
