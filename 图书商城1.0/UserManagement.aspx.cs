using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class UserManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            GridBind2();
            GridBind3();
        }

      
    }
    private void GridBind2()
    {
        SqlConnection conn = db.CreateConnection();
        
        SqlDataAdapter da = new SqlDataAdapter("select * from UserInfo where UserName like '%" + Session["UserName"].ToString() + "%'", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataView dv = ds.Tables[0].DefaultView;



        //默认排序方式
        if (ViewState["sortExpression"] != null)
            dv.Sort = ViewState["sortExpression"] + " " + ViewState["sortDirection"];


        GridView1.DataSource = dv;
        GridView1.DataBind();

    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridBind2();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridBind2();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection conn = db.CreateConnection();
        
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "delete from UserInfo where UserName=@oldstuid";
        cmd.Parameters.Add(new SqlParameter("@oldstuid", GridView1.DataKeys[e.RowIndex].Value.ToString()));

        cmd.ExecuteNonQuery();
        conn.Close();

        GridBind2();
    }



    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;

        GridBind2();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {



        SqlConnection conn = db.CreateConnection();
       
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "update UserInfo set  (UserName,Name,Password,Email,Address,DateTime) values (@UserName,@Name,@Password,@Email,@Address,@DateTime)";
        cmd.Parameters.Add(new SqlParameter("@UserName", ((TextBox)(GridView1.Rows[e.RowIndex].Cells[0].Controls[0])).Text));
        cmd.Parameters.Add(new SqlParameter("@Password", ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text));
        cmd.Parameters.Add(new SqlParameter("@Name", ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text));
        cmd.Parameters.Add(new SqlParameter("@Email", ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text));
        cmd.Parameters.Add(new SqlParameter("@Address", ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text));
        cmd.Parameters.Add(new SqlParameter("@DateTime", ((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0])).Text));
        cmd.ExecuteNonQuery();
        conn.Close();
        GridView1.EditIndex = -1;

        GridBind2();
    }

    protected void GridView1_Sorting1(object sender, GridViewSortEventArgs e)
    {
        if (ViewState["sortExpression"] != null)
        {
            if (ViewState["sortExpression"].ToString() == e.SortExpression)
            {
                if (ViewState["sortDirection"].ToString() == "asc")
                {
                    ViewState["sortDirection"] = "desc";
                }
                else
                {
                    ViewState["sortDirection"] = "asc";
                }
            }
            else
            {
                ViewState["sortExpression"] = e.SortExpression;
                ViewState["sortDirection"] = "asc";
            }
        }
        else
        {
            ViewState["sortExpression"] = e.SortExpression;
            ViewState["sortDirection"] = "asc";
        }
        GridBind2();
    }



    //  -----------------订单管理---------------
    private void GridBind3()
    {
        SqlConnection conn = db.CreateConnection();
        
        SqlDataAdapter da = new SqlDataAdapter("select * from BookOrder where UserName like '%" + Session["UserName"].ToString() + "%' ", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataView dv = ds.Tables[0].DefaultView;



        //默认排序方式
        if (ViewState["sortExpression"] != null)
            dv.Sort = ViewState["sortExpression"] + " " + ViewState["sortDirection"];


        GridView3.DataSource = dv;
        GridView3.DataBind();

    }

























    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView3.PageIndex = e.NewPageIndex;
        GridBind3();
    }

    protected void GridView3_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView3.EditIndex = -1;
        GridBind3();
    }





    protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection conn = db.CreateConnection();
        
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "delete from BookOrder where OrdrerID=@oldstuid";
        cmd.Parameters.Add(new SqlParameter("@oldstuid", GridView1.DataKeys[e.RowIndex].Value.ToString()));

        cmd.ExecuteNonQuery();
        conn.Close();

        GridBind3();
    }

    protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView3.EditIndex = e.NewEditIndex;

        GridBind3();
    }

    protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void GridView3_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (ViewState["sortExpression"] != null)
        {
            if (ViewState["sortExpression"].ToString() == e.SortExpression)
            {
                if (ViewState["sortDirection"].ToString() == "asc")
                {
                    ViewState["sortDirection"] = "desc";
                }
                else
                {
                    ViewState["sortDirection"] = "asc";
                }
            }
            else
            {
                ViewState["sortExpression"] = e.SortExpression;
                ViewState["sortDirection"] = "asc";
            }
        }
        else
        {
            ViewState["sortExpression"] = e.SortExpression;
            ViewState["sortDirection"] = "asc";
        }
        GridBind3();
    }

}