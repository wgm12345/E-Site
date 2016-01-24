<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<c:choose>
<c:when test="${not empty param.suser}">
	<c:if test="${userBean==null}">
		<script language="javascript">
            location.href="<c:url value='/servlet/AdminManageServlet?suser=" + "${param.suser}" + "&fromPage=/Admin/Admin_Einfo.jsp&act=adminedit' />";
        </script>
    </c:if>
</c:when>
<c:when test="${not empty param.msg}">
	<script type="text/javascript" language="javascript">
		alert("${param.msg}");
		location.href="<c:url value='/Admin/Admin_Info.jsp?suser=${param.username}' />";
	</script>
</c:when>
<c:otherwise>
	<script language="javascript">
		location.href="<c:url value='/Admin/Admin_List.jsp' />";
	</script>
</c:otherwise>
</c:choose>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
	<meta http-equiv="expires" content="Wed, 26 Feb 1970 08:21:57 GMT" />
	<title>管理中心 - 修改资料 </title>
	<link href="<c:url value="/Admin/styles/general.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/Admin/styles/main.css" />" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<c:url value="/js/user.js" />"></script>
</head>
<body>
<h1>
<span class="action-span"><a href="<c:url value="/Admin/Admin_Info.jsp?suser=${param.suser}" />">资料显示</a></span>
<span class="action-span"><a href="<c:url value="/Admin/Admin_Einfo.jsp?suser=${param.suser}" />">资料修改</a>&nbsp;&nbsp;</span>
<span class="action-span"><a href="<c:url value="/Admin/Admin_List.jsp" />">管理员列表</a>&nbsp;&nbsp;</span>
<span><a href="<c:url value="/Admin/Admin_Main.jsp" />">管理中心</a>  - 管理员资料修改 </span>
</h1><div class="main-div1">
<table width="100%" class="btable">
    <tr>
        <td><form name="formEdit" action="<c:url value="/servlet/AdminManageServlet" />" method="post" onsubmit="return checkUpdateInfoForm();">
            <table cellspacing="0" class="tableList">
              <tr>
                <th width="100">用&nbsp;&nbsp;户&nbsp;&nbsp;名:</th>
                <td> <input name="suser" type="text" maxlength="30" readonly="readonly" value="${userBean.mid}" /></td>
              </tr>
              <tr>
                <th>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</th>
                <td>
                <c:choose>
                	<c:when test="${userBean.msex=='man'}">
                	<input type="radio" name="ssex" value="man" checked="checked" />男&nbsp;<input type="radio" name="ssex" value="woman" />女
                	</c:when>
                	<c:otherwise>
                	<input type="radio" name="ssex" value="man" />男&nbsp;<input type="radio" name="ssex" value="woman" checked="checked" />女
                	</c:otherwise>
                </c:choose>
                </td>
              </tr>
              <tr>
                <th>真实姓名:</th>
                <td>
                  <input name="sname" type="text" maxlength="30" value="${userBean.mname}" /></td>
              </tr>
              <tr>
                <th>电子邮箱:</th>
                <td><input name="semail" type="text" value="${userBean.memail}" /></td>
              </tr>
              <tr>
                <th>电话号码:</th>
                <td><input name="sphone" type="text" value="${userBean.mphone}" /></td>
              </tr>
              <tr>
                <th>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</th>
                <td><input name="saddress" type="text" value="${userBean.maddress}"/></td>
              </tr>
              <tr>
                <th>&nbsp;</th>
                <td>
                  <input type="hidden" name="fromPage" value="/Admin/Admin_Einfo.jsp" />
                  <input type="hidden" name="act" value="adminedit" />
                  <input type="hidden" name="first" value="update" />
                  <input name="submit" type="submit" value="确定修改" />
                </td>
              </tr>
            </table>
          </form></td>
    </tr>
</table>
</div>
<div id="footer">版权所有 &copy;E-site</div>
  <script language="javascript">
        var email_empty = "Email地址不能为空";
        var email_format = "Email 地址无效";
		var phone_empty = "电话号码不能为空";
		var phone_format = "电话号码格式错误";
  </script>
</body>
</html>