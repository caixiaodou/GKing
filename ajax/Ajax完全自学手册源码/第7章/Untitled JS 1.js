/**
 * @author Administrator
 */
function titleClick(div)
{
	if(div == "clkWriter")
	{
		var	divWriter=document.getElementById("Writer");
		
		if(divWriter.style.display=="none")
		{
			divWriter.style.display="block";
		}
		else
		{
			divWriter.style.display="none";
		}
		
		return;
	}
	else
	{
		var	divReader=document.getElementById("Reader");
		
		if(divReader.style.display == "none")
		{
			divReader.style.display="block";
		}
		else
		{
			divReader.style.display="none";
		}
		
		return;
	}
}