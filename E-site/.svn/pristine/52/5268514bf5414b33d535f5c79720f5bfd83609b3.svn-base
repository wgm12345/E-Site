<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
	<meta http-equiv="expires" content="Wed, 26 Feb 1970 08:21:57 GMT" />
	<title>管理中心 - 添加店家</title>
	<link href="<c:url value='/Admin/styles/general.css' />" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/Admin/styles/main.css' />" rel="stylesheet" type="text/css" />
    <script language="javascript" src="<c:url value='/js/calendar.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/user.js' />"></script>
    <script language="javascript">
		function checkAdd(){
			var reguname =  /^[a-zA-Z]+$/;
			var regemail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
			var regphone = /^[\d|\-|\s]+$/;
			var frm  = document.forms['regUser'];
			var username  = trim(frm.elements['suser'].value);
			var password = frm.elements['spwd'].value;
			var password2 = frm.elements['spwd2'].value;
			var email = frm.elements['semail'].value;
			var tel = frm.elements['sphone'].value;
			if ( username.length == 0 ) {
				alert(username_empty);
				frm.elements['suser'].focus();
				return false;
			} else if ( username.length < 3 ) {
				alert(username_shorter);
				frm.elements['suser'].focus();
				return false;
			} else if ( !reguname.test(username) ) {
				alert(username_invalid);
				frm.elements['suser'].focus();
				return false;
			} else if ( password.length == 0 ) {
				alert(password_empty);
				frm.elements['spwd'].focus();
				return false;
			} else if ( password.length < 3 ) {
				alert(password_shorter);
				frm.elements['spwd'].focus();
				return false;
			} else if ( password2.length == 0  ) {
				alert(password_empty);
				frm.elements['spwd2'].focus();
				return false;
			} else if ( password2.length < 3 ) {
				alert(password_shorter);
				frm.elements['spwd2'].focus();
				return false;
			} else if ( password2 != password ) {
				alert(confirm_password_invalid);
				frm.elements['spwd2'].focus();
				return false;
			} else if ( email.length == 0 ) {
				alert(email_empty);
				frm.elements['semail'].focus();
				return false;
			} else if ( !regemail.test(email) ) {
				alert(email_format);
				frm.elements['semail'].focus();
				return false;
			} else if ( tel.length == 0 ) {
				alert(phone_empty);
				frm.elements['sphone'].focus();
				return false;
			} else if ( !regphone.test(tel) ) {
				alert(phone_format);
				frm.elements['sphone'].focus();
				return false;
			} 
		}
	</script>
</head>
<body>
<h1>
<span class="action-span"><a href="<c:url value='/Admin/Seller_List.jsp' />">店家列表</a></span>
<span><a href="<c:url value='/Admin/Seller_Main.jsp ' />">管理中心</a>  - 添加店家 </span>
</h1>
<div class="main-div">
<form method="post" onsubmit="return checkAdd();" action="<c:url value='/servlet/SellerManageServlet' />" name="regUser">
<table width="100%" >
  <tr>
    <td class="label">用&nbsp;户&nbsp;名:</td>
    <td><input name="suser" type="text" maxlength="30" onblur="is_SellerRegistered(this.value);" />
    	<span id="username">(必填)</span></td>
  </tr>
  <tr>
    <td class="label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
    <td><input id="spwd" name="spwd" type="password" maxlength="30" onblur="check_password(this.value);" onkeyup="checkIntensity(this.value)" />
    	<span id="password">(必填)</span></td>
  </tr>
  <tr>
    <td class="label">密码强度:</td>
    <td>
    	<ul id="pwd_lower" >弱</ul>
        <ul id="pwd_middle" >中</ul>
        <ul id="pwd_high" >强</ul>
    </td>
  </tr>
  <tr>
    <td class="label">确认密码:</td>
    <td><input name="spwd2" type="password" maxlength="30" onblur="check_conform_password(this.value);" />
    	<span id="password2">(必填)</span></td>
  </tr>
  <tr>
    <td class="label">店&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
    <td><input name="sname" type="text" maxlength="30" /></td>
  </tr>

    <tr>
    <td class="label">电子邮箱:</td>
    <td><input name="semail" type="text" maxlength="30" onblur="checkEmail(this.value);" />
    	<span id="emailcheck">(必填)</span></td>
  </tr>
  <tr>
    <td class="label">电话号码:</td>
    <td><input name="sphone" type="text" maxlength="30" onblur="checkPhone(this.value);" />
    	<span id="phonecheck">(必填)</span></td>
  </tr>
  <tr>
    <td class="label">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</td>
    <td><input name="saddress" type="text" class="textInput" maxlength="300" /></td>
  </tr>
  <tr>
    <td class="label">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</td>
    <td><input name="sdescription" type="text" class="textInput" maxlength="300" /></td>
  </tr>
  <tr>
  	<td align="right">
  	  <input name="submit" type="submit" value="添加" class="button" />
      <input type="hidden" name="act" value="selleradd" />
      <input type="hidden" name="fromPage" value="/Admin/Seller_Add.jsp" />
    </td>
    <td align="left"><input type="reset" value=" 重置 " class="button" /></td>
  </tr>
