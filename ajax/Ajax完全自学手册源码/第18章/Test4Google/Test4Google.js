/**
 * @author Administrator
 */
			var xmlHttp;
			var key;
			var barColor="gray";
			var spanId="block";
			var clearSpan="&ndsp;&ndsp;&ndsp;";

			function createXmlHttp()
			{
				if(window.ActiveXObject)
				{
					xmlHttp=new window.ActiveXObject("Microsoft.XMLHTTP");
				}
				else if(window.XMLHttpRequest)
				{
					xmlHttp=new window.XMLHttpRequest();
				}
			}

			function progressGo()
			{
				createXmlHttp();
				checkDiv();
				var url="http://localhost/Test4Google/WebForm2.aspx?task=start";
				var btn=document.getElementById("btnGo");
				btn.disabled=true;
				xmlHttp.open("GET",url,true);
				xmlHttp.onreadystatechange=readyStateChangeHandler;
				xmlHttp.send(null);
			}

			function readyStateChangeHandler()
			{
				if(xmlHttp.readyState==4)
				{
					if(xmlHttp.status==200)
					{
						window.setTimeout("pollServer()",1000);
					}
				}
			}

			function pollServer()
			{
				createXmlHttp();
				var url="http://localhost/Test4Google/WebForm2.aspx?task=poll&key="+key;
				xmlHttp.open("GET",url,true);
				xmlHttp.onreadystatechange=pollCallBack;
				xmlHttp.send(null);
				
			}


			function pollCallBack()
			{
				if(xmlHttp.readyState==4)
				{
					if(xmlHttp.status==200)
					{
						var xmldoc=xmlHttp.responseXML;
						var persentCompletes=xmldoc.getElementsByTagName("percent");
						var persentComplete=persentCompletes[0].firstChild.nodeValue;
						alert(persentComplete);
						var myIndex=processResult(persentComplete);
						
						for(var i=1;i<=myIndex;i++)
						{
							var block=document.getElementById("block"+i);
							block.innerHTML=clearBar;
							block.style.backgroundColor=barColor;
							
							var nextCell=i+1;
							if(nextCell>myIndex && nextCell<=9)
							{
								document.getElementById("block"+nextCell).innerHTML=persentComplete+"%";
							}
						}
					}
				}
			}

			function processResult(completeIndex)
			{
				var ind;
				
				if(completeIndex.length==1)
				{
					ind=1;
				}
				else if(completeIndex.length==2)
				{
					ind=completeIndex.substring(0,1);
				}
				else
				{
					ind=9;
				}
				
				return ind;
			}


			function checkDiv()
			{
				var progressbar=document.getElementById("pnlProgressbar");
				if(progressbar.style.visibility=="visible")
				{
					clearBar();
					document.getElementById("complete").innerHTML="";
				}
				else
				{
					progressbar.style.visibility="visible";
				}	
			}

			function clearBar()
			{
				for(var i=1;i<10;i++)
				{
					var block=document.getElementById("block"+i);
					block.innerText=clearBar;
					block.style.backgroundColor="white";
				}
			}