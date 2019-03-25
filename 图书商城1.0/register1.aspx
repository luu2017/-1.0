<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register1.aspx.cs" Inherits="register1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 193px;
        }
        .auto-style4 {
            width: 48%;
        }
        .auto-style6 {
            width: 193px;
            height: 24px;
        }
        .auto-style9 {
            height: 6px;
        }
        .auto-style10 {
            width: 98px;
            height: 24px;
        }
        .auto-style11 {
            width: 98px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style4">
                <tr>
                    <td class="auto-style9" colspan="2">用户注册:</td>
                </tr>
                <tr>
                    <td class="auto-style10">登录名:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="登录名不为空" ControlToValidate="UserName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">密码:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="密码不为空" ControlToValidate="Password"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style10">确认密码:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="Psd" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="Psd" ErrorMessage="两次密码不一致"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">邮箱:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="邮箱不符合规范" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Email"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">姓名:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">地址:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="Address" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style6">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11">
                        <asp:Button ID="Register" runat="server" Text="注册" OnClick="Register_Click" />
                    </td>
                    <td class="auto-style2">
                        <asp:Button ID="Reset" runat="server" Text="重置" OnClick="Reset_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
