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
	<title>ycnShop 管理中心 - 修改密码 </title>
	<link href="styles/general.css" rel="stylesheet" type="text/css" />
	<link href="styles/main.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="../js/calendar.js"></script>
	<script type="text/javascript" src="../js/user.js"></script>
</head>
<body>
<h1>
<span class="action-span"><a href="Admin_Show.jsp">资料显示</a></span>
<span class="action-span"><a href="Admin_Edit.jsp">资料修改&nbsp;&nbsp;</a></span>
<span class="action-span"><a href="Admin_Editpass.jsp">密码修改</a>&nbsp;&nbsp;</span>
<span><a href="Admin_Main.jsp">管理中心</a>  - 管理员密码修改 </span>
</h1><div class="main-div1">
<table width="100%" class="btable">
    <tr>
        <td><form name="resetPwdUser" action="/EaterNet/servlet/EditAdminServlet" method="post" onsubmit="return checkResetPwdForm();">
            <table cellspacing="0" class="tableList">
              <tr>
                <th width="100">原始密码:</th>
                <td><input name="old_password" type="password" /></td>
              </tr>
              <tr>
                <th>新&nbsp;&nbsp;密&nbsp;&nbsp;码:</th>
                <td><input name="new_password" type="password" onkeyup="checkIntensity(this.value)"/></td>
              </tr>
              <tr>
           		 <th>密码强度:</th>
           		 <td>
              		<ul id="pwd_lower" >弱</ul>
        			<ul id="pwd_middle" >中</ul>
        			<ul id="pwd_high" >强</ul>
             	 </td>
         	  </tr>
              <tr>
                <th>确认密码:</th>
                <td><input name="comfirm_password" type="password" /></td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="submit" type="submit" value="确定修改" /> 
                  <input type="hidden" name="fromPage" value="/EaterNet/Admin/Admin_Editpass.jsp" />
                  <input type="hidden" name="act" value="editpass" />
                </td>
              </tr>
            </table>
          </form></td>
    </tr>
</table>
</div>
<div id="footer">版权所有 &copy; E-site</div>
<c:if test="${!empty param.msg}">
	<script type="text/javascript" language="javascript">
		alert("${param.msg}");
	</script>
</c:if>
  <script language="javascript">
		var old_password_empty = "旧密码不能为空。";
		var new_password_empty = "新密码不能为空。";
		var comfirm_password_empty = "确认密码不能为空。";
		var old_password_shorter = "旧密码不能小于 3 个字符.";
		var new_password_shorter = "新密码不能小于 3 个字符.";
		var comfirm_password_shorter = "确认密码不能小于 3 个字符.";
		var comfirm_password_msg = "两次输入的密码不一致";
  </script>
</body>
</html>