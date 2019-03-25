using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Text;


public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }


    public static string GetMd5_32byte(string str)
    {
        string pwd = string.Empty;

        //实例化一个md5对像
        MD5 md5 = MD5.Create();

        // 加密后是一个字节类型的数组，这里要注意编码UTF8/Unicode等的选择　
        byte[] s = md5.ComputeHash(Encoding.UTF8.GetBytes(str));

        // 通过使用循环，将字节类型的数组转换为字符串，此字符串是常规字符格式化所得
        for (int i = 0; i < s.Length; i++)
        {
            // 将得到的字符串使用十六进制类型格式。格式后的字符是小写的字母，如果使用大写（X）则格式后的字符是大写字符 
            pwd = pwd + s[i].ToString("X");
        }

        return pwd;
    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        // 数据库链接
        SqlConnection conn = db.CreateConnection();
        
        SqlDataAdapter da = new SqlDataAdapter("select * from UserInfo where UserName='" + TextBox1.Text.Trim() + "'", conn);
        DataSet ds = new DataSet();

        da.Fill(ds);


        //判断用户是否存在

        if (ds.Tables[0].Rows.Count == 0)
        {
            Response.Write("<script>alert('无此用户名!')</script>");
        }

        //验证密码

        else
        {
            if (ds.Tables[0].Rows[0]["Password"].ToString() == GetMd5_32byte( TextBox2.Text.Trim()))
            {
                Response.Write("<script>alert('登录成功!')</script>");
                Session["UserName"] = ds.Tables[0].Rows[0]["UserName"].ToString();
                Session["UserRole"] = ds.Tables[0].Rows[0]["UserRole"].ToString();
                Response.Redirect("index.aspx");
            }
            else
            {
                Response.Write("<script>alert('密码错误!')</script>");
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("register1.aspx");
    }
}