<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changxiao.aspx.cs" Inherits="changxiao" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
          <div>

            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="BookID" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="BookID" HeaderText="图书编号" SortExpression="BookID" />
                    <asp:BoundField DataField="BookName" HeaderText="图书名" SortExpression="BookName" />
                    <asp:BoundField DataField="BookPeople" HeaderText="图书作者" SortExpression="BookPeople" />
                    <asp:BoundField DataField="BookPrice" HeaderText="图书价格" SortExpression="BookPrice" />
                    <asp:ButtonField ButtonType="Button" HeaderText="详情" Text="按钮" CommandName="chakan" />
                </Columns>
            </asp:GridView>

              </div>

    </form>
</body>
</html>
