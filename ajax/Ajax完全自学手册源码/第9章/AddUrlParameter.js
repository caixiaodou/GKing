/**
 * @author Administrator
 */
function addUrlParameter(url,parameterName,parameterValue)
{
	url+=(usrl.indexOf("?"))==-1 ? "?" : "&";//�жϵ�ǰURL���Ƿ����? �������ָ���
	url+=encodeURIComponent(parameterName)+"="+encodeURIComponent(parameterValue);
	return url;
}