</table>
</form>
</div>
<c:choose>
	<c:when test="${not empty param.msg}">
	    <c:if test="${not empty param.success}">
        	<script language="javascript">
        		alert('${param.msg}');
            	location.href="<c:url value="/Admin/Seller_List.jsp" />";
            </script>
        </c:if>
    	<script language="javascript">
    		alert('${param.msg}');
    		location.href="<c:url value="/Admin/Seller_Add.jsp" />";
    	</script>
        <c:if test="${not empty param.success}">
        	<script language="javascript">
            	location.href="<c:url value="/Admin/Seller_List.jsp" />";
            </script>
        </c:if>
    </c:when>
</c:choose>
<div id="footer">版权所有 &copy;两把刷子小组</div>
  <script language="javascript" >
  <!--
        var msg_username_empty = "<img src='/EaterNet/images/check_error.gif'  /> 用户名不能为空。";
		var msg_username_shorter = "<img src='/EaterNet/images/check_error.gif'  /> 对不起，您输入的用户名小于3个字符, 请输入一个较长的用户名。";
		var msg_username_invalid = "<img src='/EaterNet/images/check_error.gif'  /> 用户名非法,用户名只能包含英文字母。";
		var msg_password_empty = "<img src='/EaterNet/images/check_error.gif'  /> 登录密码不能为空。";
        var msg_password_shorter = "<img src='/EaterNet/images/check_error.gif'  /> 登录密码不能少于 3 个字符。";
        var msg_confirm_password_invalid = "<img src='/EaterNet/images/check_error.gif'  /> 两次输入的密码不一致，请检查后重试。 ";
        var msg_email_empty = "<img src='/EaterNet/images/check_error.gif'  /> 邮件地址不能为空";
        var msg_email_format = "<img src='/EaterNet/images/check_error.gif'  /> Email 地址无效，请返回重新填写。";
		var msg_phone_empty = "<img src='/EaterNet/images/check_error.gif'  /> 电话号码不能为空。";
		var msg_phone_format = "<img src='/EaterNet/images/check_error.gif'  /> 电话号码格式错误,请返回重新填写。";
		var msg_can_rg = "<img src='/EaterNet/images/check_right.gif'  />";
		var username_empty = "用户名不能为空。";
		var username_shorter = "用户名长度不能少于 3 个字符。";
		var username_invalid = "用户名只能是英文字母。";
		var password_empty = "登录密码不能为空。";
        var password_shorter = "登录密码不能少于 3 个字符。";
        var confirm_password_invalid = "两次输入密码不一致";
        var email_empty = "Email地址不能为空";
        var email_format = "Email 地址无效";
		var phone_empty = "电话号码不能为空";
		var phone_format = "电话号码格式错误";
	-->
  </script>
</body>
</html>