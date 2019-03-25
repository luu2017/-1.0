using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Manaagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

            if (Session["UserName"] == null)
            {
                Response.Write("<script>alert('请登录!')</script>");
                Response.Redirect("Register.aspx");



            }
            else
            {
                if (Session["UserRole"].ToString() != "1")
                {
                    Response.Write("<script>alert('没有权限!!')</script>");

                    Response.Redirect("index.aspx");

                }
                else
                {


                    

                    GridBind();
                    GridBind2();
                    GridBind3();

                }
              

            }

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string filename = FileUpload1.PostedFile.FileName;
            string path = Server.MapPath("tupian") + "\\" + filename;
            FileUpload1.PostedFile.SaveAs(path);



            SqlConnection conn = db.CreateConnection();

            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "insert into BookInfo (BookID,BookName,BookAdress,BookPrice,BookDate,BookPeople,BookSay,BookPhoto,BookSort) values (@BookID,@BookName,@BookAdress,@BookPrice,@BookDate,@BookPeople,@BookSay,@BookPhoto,@BookSort)";
            cmd.Parameters.Add(new SqlParameter("@BookID", TextBox1.Text));
            cmd.Parameters.Add(new SqlParameter("@BookName", TextBox2.Text));
            cmd.Parameters.Add(new SqlParameter("@BookAdress", TextBox3.Text));
            cmd.Parameters.Add(new SqlParameter("@BookPrice", TextBox6.Text));
            cmd.Parameters.Add(new SqlParameter("@BookDate", TextBox7.Text));
            cmd.Parameters.Add(new SqlParameter("@BookPeople", TextBox4.Text));
            cmd.Parameters.Add(new SqlParameter("@BookSay", TextBox5.Text));




            cmd.Parameters.Add(new SqlParameter("@BookPhoto","~/tupian/" + filename));





            cmd.Parameters.Add(new SqlParameter("@BookSort", DropDownList1.SelectedValue.ToString()));



            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('添加成功!!')</script>");

            GridBind();
        }
    }


// ----------------------------------------------------图书管理部分--------------------------------------------------------------------------
  

    private void GridBind()
    {
        SqlConnection conn = db.CreateConnection();
        
        SqlDataAdapter da = new SqlDataAdapter("select * from BookInfo", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataView dv = ds.Tables[0].DefaultView;



        //默认排序方式
        if (ViewState["sortExpression"] != null)
            dv.Sort = ViewState["sortExpression"] + " " + ViewState["sortDirection"];


        GridView2.DataSource = dv;
        GridView2.DataBind();

    }

  
    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection conn = db.CreateConnection();
        
        conn.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "update BookInfo set BookID=@BookID,BookName=@BookName,BookAdress=@BookAdress,BookPrice=@BookPrice,BookDate=@BookDate,BookPeople = @BookPeople,BookSay = @BookSay,BookPhoto = @BookPhoto,BookSort  = @BookSort where BookID=@oldBookID";


        cmd.Parameters.Add(new SqlParameter("@BookID", ((TextBox)(GridView2.Rows[e.RowIndex].Cells[0].Controls[0])).Text));
        cmd.Parameters.Add(new SqlParameter("@BookName", ((TextBox)(GridView2.Rows[e.RowIndex].Cells[1].Controls[0])).Text));
        cmd.Parameters.Add(new SqlParameter("@BookAdress", ((TextBox)(GridView2.Rows[e.RowIndex].Cells[2].Controls[0])).Text));

        cmd.Parameters.Add(new SqlParameter("@BookPrice", ((TextBox)(GridView2.Rows[e.RowIndex].Cells[3].Controls[0])).Text));


        cmd.Parameters.Add(new SqlParameter("@BookDate", ((TextBox)(GridView2.Rows[e.RowIndex].Cells[4].Controls[0])).Text));
        cmd.Parameters.Add(new SqlParameter("@BookPeople", ((TextBox)(GridView2.Rows[e.RowIndex].Cells[5].Controls[0])).Text));

        cmd.Parameters.Add(new SqlParameter("@BookSay", ((TextBox)(GridView2.Rows[e.RowIndex].Cells[6].Controls[0])).Text));
        cmd.Parameters.Add(new SqlParameter("@BookPhoto", ((TextBox)(GridView2.Rows[e.RowIndex].Cells[7].Controls[0])).Text));
        cmd.Parameters.Add(new SqlParameter("@BookSort", ((TextBox)(GridView2.Rows[e.RowIndex].Cells[8].Controls[0])).Text));





        cmd.Parameters.Add(new SqlParameter("@oldBookID", GridView2.DataKeys[e.RowIndex].Value.ToString()));

        cmd.ExecuteNonQuery();
        conn.Close();
        GridView2.EditIndex = -1;


        GridBind();

    }

    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        GridBind();

    }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        SqlConnection conn = db.CreateConnection();
        
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "delete from BookInfo where BookID=@oldBookID";
        // cmd.Parameters.Add(new SqlParameter("@oldBookID", GridView2.DataKeys[e.RowIndex].Value.ToString()));
        cmd.Parameters.Add(new SqlParameter("@oldBookID", GridView2.DataKeys[e.RowIndex].Value.ToString().Trim()));


        cmd.ExecuteNonQuery();
        conn.Close();
        GridBind();
    }

    protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
      
            GridView2.EditIndex = -1;
            GridBind();
       
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
            GridView2.PageIndex = e.NewPageIndex;
            GridBind();
        
    }

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




    // ----------------------------------------------------用户管理部分--------------------------------------------------------------------------



    private void GridBind2()
    {
        SqlConnection conn = db.CreateConnection();
        
        SqlDataAdapter da = new SqlDataAdapter("select * from UserInfo", conn);
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


    //--------------------------订单管理部分---------------------------


    private void GridBind3()
    {
        SqlConnection conn = db.CreateConnection();
       
        SqlDataAdapter da = new SqlDataAdapter("select * from BookOrder", conn);
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
