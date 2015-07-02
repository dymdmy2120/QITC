var bodyfrm = ( document.compatMode.toLowerCase()=="css1compat" ) ? document.documentElement : document.body;
var adst = document.getElementById("ShowAD").style;
	adst.top = ( bodyfrm.clientHeight -530) + "px";
	adst.left = ( bodyfrm.clientWidth -155 ) + "px";	
	var adst_left = document.getElementById("ShowAD_left");
	var clientH = document.documentElement.clientHeight;	
	var oRight = document.getElementById("ShowAD");
	
function moveR() {
	oRight.style.top=(clientH-oRight.offsetHeight )/2+scrollY+"px";
	adst_left.style.top=(clientH-adst_left.offsetHeight)/2+scrollY+"px";	
}
setInterval("moveR();", 80);

function closead1()
{
	adst.display='none';
	
}
function closead2()
{
	var adst_left = document.getElementById("ShowAD_left").style;	
	adst_left.display='none';
}
