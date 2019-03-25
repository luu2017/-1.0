using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SearchBook1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] == null)

                Response.Redirect("Register.aspx");

            if (!IsPostBack)

            {

                GridBind();

            }

        }

    }


    private void GridBind()
    {
        SqlConnection conn = db.CreateConnection();
        

        int panduan = 0;


        //判断图书类型

        switch (Session["SearchSort"].ToString())
        {
            case "艺术":
                panduan = 1;

                break;

            case "少儿":
                panduan = 2;

                break;

            case "文学":

                panduan = 3;
                break;

            case "计算机科学":

                panduan = 4;
                break;

            case "教育辅导":

                panduan = 5;
                break;


        }



        SqlDataAdapter da = new SqlDataAdapter("select * from BookInfo where BookSort like '%" + panduan + "%' ", conn);

        DataSet ds = new DataSet();
        da.Fill(ds);
        DataView dv = ds.Tables[0].DefaultView;



       


        GridView1.DataSource = dv;
        GridView1.DataBind();

        

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "xiangqing")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            DataKey key = GridView1.DataKeys[index];
            string BookID = GridView1.DataKeys[index].Values[0].ToString().Trim();
            Session["BookID"] = BookID;
            Response.Redirect("BookShow.aspx");
        }
    }

    // --------------导航栏内容-------------------------


    protected void Button4_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Manaagement.aspx");
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ShopCard.aspx");
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("UserManagement.aspx");
    }



    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        if (SearchTb.Text == "")
        {
            Response.Write("<script>alert('请输入查找内容')</script>");
        }
        else
        {
            Session["SearchBookType"] = SearchDdb.SelectedItem.Text;  //搜索类型
            Session["SearchKey"] = SearchTb.Text;
            Response.Redirect("SearchBook.aspx");

        }
    }

}