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
	<title>�������� - �޸����� </title>
	<link href="styles/general.css" rel="stylesheet" type="text/css" />
	<link href="styles/main.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/user.js"></script>
</head>
<body>
<h1>
<span class="action-span"><a href="Admin_Show.jsp">������ʾ</a></span>
<span class="action-span"><a href="Admin_Edit.jsp">�����޸�&nbsp;&nbsp;</a></span>
<span class="action-span"><a href="Admin_Editpass.jsp">�����޸�</a>&nbsp;&nbsp;</span>
<span><a href="Admin_Main.jsp"> ��������</a>  - ����Ա�����޸� </span>
</h1><div class="main-div1">
<table width="100%" class="btable">
    <tr>
        <td><form name="formEdit" action="/EaterNet/servlet/EditAdminServlet" method="post" onsubmit="return checkUpdateInfoForm();">
            <table cellspacing="0" class="tableList">
              <tr>
                <th width="100">��&nbsp;&nbsp;��&nbsp;&nbsp;��:</th>
                <td> <input name="suser" type="text" maxlength="30" readonly="readonly" value="${sessionScope.admin.mid}" /></td>
              </tr>
             
              <tr>
                <th>��ʵ����:</th>
                <td>
                  <input name="sname" type="text" maxlength="30" value="${sessionScope.admin.mname}" /></td>
              </tr>
              <tr>
                <th>��������:</th>
                <td><input name="semail" type="text" value="${sessionScope.admin.memail}" /></td>
              </tr>
              <tr>
                <th>�绰����:</th>
                <td><input name="sphone" type="text" value="${sessionScope.admin.mphone}" /></td>
              </tr>
              <tr>
                <th>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ַ:</th>
                <td><input name="saddress" type="text" value="${sessionScope.admin.maddress}"/></td>
              </tr>
              <tr>
                <th>&nbsp;</th>
                <td>
                  <input type="hidden" name="fromPage" value="/EaterNet/Admin/Admin_Edit.jsp" />
                  <input type="hidden" name="act" value="edit" />
                  <input name="submit" type="submit" value="ȷ���޸�" />
                </td>
              </tr>
            </table>
          </form></td>
    </tr>
</table>
</div>
<div id="footer">��Ȩ���� &copy; E-site</div>
<c:if test="${!empty param.msg}">
	<script type="text/javascript" language="javascript">
		alert("${param.msg}");
		location.href="<c:url value='/Admin/Admin_Edit.jsp' />";
	</script>
</c:if>
  <script language="javascript">
        var email_empty = "Email��ַ����Ϊ��";
        var email_format = "Email ��ַ��Ч";
		var phone_empty = "�绰���벻��Ϊ��";
		var phone_format = "�绰�����ʽ����";
  </script>
</body>
</html>