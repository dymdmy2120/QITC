var destoon_userid = 0;
var destoon_username = '';
var destoon_message = 0;
var destoon_chat = 0;
var destoon_stip = '';
var destoon_member = '<img src="http://img.foodspace.net/foodmate/skin/default/image/user.gif" width="24" height="13" align="absmiddle"/>&nbsp; ��ӭ��';
destoon_member += '<span class="f_red">����</span> | <a href="http://www.foodmate.net/register.php?from=foodmate">���ע��</a> | <a href="http://www.foodmate.net/member/login.php">��Ա��¼</a> | <a href="http://www.foodmate.net/member/send.php">��������?</a>';
try{Dd('destoon_member').innerHTML=destoon_member;}catch(e){}
var destoon_cart = substr_count(get_cookie('cart'), ',');
if(destoon_cart > 0) Dd('destoon_cart').innerHTML='<strong class="f_red">'+destoon_cart+'</strong>';
if(destoon_stip) Dd('tb_c').innerHTML = destoon_stip;
