<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookShow.aspx.cs" Inherits="BookShow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 542px;
            height: 24px;
        }
        .auto-style3 {
            width: 83px;
            height: 24px;
        }
        .auto-style4 {
            width: 94%;
        }
        .auto-style5 {
            width: 83px;
            height: 23px;
        }
        .auto-style6 {
            width: 542px;
            height: 23px;
        }
        .auto-style7 {
            width: 168px;
            height: 247px;
        }
        .auto-style8 {
            width: 1138px;
            height: 75px;
            margin-left: 0px;
            margin-top: 0px;
        }
        .auto-style9 {
            width: 83px;
            height: 22px;
        }
        .auto-style10 {
            width: 542px;
            height: 22px;
        }
        .auto-style11 {
            width: 83px;
            height: 466px;
        }
        .auto-style12 {
            width: 542px;
            height: 466px;
        }
        .auto-style13 {
            margin-left: 10px;
        }
        .auto-style14 {
            margin-left: 412px;
        }
        .auto-style15 {
            margin-left: 0px;
            margin-right: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

         <%--    -----------------------------------顶部导航栏-----------------------------------%>

        <hr />
        <div  class="xia-nong" >
            <a href="index.aspx"><asp:Image ID="Image2" runat="server"  ImageUrl="~/tupian/logo.jpg" Height="100px" Width="100px" /></a>
            
           
             &nbsp;<asp:DropDownList ID="SearchDdb" runat="server">
                 <asp:ListItem Selected="True">书名</asp:ListItem>
                 <asp:ListItem>作者</asp:ListItem>
            </asp:DropDownList>
            &nbsp;
            <asp:TextBox ID="SearchTb" runat="server" CssClass="auto-style1" Height="32px" Width="483px"></asp:TextBox>
           
            
            <asp:ImageButton ID="SearchBtn" runat="server"  OnClick="SearchBtn_Click" CssClass="auto-style6" Height="40px" ImageUrl="~/tupian/icon_search.png" Width="40px" />
           <%-- <asp:Button ID="SearchBtn" runat="server" Text="搜索" OnClick="SearchBtn_Click" OnClientClick="SearchBtn_Click" /> onclientclick="SearchBtn_Click" --%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
            
            
            <asp:ImageButton ID="ImageButton3" runat="server"  OnClientClick="Button2_Click" ImageUrl ="~/tupian/我的.png" OnClick="ImageButton4_Click"/>
          <%--  <asp:Button ID="Button2" runat="server" Text="我的账户" OnClick="Button2_Click" />--%>
&nbsp;&nbsp;



            <asp:ImageButton ID="ImageButton4" runat="server" OnClientClick="Button3_Click" ImageUrl="~/tupian/购买.png" OnClick="ImageButton3_Click" />
           <%-- <asp:Button ID="Button3" runat="server" Text="购物车" OnClick="Button3_Click" />--%>
            &nbsp;&nbsp;
            <asp:ImageButton ID="Button4" runat="server" OnClientClick="Button4_Click" Visible ="false"   ImageUrl ="~/tupian/档案.png" OnClick="Button4_Click1" />
           <%-- <asp:Button ID="Button4" runat="server" Text="管理" Visible ="false" OnClick="Button4_Click" />
        </div>--%>

<hr />

        <div class="auto-style7">

            <asp:Image ID="Image1" runat="server" Height="249px" Width="156px" />
           

            <br />
            <br />
            <br />
           

        </div>
        <div class="auto-style8">
             <table class="auto-style4">
                <tr>
                    <td class="auto-style9">图书名:</td>
                    <td class="auto-style10">
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">作者:</td>
                    <td class="auto-style10">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">图书号:</td>
                    <td class="auto-style6">
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">出版社:</td>
                    <td class="auto-style6">
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">出版日期:</td>
                    <td class="auto-style6">
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">价格:</td>
                    <td class="auto-style6">
                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">图书信息:</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="TextBox1" runat="server" Height="457px" ReadOnly="True" Width="786px" CssClass="auto-style13" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                 
                <tr>
                   

                    <td class="auto-style3">库存:</td>
           
                     <td class="auto-style2">
                                  <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                </td>
                </tr>
                 
                <tr>
                   

                    <td class="auto-style3">选择数量:</td>
           
                     <td class="auto-style2">
                                  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>


                        &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" Height="45px" ImageUrl="~/tupian/you.png" OnClick="ImageButton1_Click" Width="70px" />
                         &nbsp;<asp:TextBox ID="TextBox2" runat="server" Width="59px" CssClass="auto-style15" Font-Bold="True" Font-Size="X-Large" ForeColor="#6666FF" Height="50px" ReadOnly="True">1</asp:TextBox>
                         <asp:ImageButton ID="ImageButton2" runat="server" Height="45px" ImageUrl="~/tupian/zuo.png" OnClick="ImageButton2_Click" Width="70px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="数量不能为空"></asp:RequiredFieldValidator>
                      </ContentTemplate>
          
        </asp:UpdatePanel>  
                </td>
                   <%-- <asp:Button ID="Button4" runat="server" Text="" />--%>
                </tr>
                 
                <tr>
                    <td class="auto-style3">我要购买:</td>
                    <td class="auto-style2">
                        <asp:Button ID="Button2" runat="server" Height="35px" Text="shopping cart " Width="167px" BackColor="#FF0066" BorderColor="Yellow" BorderStyle="Ridge" CssClass="auto-style14" Font-Bold="True" Font-Size="Large" ForeColor="#3333CC" OnClick="Button2_Click" />
                        <asp:Button ID="Button1" runat="server" Height="35px" Text="Buy" Width="167px" BackColor="#FF0066" BorderColor="Yellow" BorderStyle="Ridge" CssClass="auto-style14" Font-Bold="True" Font-Size="Large" ForeColor="#3333CC" OnClick="Button1_Click"  />
                    </td>
                </tr>
            </table>
        </div>


       
    </form>
</body>
</html>
