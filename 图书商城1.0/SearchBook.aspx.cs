using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SearchBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["UserName"] == null)

                Response.Redirect("Register.aspx");

            if (!IsPostBack)

            {

                GridBind();

            }

        }
       
    }


   

    // 对数据进行绑定

    private void GridBind()
    {
        SqlConnection conn = db.CreateConnection();
       
      
        //判断数据检索类型


        if(Session["SearchBookType"].ToString() == "书名")
        {
            
           
            SqlDataAdapter da = new SqlDataAdapter("select * from BookInfo where BookName like '%" + Session["SearchKey"].ToString() + "%' ", conn);


            DataSet ds = new DataSet();
            da.Fill(ds);
            DataView dv = ds.Tables[0].DefaultView;



            //默认排序方式
            if (ViewState["sortExpression"] != null)
                dv.Sort = ViewState["sortExpression"] + " " + ViewState["sortDirection"];


            GridView1.DataSource = dv;
            GridView1.DataBind();
        }
        if (Session["SearchBookType"].ToString() == "作者")
        {
            
            SqlDataAdapter da = new SqlDataAdapter("select * from BookInfo where BookPeople like '%" + Session["SearchKey"].ToString() + "%' ", conn);

            DataSet ds = new DataSet();
            da.Fill(ds);
            DataView dv = ds.Tables[0].DefaultView;



            //默认排序方式
            if (ViewState["sortExpression"] != null)
                dv.Sort = ViewState["sortExpression"] + " " + ViewState["sortDirection"];


            GridView1.DataSource = dv;
            GridView1.DataBind();
        }
        

        
       
       

       

        
       

    }










    //通过数据关键字索引所选部分

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




    //数据排序

    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
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
        GridBind();
    }


    // 数据索引

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridBind();
    }
}