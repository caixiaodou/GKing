/**
 * @author ∫È Øµ§
 */
var complexEvent=new Object();
var isIE=(document.all && document.uniqueID) ? true : false; 
complexEvent.addEventhandler=function(element,eventType,eventHandler)
{
	if(element.attachEvent)//≈–∂œ «∑Ò «IE‰Ø¿¿∆˜
	{
		element.attachEvent("on"+eventType,eventHandler);
	}
	else if(element.addEventListener)//≈–∂œ‰Ø¿¿∆˜ «∑Ò÷ß≥÷DOM±Í◊º  º¥Firefox
	{
		element.addEventListener(eventType,eventHandler,false);
	}
}

complexEvent.removeEventHandler=function(element,eventType,eventHandler)
{
	if(element.attachEvent)//≈–∂œ «∑Ò «IE‰Ø¿¿∆˜
	{
		element.detachEvent("on"+eventType,eventHandler);
	}
	else if(element.addEventListener)//≈–∂œ‰Ø¿¿∆˜ «∑Ò÷ß≥÷DOM±Í◊º  º¥Firefox
	{
		element.removeEventListener(eventType,eventHandler,false);
	}
}

complexEvent.formatEvent=function(eventObj)
{
	if(isIE)
	{
		eventObj.charCode=(eventObj.type=="keyPress") ? eventObj.keyCode : 0;
		eventObj.eventPhase=2;
		eventObj.isChar=(eventObj.type=="keyPress") ? true : false;
		eventObj.pageX=eventObj.clientX+document.body.scrollLeft;
		eventObj.pageY=eventObj.clientY+document.body.scrollTop;
		eventObj.preventDefault=function()
		{
			eventObj.returnValue=false;
		}
		
		if(eventObj.type=="mouseover")
		{
			eventObj.relatedTarget=eventObj.toElement;
		}
		else if(eventObj.type=="mouseout")
		{
			eventObj.relatedTarget=eventObj.fromElement;			
		}
		else
		{
			eventObj.relatedTarget=null;
		}
		
		eventObj.stopPropagation=function()
		{
			eventObj.cancelBubble=true;
		}
		
		eventObj.target=eventObj.srcElement;
		eventObj.timeStamp=(new Date()).getTime();
		
		
	}
	
	return eventObj;
}

complexEvent.getEvent=function()
{
	if(window.event)
	{
		return this.formatEvent(window.event);
	}
	else
	{
		return this.formatEvent(complexEvent.getEvent.caller.arguments[0]);
	}
}