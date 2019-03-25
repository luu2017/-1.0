<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShopCard.aspx.cs" Inherits="ShopCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <%--// -----------------------------------顶部导航栏-----------------------------------%>

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
           
            
            
            <asp:ImageButton ID="ImageButton2" runat="server"  OnClientClick="Button2_Click" ImageUrl ="~/tupian/我的.png" OnClick="ImageButton2_Click"/>
          <%--  <asp:Button ID="Button2" runat="server" Text="我的账户" OnClick="Button2_Click" />--%>
&nbsp;&nbsp;



            <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="Button3_Click" ImageUrl="~/tupian/购买.png" OnClick="ImageButton1_Click" />
           <%-- <asp:Button ID="Button3" runat="server" Text="购物车" OnClick="Button3_Click" />--%>
            &nbsp;&nbsp;
            <asp:ImageButton ID="Button4" runat="server" OnClientClick="Button4_Click" Visible ="false"   ImageUrl ="~/tupian/档案.png" OnClick="Button4_Click1" />
           <%-- <asp:Button ID="Button4" runat="server" Text="管理" Visible ="false" OnClick="Button4_Click" />
        </div>--%>

<hr />


        <div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CartID">
                <Columns>
                    <asp:BoundField DataField="BookName" HeaderText="图书名" ReadOnly="True" />
                    <asp:BoundField DataField="BookPrice" HeaderText="价格" ReadOnly="True" />
                    <asp:BoundField DataField="BookNum" HeaderText="购买数量" />
                    <asp:BoundField DataField="BookID" HeaderText="图书号" />
                    <asp:BoundField DataField="CartID" HeaderText="购物号" />
                    <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                </Columns>
            </asp:GridView>
             <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged"
                        Text="全选" />
            <br />
            <asp:Button ID="Button2" runat="server" Font-Size="9pt" Text="购买" OnClick="Button2_Click" />
            <br />
        </div>
        

    </form>
</body>
</html>
