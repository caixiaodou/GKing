<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Register.ascx.cs" Inherits="Register" %>
<script language="javascript" type="text/javascript">
<!--


function IMG1_onclick() {

}

// -->
</script>

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
<div style="background-image: url(skins/RegistFormBG.jpg);width:375px;height:362px; left: 0px; position: absolute; top: 0px;">
    <div style="left: 355px; position: absolute; top: 0px;cursor:pointer">
        <img src="skins/Close.gif" id="IMG1" language="javascript" onclick="return IMG1_onclick()"  />
    </div>
    <div style="width:94;height:311px; background-image: url(skins/RegistForm.jpg); left: 10px; position: absolute; top: 20px;cursor:pointer">
    </div>
    <div style="width:254px;height:185px; left: 112px; position: absolute; top: 24px;" id="DIV1" language="javascript" onclick="return DIV1_onclick()">
        <table width=100% id="TABLE1" language="javascript" onclick="return TABLE1_onclick()">
                <caption>详细资料</caption> 
                <tr width=100% align=center valign=top>
                    <td width="28%">
                        昵称
                    </td>
                    <td width="60%">
                        <asp:TextBox ID="txtNickName" runat="server" Width="100%" BorderColor="#C0C0FF" BorderWidth="1px" ForeColor="Blue"></asp:TextBox>
                    </td>
                     <td width="12%">
                        <div id="spnNickNameError" style="display:none" ><img src="skins/Error.gif" /></div>
                        <div id="spnNickNameRight" style="display:none" ><img  src="skins/Right.gif"  /></div>
                    </td>
                </tr>
               <tr width=100% align=center valign=top>
                    <td width="28%">
                        年龄
                    </td>
                    <td width="60%">
                        <asp:TextBox ID="txtAge" runat="server" Width="100%" BorderColor="#C0C0FF" BorderWidth="1px" ForeColor="Blue"></asp:TextBox>
                    </td>
                     <td width="12%">
                        <div id="spnAgeError" style="display:none" ><img src="skins/Error.gif" /></div>
                        <div id="spnAgeRight" style="display:none" ><img  src="skins/Right.gif"  /></div>
                    </td>
                </tr>
               <tr width=100% align=center valign=top>
                    <td width="28%">
                        性别
                    </td>
                    <td colspan=2>
                        <input type=radio name="rdbSex" value="boy" checked="checked" /><img src="skins/boy.gif" />男
                         <input type=radio name="rdbSex" value="gril" /><img src="skins/girl.gif" />女 
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
                        <div id="spnPwdError" style="display:none" ><img src="skins/Error.gif" /></div>
                        <div id="spnPwdRight" style="display:none" ><img  src="skins/Right.gif"  /></div>
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
                        <div id="spnSecPwdError" style="display:none" ><img src="skins/Error.gif" /></div>
                        <div id="spnSecPwdRight" style="display:none" ><img  src="skins/Right.gif"  /></div>
                    </td>
                </tr>    
            </table>
            <div style="width:254px;height:66px; left: 0px; position: absolute; top: 221px;" id="Div10" language="javascript" onclick="return DIV1_onclick()">
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
                            <img  src="skins/RegisterBtn.png" style="cursor:pointer" />
                            &nbsp; &nbsp; &nbsp; &nbsp;
                            <img  src="skins/Cancel.png" style="cursor:pointer"  />
                        </td> 
                    </tr>   
                </table>
            </div>
    </div>
    
</div>