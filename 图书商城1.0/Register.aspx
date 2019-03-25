<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">



<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title></title>

<meta name="description" content="particles.js is a lightweight JavaScript library for creating particles." />
<meta name="author" content="Vincent Garreau" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" media="screen" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/reset.css"/>




</head>
<body>
    <form id="form1" runat="server">
  <div id="particles-js">
		<div class="login">
			<div class="login-top">
				登录
			</div>
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="img/name.png"/></div>
				<div class="login-center-input">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
					<div class="login-center-input-text">用户名</div>
				</div>
			</div>
			<div class="login-center clearfix">
				<div class="login-center-img"><img src="img/password.png"/></div>
				<div class="login-center-input">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" ></asp:TextBox>
					<div class="login-center-input-text">密码</div>
				</div>
			</div>
			<div class="login-button">
				
			    <asp:Button ID="Button1" runat="server" Text="登陆" OnClick="Button1_Click" Width="217px" />
				
			</div>
            <div class="login-button">
				
			    <asp:Button ID="Button2" runat="server" Text="注册" OnClick="Button2_Click" Width="217px" />
				
			</div>
		</div>
		<div class="sk-rotating-plane"></div>
</div>

<!-- scripts -->
<script src="js/particles.min.js"></script>
<script src="js/app.js"></script>
<script type="text/javascript">
	function hasClass(elem, cls) {
	  cls = cls || '';
	  if (cls.replace(/\s/g, '').length == 0) return false; //当cls没有参数时，返回false
	  return new RegExp(' ' + cls + ' ').test(' ' + elem.className + ' ');
	}
	 
	function addClass(ele, cls) {
	  if (!hasClass(ele, cls)) {
	    ele.className = ele.className == '' ? cls : ele.className + ' ' + cls;
	  }
	}
	 
	function removeClass(ele, cls) {
	  if (hasClass(ele, cls)) {
	    var newClass = ' ' + ele.className.replace(/[\t\r\n]/g, '') + ' ';
	    while (newClass.indexOf(' ' + cls + ' ') >= 0) {
	      newClass = newClass.replace(' ' + cls + ' ', ' ');
	    }
	    ele.className = newClass.replace(/^\s+|\s+$/g, '');
	  }
	}
		
</script>



    </form>



</body>
</html>
