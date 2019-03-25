<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8; width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
    <title></title>


  


   

    <style type="text/css">
        /*.xia-nong{
          
              background-size: 100% 100%;
    background-repeat: no-repeat;
    background-image: url(~/tupian/about-bg-1.jpg);
        }*/

        .xia-nong{
            background-image: url(~/tupian/logo.jpg);
             background-repeat: no-repeat;
             background-size: 100% 100%;

        }

        .auto-style1 {
            margin-top: 0px;
        }
        .auto-style4 {
            position: relative;
            left: 25px;
            top: -494px;
            width: 153px;
            height: 535px;
        }
        .auto-style5 {
            height: 500px;
            width: 1073px;
            margin-left: 300px;
        }



//----------------------------新添加------------------------

        

                * {
            margin: 0;
            padding: 0;
            text-decoration: none;
        }
        
        body {
            padding: 20px;
        }
        #container {
            position: relative;
            width: 600px;
            height: 400px;
            border: 1px solid #333;
            overflow: hidden;
        }
        
        #list {
            position: absolute;
            z-index: 1;
            width: 6600px;
            height: 400px;
        }
        
        #list img{
            float: left;
            width: 600px;
            height: 400px;
        }
        
        #buttons {
            position: absolute;
            left: 20px;
            bottom: 20px;
            z-index: 2;
            height: 10px;
            width: 140px;
        }
        
        #buttons span {
            float: left;
            margin-right: 5px;
            width: 10px;
            height: 10px;
            border: 1px solid #fff;
            border-radius: 50%;
            background: #333;
            cursor: pointer;
        }
        
        #buttons .on {
            background: orangered;
        }
        
        .arrow {
            position: absolute;
            top: 180px;
            z-index: 2;
            display: none;
            width: 40px;
            height: 40px;
            font-size: 24px;
            line-height: 39px;
            text-align: center;
            color: #fff;
            background-color: RGBA(0, 0, 0, .3);
            cursor: pointer;
        }
        
        .arrow:hover {
            background-color: RGBA(0, 0, 0, .7);
        }
        
        #container:hover .arrow {
            display: block;
        }
        
        #prev {
            left: 20px;
        }
        
        #next {
            right: 20px;
        }





        .auto-style6 {
            margin-right: 9px;
        }




































































        .auto-style7 {
            width: 644px;
            height: 413px;
        }



































































    </style>
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
        <div class="auto-style5">
            <div id="container">
            <!--图片-->
                
            <div id="list" style="left: -600px;">
             <a  href="changxiao.aspx">   <img   src="tupian/8.png" /></a>  
              <a  href="changxiao.aspx">  <img  src="tupian/1.png" class="auto-style7"  /></a>
              <a  href="changxiao.aspx">  <img src="tupian/2.png" /></a>
             <a  href="changxiao.aspx">   <img src="tupian/3.png" /></a>
             <a  href="changxiao.aspx">   <img src="tupian/4.png" /></a>
             <a  href="changxiao.aspx">   <img src="tupian/5.png" /></a>
             <a  href="changxiao.aspx">   <img src="tupian/6.png" /></a>
             <a  href="changxiao.aspx">   <img src="tupian/7.png" /></a>
              <a  href="changxiao.aspx">  <img src="tupian/8.png" />  </a>                    
             <a  href="changxiao.aspx">   <img src="tupian/1.png" /></a>
                
            

            </div>
            <!--圆点按钮-->
            <div id="buttons">
                <span index="1" class="on"></span>
                <span index="2"></span>
                <span index="3"></span>
                <span index="4"></span>
                <span index="5"></span>
                <span index="6"></span>
                <span index="7"></span>
                <span index="8"></span>
            </div>
            <!--左右切换按钮-->
            <a href="javascript:;" id="prev" class="arrow">&lt;</a>
            <a href="javascript:;" id="next" class="arrow">&gt;</a>
        </div>
      </div>
       
       
        
       
        
        </div>

        <div class="auto-style4" font-overline="True">
             <h2>图书分类</h2><hr />

            <asp:Button ID="Button5" runat="server" Text="少儿" Font-Italic="False" Font-Bold="True" Font-Overline="False" Font-Underline="True"  BorderStyle="Double" Width="117px" OnClick="Button5_Click" /> <hr />
            <asp:Button ID="Button6" runat="server" Text="文学" Font-Italic="False" Font-Bold="True" Font-Overline="False" Font-Underline="True"  BorderStyle="Double" Width="117px" OnClick="Button6_Click" /> <hr /><hr />
            <asp:Button ID="Button7" runat="server" Text="计算机科学" Font-Italic="False" Font-Bold="True" Font-Overline="False" Font-Underline="True" BorderStyle="Double" Width="117px" OnClick="Button7_Click" /> <hr /><hr />
            <asp:Button ID="Button8" runat="server" Text="社会学" Font-Italic="False" Font-Bold="True" Font-Overline="False" Font-Underline="True"  BorderStyle="Double" Width="117px" OnClick="Button8_Click" /> <hr /><hr />
            
            <asp:Button ID="Button10" runat="server" Text="教育辅导" Font-Italic="False" Font-Bold="True" Font-Overline="False" Font-Underline="True"  BorderStyle="Double" Width="117px" OnClick="Button10_Click" /> <hr /><hr />
             
            <asp:Button ID="Button1" runat="server" Text="艺术" Font-Italic="False" Font-Bold="True" Font-Overline="False" Font-Underline="True" OnClick="Button1_Click" BorderStyle="Double" Width="117px"  />
       
       
       
        </div>

       
        
       
        
    </form>


    
    
    
    
    
    
    <script>

        //定义需要的全局变量和获取需要使用的元素节点
