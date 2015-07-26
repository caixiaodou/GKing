<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <style type="text/css">
    div
    {
        font-size:10pt;
        font-family:宋体;
        color:#124075;  
    }
    table
    {
        font-size:10pt;
        font-family:宋体;
        color:#124075;  
    }
    </style>
    <script type="text/javascript" language=javascript src="JavaScript/Register.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-image: url(skins/RegistFormBG.jpg);width:375px;height:362px; left: 0px; position: absolute; top: 0px;">
    <div style="left: 355px; position: absolute; top: 0px;cursor:pointer">
        <img src="skins/Close.gif" id="IMG1"  />
    </div>
    <div style="width:93px;height:311px; background-image: url(skins/RegistForm.jpg); left: 10px; position: absolute; top: 20px;cursor:pointer">
    </div>
    <div style="width:254px;height:28px; left: 112px; position: absolute; top: 24px;" id="DIV1">
        <table width=100% id="TABLE1">
                <caption>详细资料</caption> 
                <tr width=100% align=center valign=top>
                    <td width="28%">
                        昵称
                    </td>
                    <td width="60%">
                        <asp:TextBox ID="txtNickName" runat="server" Width="100%" BorderColor="#C0C0FF" BorderWidth="1px" ForeColor="Blue"></asp:TextBox>
                    </td>
                     <td width="12%">
                       <asp:RequiredFieldValidator runat=server ID="rfvNickName" ControlToValidate="txtNickName" ErrorMessage="用户名必须输入">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               <tr width=100% align=center valign=top>
                    <td width="28%">
                        年龄
                    </td>
                    <td width="60%">
                        <asp:TextBox ID="txtAge" runat="server" Width="100%" BorderColor="#C0C0FF" BorderWidth="1px" ForeColor="Blue"  ></asp:TextBox>
                    </td>
                     <td width="12%">
                        <asp:CompareValidator runat=server ID="cmpAge" ControlToValidate="txtAge" ErrorMessage="必须是数字" Operator="DataTypeCheck" Type="Integer">*</asp:CompareValidator>
                    </td>
                </tr>
               <tr width=100% align=center valign=top>
                    <td width="28%">
                        性别
                    </td>
                    <td colspan=2>
                        <asp:RadioButton runat=server ID="rdbMan" Checked=true  GroupName="sex" /><img src="skins/boy.gif" />男
                         <asp:RadioButton runat=server ID="rdbFMan"   GroupName="sex" /><img src="skins/girl.gif" />女 
                    </td>
                </tr>
               <tr width=100% align=center valign=top>
                    <td width="28%">
                        密码
                    </td>
                    <td width="60%">
                        <asp:TextBox ID="txtPwd" runat="server" Width="100%" BorderColor="#C0C0FF" BorderWidth="1px" ForeColor="Blue"></asp:TextBox>
                    </td>
                     <td width="12%">
                        <asp:RequiredFieldValidator runat=server ID="rfvPwd" ControlToValidate="txtNickName" ErrorMessage="密码">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
               <tr width=100% align=center valign=top>
                    <td width="28%" style="height: 33px">
                        重复密码
                    </td>
                    <td width="60%" style="height: 33px">
                        <asp:TextBox ID="txtSecPwd" runat="server" Width="100%" BorderColor="#C0C0FF" BorderWidth="1px" ForeColor="Blue"></asp:TextBox>
                    </td>
                     <td width="12%" style="height: 33px">
                       <asp:CompareValidator runat=server ID="cmpSecPwd" ControlToValidate="txtSecPwd" ErrorMessage="密码输入必须一致" ControlToCompare="txtPwd">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan=3 align=center style="font-size:8pt;font-family:宋体">
                        <input type=button onclick="chooseFace()" id="btnChooseFace" value="选择头像" />
                       <input type=hidden id="hidFaceId" runat="server" /> 
                    </td>
                </tr>    
            </table>
    </div>
    <div style="width:254px;height:66px; left: 111px; position: absolute; top: 253px;" id="Div10" >
                <table cellpadding=0 cellspacing=0 border=0 width=100%>
                    <tr>
                         <td width=28%  align=center>
                            真实姓名
                         </td>
                         <td width=72%>
                            <asp:TextBox ID="txtName" runat="server" Width="81%" BorderColor="#C0C0FF" BorderWidth="1px" ForeColor="Blue"></asp:TextBox>
                         </td>
                    </tr>
                   <tr>
                         <td width=28% align=center>
                            星座
                         </td>
                         <td width=72%>
                            <asp:DropDownList runat=server ID="ddlConstellation" Width="150px"></asp:DropDownList>
                         </td>
                    </tr>
                   <tr>
                         <td width=28% align=center>
                            血型
                         </td>
                         <td width=72%>
                            <asp:DropDownList runat=server ID="ddlBloodType" Width="149px"></asp:DropDownList>
                         </td>
                    </tr>
                    <tr align=center>
                        <td colspan=2>
                            <asp:ImageButton runat=server ID="btnRegister"   ImageUrl="skins/RegisterBtn.png" OnClick="btnRegister_Click" />
                            &nbsp; &nbsp; &nbsp; &nbsp;
                            <img  src="skins/Cancel.png" style="cursor:pointer" onclick="parent.divWebQQPanel.innerHTML=''"  />
                        </td> 
                    </tr>   
                </table>
            </div>
             <div style="width:200px;height:17px; left: 144px; position: absolute;top:343px;right:0px; background-color: #e7f2f8;" id="divLoginInfo" runat=server></div>    
        </div>
    </form>
</body>
</html>
