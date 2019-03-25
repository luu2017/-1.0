using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class changxiao : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Gridbind();
        }
       
    }
    protected void Gridbind()
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "server=DESKTOP-BJ7KCJI\\QINRUI;database=SQL;uid=qinrui;pwd=980503";

        SqlDataAdapter da = new SqlDataAdapter("select * from BookInfo where BookCX = 1 ", conn);


        DataSet ds = new DataSet();
        da.Fill(ds);
        DataView dv = ds.Tables[0].DefaultView;



        //默认排序方式
        if (ViewState["sortExpression"] != null)
            dv.Sort = ViewState["sortExpression"] + " " + ViewState["sortDirection"];


        GridView1.DataSource = dv;
        GridView1.DataBind();
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "chakan")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            DataKey key = GridView1.DataKeys[index];
            string BookID = GridView1.DataKeys[index].Values[0].ToString().Trim();
            Session["BookID"] = BookID;
            Response.Redirect("BookShow.aspx");
        }
    }
}