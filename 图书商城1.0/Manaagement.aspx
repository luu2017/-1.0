<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manaagement.aspx.cs" Inherits="Manaagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 306px;
        }
        .auto-style2 {
            width: 644px;
        }
        .auto-style3 {
            width: 78px;
        }
        .auto-style4 {
            width: 78px;
            height: 27px;
        }
        .auto-style5 {
            width: 306px;
            height: 27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>增加图书</h3>


          <table class="auto-style2">
                <tr>
                    <td class="auto-style3">图书号:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="图书号不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">图书名:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="图书名不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">出版社:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">价格:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox6" runat="server" Width="178px"></asp:TextBox>
                    </td>
                </tr>
               
              <tr>
                    <td class="auto-style3">日期:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style4">作者:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">简介:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </td>
                </tr>
               <tr>
                    <td class="auto-style3">图片:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                    </td>
                </tr>

              <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style1">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>

              <tr>
                    <td class="auto-style3">分类:</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Selected="True" Text="少儿" Value="1"></asp:ListItem>
                            <asp:ListItem Text="文学" Value="2"></asp:ListItem>
                            <asp:ListItem Text="计算机科学" Value="3"></asp:ListItem>
                            <asp:ListItem Text="艺术" Value="4"></asp:ListItem>
                            <asp:ListItem Text="教育辅导" Value="5"></asp:ListItem>

                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                         &nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" Width="98px" />
                    
                    </td>
                </tr>
            </table>

        </div>
          <hr />
         <div>
            <h3>管理图书</h3>
           <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowEditing="GridView2_RowEditing" PageSize="2" DataKeyNames="BookID" OnRowDeleting="GridView2_RowDeleting" OnRowUpdating="GridView2_RowUpdating" OnPageIndexChanging="GridView2_PageIndexChanging" OnSorting="GridView1_Sorting" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="BookID" DataTextField="BookID" HeaderText="图书号" SortExpression="BookID" />
                    <asp:BoundField DataField="BookName" HeaderText="图书名" SortExpression="BookName" />
                    <asp:BoundField DataField="BookAdress" HeaderText="出版社" SortExpression="BookAdress" />
                    <asp:BoundField DataField="BookPrice" HeaderText="价格" SortExpression="BookPrice" />
                    
                    
                    <asp:BoundField DataField="BookDate" HeaderText="日期" />
                    <asp:BoundField DataField="BookPeople" HeaderText="作者" />
                    <asp:BoundField DataField="BookSay" HeaderText="简介" />
                    <asp:BoundField DataField="BookPhoto" HeaderText="图片" />
                    <asp:BoundField DataField="BookSort" HeaderText="分类" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Columns>

                
                 <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />

                
                 <PagerSettings NextPageText="下一页" PreviousPageText="上一页" /> 
            
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            
            </asp:GridView>

        </div>
       <hr />
        <div>
            <h3>
                用户管理
            </h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataKeyNames="UserName" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSorting="GridView1_Sorting1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="用户名" SortExpression="UserName" />
                    <asp:BoundField DataField="Name" HeaderText="姓名" />
                    <asp:BoundField DataField="Password" HeaderText="密码" />
                    <asp:BoundField DataField="Email" HeaderText="邮箱" />
                    <asp:BoundField DataField="Address" HeaderText="地址" />
                    <asp:BoundField DataField="DateTime" HeaderText="时间" />
                    <asp:BoundField DataField="UserRole" HeaderText="用户权限" />


                    <asp:CommandField ShowEditButton="True" />
                     <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="删除"  OnClientClick="javascript:return confirm('真的要删除吗？');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>



                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerSettings PageButtonCount="2" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
        <hr />
        <div>
            <h3>订单管理</h3>

        </div>
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderID" PageSize="3" OnPageIndexChanging="GridView3_PageIndexChanging" OnRowCancelingEdit="GridView3_RowCancelingEdit" OnRowDeleting="GridView3_RowDeleting" OnRowEditing="GridView3_RowEditing" OnRowUpdating="GridView3_RowUpdating" OnSorting="GridView3_Sorting" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="BookName" HeaderText="图书名" />
                <asp:BoundField DataField="BookID" HeaderText="图书号" />
                <asp:BoundField DataField="BookPrice" HeaderText="图书价格" />
                <asp:BoundField DataField="UserName" HeaderText="用户名" />
                <asp:BoundField DataField="DateTime" HeaderText="时间" />
                <asp:BoundField DataField="BookNum" HeaderText="图书数量" />
                <asp:BoundField DataField="Address" HeaderText="地址" />


                <asp:CommandField ShowEditButton="True" />
                     <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="删除"  OnClientClick="javascript:return confirm('真的要删除吗？');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>


            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </form>
  
     
</body>
</html>
