using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
          
            //判断用户是否登陆

            if (Session["UserName"] == null)
            {
                Response.Write("<script>alert('请登录!')</script>");
                Response.Redirect("Register.aspx");
                
            }
            else
            {
                //判断用户权限

                if (Session["UserRole"].ToString() == "1")
                {
                    Button4.Visible = true;


                }
                else
                {
                    //当用户没有管理员权限时不展示管理按钮

                    Button4.Visible = false;
                }
               
            }

        }

       
    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        if(SearchTb.Text == "")
        {
            Response.Write("<script>alert('请输入查找内容')</script>");
        }
        else
        {

            //对查找内容进行赋值

            Session["SearchBookType"] = SearchDdb.SelectedItem.Text;  //搜索类型
            Session["SearchKey"] = SearchTb.Text;
            Response.Redirect("SearchBook.aspx");

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["SearchSort"] = Button1.Text;
        Response.Redirect("SearchBook1.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Session["SearchSort"] = Button5.Text;
        Response.Redirect("SearchBook1.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Session["SearchSort"] = Button6.Text;
        Response.Redirect("SearchBook1.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Session["SearchSort"] = Button7.Text;
        Response.Redirect("SearchBook1.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Session["SearchSort"] = Button8.Text;
        Response.Redirect("SearchBook1.aspx");
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        Session["SearchSort"] = Button10.Text;
        Response.Redirect("SearchBook1.aspx");
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
}