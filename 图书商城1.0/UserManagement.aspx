<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManagement.aspx.cs" Inherits="UserManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>用户信息管理</h3>
               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataKeyNames="UserName" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSorting="GridView1_Sorting1">
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="用户名" />
                    <asp:BoundField DataField="Name" HeaderText="姓名" />
                    <asp:BoundField DataField="Password" HeaderText="密码" />
                    <asp:BoundField DataField="Email" HeaderText="邮箱" />
                    <asp:BoundField DataField="Address" HeaderText="地址" />
                    <asp:BoundField DataField="DateTime" HeaderText="时间" />
                    <asp:BoundField DataField="Address" HeaderText="地址" />
                    


                    <asp:CommandField ShowEditButton="True" />
                     <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="删除"  OnClientClick="javascript:return confirm('真的要删除吗？');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>



                </Columns>
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="2" />
            </asp:GridView>

            <hr />
            <h3>
                订单管理
            </h3>
             <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderID" PageSize="3" OnPageIndexChanging="GridView3_PageIndexChanging" OnRowCancelingEdit="GridView3_RowCancelingEdit" OnRowDeleting="GridView3_RowDeleting" OnRowEditing="GridView3_RowEditing" OnRowUpdating="GridView3_RowUpdating" OnSorting="GridView3_Sorting">
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
            <PagerSettings Mode="NumericFirstLast" />
        </asp:GridView>
        </div>
    </form>
</body>
</html>
