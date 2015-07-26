/**
 * @author Administrator
 */
function addUrlParameter(url,parameterName,parameterValue)
{
	url+=(usrl.indexOf("?"))==-1 ? "?" : "&";//判断当前URL中是否存在? 即参数分隔符
	url+=encodeURIComponent(parameterName)+"="+encodeURIComponent(parameterValue);
	return url;
}
