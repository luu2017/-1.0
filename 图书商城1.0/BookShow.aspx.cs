using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;






public partial class BookShow : System.Web.UI.Page
{

    int shuliang = 0;


    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            zhanshi();
        }
        
       
    }

 

    protected void zhanshi()
    {

        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "server=DESKTOP-NTTLANH;database=SQL;uid=qinrui;pwd=980503";
        string sql = "select * from BookInfo where BookID like '%" + Session["BookID"].ToString() + "%'";

        conn.Open();

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        while(dr.Read())
        {
            Label1.Text = dr["BookPeople"].ToString();
            Label2.Text = dr["BookID"].ToString();
            Label3.Text = dr["BookAdress"].ToString();
            Label4.Text = dr["BookDate"].ToString();
            Label5.Text = dr["BookPrice"].ToString();
            Label6.Text = dr["BookName"].ToString();
            TextBox1.Text = dr["BookSay"].ToString();
            Image1.ImageUrl= dr["BookPhoto"].ToString().Trim();
            Label7.Text = dr["Bookinventory"].ToString().Trim();

        }

         

        conn.Close();

    }


    //protected void zhanshi1()
    //{
    //    SqlConnection conn = new SqlConnection();
    //    conn.ConnectionString = "server=DESKTOP-BJ7KCJI\\QINRUI;database=SQL;uid=qinrui;pwd=980503";
    //    string sql = "select * from BookInfo where BookID like '%" + Session["BookID1"].ToString() + "%'";

    //    conn.Open();

    //    SqlCommand cmd = new SqlCommand(sql, conn);
    //    SqlDataReader dr = cmd.ExecuteReader();
    //    while (dr.Read())
    //    {
    //        Label1.Text = dr["BookPeople"].ToString();
    //        Label2.Text = dr["BookID"].ToString();
    //        Label3.Text = dr["BookAdress"].ToString();
    //        Label4.Text = dr["BookDate"].ToString();
    //        Label5.Text = dr["BookPrice"].ToString();
    //        Label6.Text = dr["BookName"].ToString();
    //        TextBox1.Text = dr["BookSay"].ToString();
    //        Image1.ImageUrl = dr["BookPhoto"].ToString().Trim();

    //    }
    //    conn.Close();
    //}


    protected void Button1_Click(object sender, EventArgs e)
    {
        buy();
    }


    // 简单购买,将购买信息写入订单库

   public void buy()
    {
     

        if ((int.Parse(Label7.Text) - int.Parse(TextBox2.Text)) > 0)
        {

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "server=DESKTOP-NTTLANH;database=SQL;uid=qinrui;pwd=980503";
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "insert into BookOrder(OrderID,BookName,BookID,BookPrice,DateTime,BookNum,UserName) values (@OrderID,@BookName,@BookID,@BookPrice,@DateTime,@BookNum,@UserName)";
            cmd.Parameters.Add(new SqlParameter("@OrderID", GetRandom()));
            cmd.Parameters.Add(new SqlParameter("@BookName", Label6.Text));
            cmd.Parameters.Add(new SqlParameter("@BookID", Session["BookID"].ToString()));
            cmd.Parameters.Add(new SqlParameter("@BookPrice", Label5.Text));
            cmd.Parameters.Add(new SqlParameter("@DateTime", DateTime.Now));
            cmd.Parameters.Add(new SqlParameter("@BookNum", int.Parse(TextBox2.Text)));
            cmd.Parameters.Add(new SqlParameter("@UserName", Session["UserName"].ToString().Trim()));

            cmd.ExecuteNonQuery();

            // 更新库存
            SqlCommand cmm = new SqlCommand();
            cmm.Connection = conn;
            cmm.CommandText = "update BookInfo set Bookinventory = @Bookinventory where BookID = '%" + Session["BookID"].ToString() + "%' ";
            cmm.Parameters.Add(new SqlParameter("@Bookinventory", (int.Parse(Label7.Text) - int.Parse(TextBox2.Text))));
            cmm.ExecuteNonQuery();


            conn.Close();
            Response.Write("<script>alert('购买成功!!')</script>");




            UpdateKucun();



            zhanshi();

        }
        else
        {
            Response.Write("<script>alert('库存不足!!')</script>");
        }
            

        

    }


    public void UpdateKucun()
    {
        int m = int.Parse(Label7.Text) - int.Parse(TextBox2.Text);

        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "server=DESKTOP-NTTLANH;database=SQL;uid=qinrui;pwd=980503";
        conn.Open();
        SqlCommand cmm = new SqlCommand();
        cmm.Connection = conn;
        
        cmm.CommandText = "UPDATE BookInfo SET Bookinventory = @Bookinventory  where BookID like '%" + Session["BookID"].ToString() + "%' ";
        cmm.Parameters.Add(new SqlParameter("@Bookinventory", m));
        cmm.ExecuteNonQuery();


        conn.Close();


    }



    // ----------------------------随机生成订单号-----------------------

    public static object _lock = new object();
    public static int count = 1;

    protected string GetRandom()
    {



        //lock 关键字可以用来确保代码块完成运行，而不会被其他线程中断

        lock (_lock)
        {
            Random ran = new Random();
            return "U" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + ran.Next(1000, 9999).ToString();
        }
    }



    // 将数据插入购物车

    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["BookID"] = Label2.Text;
        Session["BookName"] = Label6.Text;
        Session["BookPrice"] = int.Parse(Label5.Text);
        Session["BookNum"] = int.Parse(TextBox2.Text);


        SqlConnection conn = db.CreateConnection();
        
        conn.Open();
        
        // 插入数据

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "insert into ShopCard (BookID,BookName,BookPrice,UserName,BookNum) values (@BookID,@BookName,@BookPrice,@UserName,@BookNum)";
        cmd.Parameters.Add(new SqlParameter("@BookID",Label2.Text));
        cmd.Parameters.Add(new SqlParameter("@BookName", Label6.Text));
       
        cmd.Parameters.Add(new SqlParameter("@BookPrice", int.Parse( Label5.Text)));
       
        cmd.Parameters.Add(new SqlParameter("@UserName", Session["UserName"].ToString().Trim()));
        cmd.Parameters.Add(new SqlParameter("@BookNum", int.Parse(TextBox2.Text)));

        cmd.ExecuteNonQuery();

        
       



        conn.Close();





        Response.Redirect("ShopCard.aspx");
    }


    //-------运用ajax实现无显示刷新的数据更新------

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string m = TextBox2.Text.ToString();
        int n = int.Parse(m);
        if ( n > 1)
        {
            n = n - 1;
            TextBox2.Text = n.ToString();
        }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string m = TextBox2.Text.ToString();
        int n = int.Parse(m);
        if (n >= 0)
        {
            n = n + 1;
            TextBox2.Text = n.ToString();
        }
    }




    //---------------------------导航栏内容-----------------------------------


    protected void Button4_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Manaagement.aspx");
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ShopCard.aspx");
    }

    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
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