var timer;
var index = 1;
var list = document.getElementById('list');
var prev = document.getElementById('prev');
var next = document.getElementById('next');
var container = document.getElementById('container');
var buttons = document.getElementById('buttons').getElementsByTagName('span');
 
 
window.onload = function() {
    
    function animate(offset) {
        //获取的是style.left，是相对左边获取距离，所以第一张图后style.left都为负值，
        //且style.left获取的是字符串，需要用parseInt()取整转化为数字。
        var newLeft = parseInt(list.style.left) + offset;
 
        if(newLeft < -4800) {
            list.style.left = -600 + 'px';
            index = 1;
        } else if(newLeft > -600) {
            list.style.left = -4800 + 'px';
            index = 8;
        } else {
            list.style.left = newLeft + 'px';
        }
        buttonsShow();
    }
    
    //左（上一张）切换按钮点击事件
    prev.onclick = function() {
        index -= 1;
        if (index < 1) {
            index = 8;
        }
        buttonsShow();
        animate(600);
    }
 
    //右（下一张）切换按钮点击事件
    next.onclick = function() {
        index += 1;
        if (index > 8) {
            index = 1;
        }
        buttonsShow();
        animate(-600);
        
    }
    
    //圆点切换图片
    for (var i = 0; i < buttons.length; i++) {
            buttons[i].onclick = function () {
                /* 偏移量获取：这里获得鼠标移动到小圆点的位置，用this把index绑定到对象buttons[i]上，去谷歌this的用法  */
                /* 由于这里的index是自定义属性，需要用到getAttribute()这个DOM2级方法，去获取自定义index的属性*/
                var clickIndex = parseInt(this.getAttribute('index'));
                var offset = 600 * (index - clickIndex);
                animate(offset); //存放鼠标点击后的位置，用于小圆点的正常显示 
                index = clickIndex;
                buttonsShow();
            }
    }
    
    play();
    container.onmouseover = stop;
    container.onmouseout = play;
    
}
 
//图片自动播放函数
function play() {
    timer = setInterval(function() {
        next.onclick()
    }, 1500)
}
 
//图片暂停播放函数
function stop() {
    clearInterval(timer);
}
 
//圆点按钮高亮状态切换函数
function buttonsShow() {
    //这里需要清除之前的样式
    for(var i = 0; i < buttons.length; i++) {
        if(buttons[i].className == 'on') {
            buttons[i].className = '';
        }
    }
    //数组从0开始，故index需要-1
    buttons[index - 1].className = 'on';
}
 
 
 




</script>


   
</body>
</html>
