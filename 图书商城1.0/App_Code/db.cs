using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// db 的摘要说明
/// </summary>
public class db
{
    public db()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public static SqlConnection CreateConnection()
    {
        SqlConnection conn = new SqlConnection("server=DESKTOP-NTTLANH;database=SQL;uid=qinrui;pwd=980503;");
        return conn;

    }

}