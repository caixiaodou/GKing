//验证用户输入的JavaScript文件
function checkLinkManName(userName)
{
    if(userName!=null)
    {
        var spnError=document.getElementById('spnNameError');
        var spnRight=document.getElementById('spnNameRight');
	    if(userName=="")
        {	
		    showControl(spnError);
		    hideControl(spnError);
		    spnError.innerHTML+="<b>用户名不得为空</b>";
        }
        else
        {
		    hideControl(spnError);
		    showControl(spnRight);	
        }
    }
    else
    {
        return;
    }
}

function checkPhone(phone)
{
	if(phone!=null)
	{
	    var spnError=document.getElementById('spnPhoneError');
        var spnRight=document.getElementById('spnPhoneRight');
	    var reg=/[0]{1}[2-9]{2,3}[\-]?[2-9][0-9]{6,7}/;
	    if(!reg.test(phone))
	    {
		    showControl(spnError);
		    hideControl(spnError);
		    spnError.innerHTML+="<b>电话号码格式不符</b>";
	    } 
	    else
        {
		    hideControl(spnError);
		    showControl(spnRight);	
        }
	}
	  else
    {
        return;
    }
}

function checkHandPhone(handPhone)
{
	if(handPhone!=null)
	{
	    var spnError=document.getElementById('spnHandPhoneError');
        var spnRight=document.getElementById('spnHandPhoneRight');
	    var reg=/[1]{1}[35]{1}[0-9]{1}[0-9]{8}/;
	    if(!reg.test(handPhone))
	    {
		    showControl(spnError);
		    hideControl(spnError);
		    spnError.innerHTML+="<b>手机号码格式不符</b>";
	    } 
	    else
        {
		    hideControl(spnError);
		    showControl(spnRight);	
        }
	}
	  else
    {
        return;
    }
}

function checkEmail(email)
{
	if(email!=null)
	{
	    var spnError=document.getElementById('spnEmailError');
        var spnRight=document.getElementById('spnEmailRight');
	    var reg=/^(?:\w+\.?)*\w+@(?:\w+\.?)*\w+$/;
	    if(!reg.test(handPhone))
	    {
		    showControl(spnError);
		    hideControl(spnError);
		    spnError.innerHTML+="<b>邮件格式不符</b>";
	    } 
	    else
        {
		    hideControl(spnError);
		    showControl(spnRight);	
        }
	}
	  else
    {
        return;
    }
}

function checkQQ(qq)
{
	if(qq!=null)
	{
	    var spnError=document.getElementById('spnQQError');
        var spnRight=document.getElementById('spnQQRight');
	    var reg=/[1-9]{4,10}/;
	    if(reg.test(qq))
	    {
		    showControl(spnError);
		    hideControl(spnError);
		    spnError.innerHTML+="<b>QQ号码必须为数字</b>";
	    }
	    else
	    {
		    hideControl(spnError);
		    showControl(spnRight);	
	    }
	}
	  else
    {
        return;
    }
}

function showControl(control)
{
    if(control.style.display=="none")
    {
        control.style.display="block";
    }
}

function hideControl(control)
{
    if(control.style.display=="block")
    {
        control.style.display="none";
    }
}

