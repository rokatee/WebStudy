/**
 * ajax2.js
 */

var ajax = null;

function createAjax()
{
	
	if (window.ActiveXObject)
	{
		return new ActiveXObject("Msxml.XMLHTTP");
	} 
	else if (window.XMLHttpRequest)
	{
		return new XMLHttpRequest();
	}
	else
	{
		return null;
	}
}