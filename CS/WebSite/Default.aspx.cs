using System;
using System.Collections.Generic;
using System.Drawing;

public partial class _Default: System.Web.UI.Page {

    public List<MyLegendItem> GridViewDataSource {
        get {
            if(Session["Legend"] == null)
                Session["Legend"] = GridDataSource.GenerateLegendItems(WebChartControl1);
            return (List<MyLegendItem>)Session["Legend"]; 
        }
        set {
            Session["Legend"] = value;
        }
    }    

    protected void Page_Load(object sender,EventArgs e) {
        ASPxGridView1.DataSource = GridViewDataSource;
        if(!IsPostBack)
            ASPxGridView1.DataBind();
    }

    protected void ASPxGridView1_HtmlRowPrepared(object sender,DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e) {
        e.Row.BackColor = (Color)e.GetValue("ItemColor"); 
    }
}
