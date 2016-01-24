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
	<title>�������� - ��ӹ���Ա </title>
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
<span class="action-span"><a href="<c:url value='/Admin/Admin_List.jsp' />">����Ա�б�</a></span>
<span><a href="<c:url value='/Admin/Admin_Main.jsp ' />">��������</a>  - ��ӹ���Ա </span>
</h1>
<div class="main-div">
<form method="post" onsubmit="return checkAdd();" action="<c:url value='/servlet/AdminManageServlet' />" name="regUser">
<table width="100%" >
  <tr>
    <td class="label">��&nbsp;��&nbsp;��:</td>
    <td><input name="suser" type="text" maxlength="30" onblur="is_AdminRegistered(this.value);" />
    	<span id="username">(����)</span></td>
  </tr>
  <tr>
    <td class="label">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:</td>
    <td><input id="spwd" name="spwd" type="password" maxlength="30" onblur="check_password(this.value);" onkeyup="checkIntensity(this.value)" />
    	<span id="password">(����)</span></td>
  </tr>
  <tr>
    <td class="label">����ǿ��:</td>
    <td>
    	<ul id="pwd_lower" >��</ul>
        <ul id="pwd_middle" >��</ul>
        <ul id="pwd_high" >ǿ</ul>
    </td>
  </tr>
  <tr>
    <td class="label">ȷ������:</td>
    <td><input name="spwd2" type="password" maxlength="30" onblur="check_conform_password(this.value);" />
    	<span id="password2">(����)</span></td>
  </tr>
  <tr>
    <td class="label">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:</td>
    <td><input type="radio" name="ssex" value="man" checked="checked" />&nbsp;��&nbsp;<input type="radio" name="ssex" value="woman" />&nbsp;Ů&nbsp;</td>
  </tr>
  <tr>
    <td class="label">��ʵ����:</td>
    <td><input name="sname" type="text" maxlength="30" /></td>
  </tr>

    <tr>
    <td class="label">��������:</td>
    <td><input name="semail" type="text" maxlength="30" onblur="checkEmail(this.value);" />
    	<span id="emailcheck">(����)</span></td>
  </tr>
  <tr>
    <td class="label">�绰����:</td>
    <td><input name="sphone" type="text" maxlength="30" onblur="checkPhone(this.value);" />
    	<span id="phonecheck">(����)</span></td>
  </tr>
  <tr>
    <td class="label">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ַ:</td>
    <td><input name="saddress" type="text" class="textInput" maxlength="300" /></td>
  </tr>

  <tr>
  	<td align="right">
  	  <input name="submit" type="submit" value="���" class="button" />
      <input type="hidden" name="act" value="adminadd" />
      <input type="hidden" name="fromPage" value="/Admin/Admin_Add.jsp" />
    </td>
    <td align="left"><input type="reset" value=" ���� " class="button" /></td>
  </tr>
</table>
</form>
</div>
<c:choose>
	<c:when test="${not empty param.msg}">
	    <c:if test="${not empty param.success}">
        	<script language="javascript">
        		alert('${param.msg}');
            	location.href="<c:url value="/Admin/Admin_List.jsp" />";
            </script>
        </c:if>
    	<script language="javascript">
    		alert('${param.msg}');
    		location.href="<c:url value="/Admin/Admin_Add.jsp" />";
    	</script>
        <c:if test="${not empty param.success}">
        	<script language="javascript">
            	location.href="<c:url value="/Admin/Admin_List.jsp" />";
            </script>
        </c:if>
    </c:when>
</c:choose>
<div id="footer">��Ȩ���� &copy;����ˢ��С��</div>
  <script language="javascript" >
  <!--
        var msg_username_empty = "<img src='/EaterNet/images/check_error.gif'  /> �û�������Ϊ�ա�";
		var msg_username_shorter = "<img src='/EaterNet/images/check_error.gif'  /> �Բ�����������û���С��3���ַ�, ������һ���ϳ����û�����";
		var msg_username_invalid = "<img src='/EaterNet/images/check_error.gif'  /> �û����Ƿ�,�û���ֻ�ܰ���Ӣ����ĸ��";
		var msg_password_empty = "<img src='/EaterNet/images/check_error.gif'  /> ��¼���벻��Ϊ�ա�";
        var msg_password_shorter = "<img src='/EaterNet/images/check_error.gif'  /> ��¼���벻������ 3 ���ַ���";
        var msg_confirm_password_invalid = "<img src='/EaterNet/images/check_error.gif'  /> ������������벻һ�£���������ԡ� ";
        var msg_email_empty = "<img src='/EaterNet/images/check_error.gif'  /> �ʼ���ַ����Ϊ��";
        var msg_email_format = "<img src='/EaterNet/images/check_error.gif'  /> Email ��ַ��Ч���뷵��������д��";
		var msg_phone_empty = "<img src='/EaterNet/images/check_error.gif'  /> �绰���벻��Ϊ�ա�";
		var msg_phone_format = "<img src='/EaterNet/images/check_error.gif'  /> �绰�����ʽ����,�뷵��������д��";
		var msg_can_rg = "<img src='/EaterNet/images/check_right.gif'  />";
		var username_empty = "�û�������Ϊ�ա�";
		var username_shorter = "�û������Ȳ������� 3 ���ַ���";
		var username_invalid = "�û���ֻ����Ӣ����ĸ��";
		var password_empty = "��¼���벻��Ϊ�ա�";
        var password_shorter = "��¼���벻������ 3 ���ַ���";
        var confirm_password_invalid = "�����������벻һ��";
        var email_empty = "Email��ַ����Ϊ��";
        var email_format = "Email ��ַ��Ч";
		var phone_empty = "�绰���벻��Ϊ��";
		var phone_format = "�绰�����ʽ����";
	-->
  </script>
</body>
</html>