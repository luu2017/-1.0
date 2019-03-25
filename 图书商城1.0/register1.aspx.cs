using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;



public partial class register1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    //对密码进行加密
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



    //
    protected void Register_Click(object sender, EventArgs e)
    {
        string jiami = GetMd5_32byte(Password.Text.ToString().Trim());

        SqlConnection con = db.CreateConnection();
        con.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into UserInfo (UserName,Name,Password,Email,Address,DateTime) values (@UserName,@Name,@Password,@Email,@Address,@DateTime)";
        cmd.Parameters.Add(new SqlParameter("@UserName", UserName.Text));
        cmd.Parameters.Add(new SqlParameter("@Password",jiami));
        cmd.Parameters.Add(new SqlParameter("@Name", Name.Text));
        cmd.Parameters.Add(new SqlParameter("@Email", Email.Text));
        cmd.Parameters.Add(new SqlParameter("@Address", Address.Text));
        cmd.Parameters.Add(new SqlParameter("@DateTime", DateTime.Now));

        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('添加成功!!')</script>");

    }



    protected void Reset_Click(object sender, EventArgs e)
    {



    }
}