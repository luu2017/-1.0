using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ShopCard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridBind();
        }

       
    }

    protected void GridBind()
    {
        SqlConnection conn = db.CreateConnection();
      
        SqlDataAdapter da = new SqlDataAdapter("select * from ShopCard where UserName like '%" + Session["UserName"].ToString() + "%' ", conn);


        DataSet ds = new DataSet();
        da.Fill(ds);
        DataView dv = ds.Tables[0].DefaultView;



     

        GridView1.DataSource = dv;
        GridView1.DataBind();

    }

    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            if (CheckBox2.Checked == true)
            {
                cbox.Checked = true;
            }
            else
            {
                cbox.Checked = false;
            }
        }

    }


    public static object _lock = new object();
    public static int count = 1;

    protected string GetRandom()
    {




        lock (_lock)
        {
            Random ran = new Random();
            return "U" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + ran.Next(1000, 9999).ToString();
        }
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
       

      
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            if (cbox.Checked == true)
            {
                SqlConnection conn = db.CreateConnection();
                
                conn.Open();



                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "insert into BookOrder(OrderID,BookName,BookID,BookPrice,DateTime,BookNum,UserName) values (@OrderID,@BookName,@BookID,@BookPrice,@DateTime,@BookNum,@UserName)";
                cmd.Parameters.Add(new SqlParameter("@OrderID", GetRandom()));
                cmd.Parameters.Add(new SqlParameter("@BookName", Session["BookName"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@BookID", Session["BookID"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@BookPrice", Session["BookPrice"]));
                cmd.Parameters.Add(new SqlParameter("@DateTime", DateTime.Now));
                cmd.Parameters.Add(new SqlParameter("@BookNum", Session["BookNum"]));
                cmd.Parameters.Add(new SqlParameter("@UserName", Session["UserName"].ToString().Trim()));


                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('购买成功!!')</script>");



            }
        }
       GridBind();

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
}