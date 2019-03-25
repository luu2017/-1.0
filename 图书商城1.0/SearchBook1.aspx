<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchBook1.aspx.cs" Inherits="SearchBook1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="BookID" OnRowCommand="GridView1_RowCommand" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:ImageField DataImageUrlField="BookPhoto" HeaderText="图片">
                        <ControlStyle Height="100px" Width="60px" />
                        <ItemStyle Height="140px" Width="80px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="BookID" HeaderText="图书编号" SortExpression="BookID" />
                    <asp:BoundField DataField="BookName" HeaderText="图书名" SortExpression="BookName" />
                    <asp:BoundField DataField="BookPeople" HeaderText="图书作者" SortExpression="BookPeople" />
                    <asp:BoundField DataField="BookPrice" HeaderText="图书价格" SortExpression="BookPrice" />
                    <asp:ButtonField ButtonType="Image" HeaderText="详情" Text="按钮" CommandName="xiangqing" ImageUrl="~/tupian/icon_addresslist.png" >
                    <ItemStyle Height="70px" Width="70px" />
                    </asp:ButtonField>
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle Height="70px" Width="100px" BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>

        </div>
    </form>
</body>
</html>
