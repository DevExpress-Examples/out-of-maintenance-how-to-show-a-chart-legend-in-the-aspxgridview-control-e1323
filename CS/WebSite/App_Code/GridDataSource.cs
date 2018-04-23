using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Collections.Generic;
using System.Web.SessionState;
using DevExpress.XtraCharts.Web;
using DevExpress.XtraCharts;

/// <summary>
/// Summary description for GridDataSource
/// </summary>
public class GridDataSource
{
    public static List<MyLegendItem> GenerateLegendItems(WebChartControl chart) {
        List<MyLegendItem> collection = new List<MyLegendItem>();
        Palette p = chart.PaletteRepository[chart.PaletteName];
        chart.DataBind();
        for(int i = 0;i < chart.Series.Count;i++) {
            MyLegendItem item = new MyLegendItem(chart.Series[i].Name,p[i % p.Count].Color);
            collection.Add(item);
        }
        return collection;
    }
}

public class MyLegendItem {
    string itemName;
    Color itemColor;
    public MyLegendItem(string name,Color color) {
        itemName = name;
        itemColor = color;
    }
    public Color ItemColor {
        get {
            return itemColor;
        }
        set {
            itemColor = value;
        }
    }
    public string ItemName {
        get {
            return itemName;
        }
        set {
            itemName = value;
        }
    }

}
