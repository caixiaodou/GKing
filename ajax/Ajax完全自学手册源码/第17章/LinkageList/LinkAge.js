/**
 * @author Administrator
 */
		var xmlHttp;
	var provinceID=0;
			function  createXmlHttp()
			{
				if(window.ActiveXObject)
				{
					xmlHttp=new ActiveXObject('Microsoft.XMLHTTP');
				}
				else if(window.XMLHttpRequest)
				{
					xmlHttp=new XMLHttpRequest();
				}
			}
			
			function startRequest(slcprovinceID)
			{
				createXmlHttp();
				provinceID=slcprovinceID;
				alert(provinceID);
				xmlHttp.onreadystatechange=readyStateHandler;
				xmlHttp.open("POST",createQueryString(provinceID),true);
				xmlHttp.send(null);
			}
			
			function readyStateHandler()
			{	
				alert("readyState="+xmlHttp.readyState);
				if(xmlHttp.readyState==4)
				{
					alert("status"+xmlHttp.status);
					if(xmlHttp.status==200)
					{
						changeCity(provinceID);
					}
				}
			}
			
			function changeCity(provinceID)
			{
				alert(provinceID);
				clearCityList();
				var xmlDoc=xmlHttp.responseXML;
				var cityIDs=xmlDoc.getElementsByTagName("AreaID");
				var citys=xmlDoc.getElementsByTagName("Name");
				
				for(var i=0;i<citys.length;i++)
				{
					var cityID=cityIDs[i].firstChild.nodeValue;
					alert(cityID);
					var city=citys[i].firstChild.nodeValue;
					alert(city);
					var cityOption=new Option(cityID,city);
					
					document.forms[0].ddlCity.options.add(cityOption);
				}
				
				document.forms[0].ddlCity.options[0].selected=true;
			}
			
			
			function clearCityList()
			{
				alert("clearCityList");
				var myOptions=document.forms[0].ddlCity.options;
				
				for(var i=0;i<myOptions.length;i++)
				{
					document.forms[0].ddlCity.options[i]=null;
				}
				alert("clearCityList end");
			}
			
			function createQueryString(provinceID)
			{
				var queryString="http://localhost/LinkageList/ReadCity.aspx?"+"provinceID="+provinceID;
				alert(queryString);
				return queryString;
			}