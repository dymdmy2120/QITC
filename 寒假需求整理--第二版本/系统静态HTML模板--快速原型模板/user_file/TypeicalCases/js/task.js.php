var destoon_userid = 0;
var destoon_username = '';
var destoon_message = 0;
var destoon_chat = 0;
var destoon_stip = '';
var destoon_member = '<img src="http://img.foodspace.net/foodmate/skin/default/image/user.gif" width="24" height="13" align="absmiddle"/>&nbsp; 欢迎，';
destoon_member += '<span class="f_red">客人</span> | <a href="http://www.foodmate.net/register.php?from=foodmate">免费注册</a> | <a href="http://www.foodmate.net/member/login.php">会员登录</a> | <a href="http://www.foodmate.net/member/send.php">忘记密码?</a>';
try{Dd('destoon_member').innerHTML=destoon_member;}catch(e){}
var destoon_cart = substr_count(get_cookie('cart'), ',');
if(destoon_cart > 0) Dd('destoon_cart').innerHTML='<strong class="f_red">'+destoon_cart+'</strong>';
if(destoon_stip) Dd('tb_c').innerHTML = destoon_stip;
