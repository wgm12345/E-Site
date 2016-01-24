<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<c:choose>
<c:when test="${not empty param.suser}">
	<c:if test="${userBean==null}">
		<script language="javascript">
            location.href="<c:url value='/servlet/SellerManageServlet?suser=" + "${param.suser}" + "&fromPage=/Admin/Seller_Einfo.jsp&act=selleredit' />";
        </script>
    </c:if>
</c:when>
<c:when test="${not empty param.msg}">
	<script type="text/javascript" language="javascript">
		alert("${param.msg}");
		location.href="<c:url value='/Admin/Seller_Info.jsp?suser=${param.username}' />";
	</script>
</c:when>
<c:otherwise>
	<script language="javascript">
		location.href="<c:url value='/Admin/Seller_List.jsp' />";
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
<span class="action-span"><a href="<c:url value="/Admin/Seller_Info.jsp?suser=${param.suser}" />">资料显示</a></span>
<span class="action-span"><a href="<c:url value="/Admin/Seller_Einfo.jsp?suser=${param.suser}" />">资料修改</a>&nbsp;&nbsp;</span>
<span class="action-span"><a href="<c:url value="/Admin/Seller_List.jsp" />">店家列表</a>&nbsp;&nbsp;</span>
<span><a href="<c:url value="/Admin/Admin_Main.jsp" />">管理中心</a>  - 店家资料修改 </span>
</h1><div class="main-div1">
<table width="100%" class="btable">
    <tr>
        <td><form name="formEdit" action="<c:url value="/servlet/SellerManageServlet" />" method="post" onsubmit="return checkUpdateInfoForm();">
            <table cellspacing="0" class="tableList">
              <tr>
                <th width="100">用&nbsp;&nbsp;户&nbsp;&nbsp;名:</th>
                <td> <input name="suser" type="text" maxlength="30" readonly="readonly" value="${userBean.sid}" /></td>
              </tr>
              <tr>
                <th>店&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</th>
                <td>
                  <input name="sname" type="text" maxlength="30" value="${userBean.sname}" /></td>
              </tr>
              <tr>
                <th>电子邮箱:</th>
                <td><input name="semail" type="text" value="${userBean.semail}" /></td>
              </tr>
              <tr>
                <th>电话号码:</th>
                <td><input name="sphone" type="text" value="${userBean.sphone}" /></td>
              </tr>
              <tr>
               <th>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</th>
                <td><input name="sdescription" type="text" maxlength="300" value="${userBean.sdescription}"/></td>
              </tr>
              <tr>
               <th>点&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赞:</th>
                <td><input name="spraise" type="text" value="${userBean.spraise}"/></td>
              </tr>
              <tr>
                <th>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</th>
                <td><input name="saddress" type="text" value="${userBean.saddress}"/></td>
              </tr>
              <tr>
                <th>注册时间:</th>
                <td><input name="sregdate" type="text" size="30" class="textInput2" value="${userBean.sregdate}" readonly="readonly" /></td>
              </tr>
              <tr>
                <th>最后登陆:</th>
                <td><input name="slastdate" type="text" size="30" class="textInput2" value="${userBean.slastdate}" readonly="readonly" /></td>
              </tr>
              <tr>
                <th>&nbsp;</th>
                <td>
                  <input type="hidden" name="fromPage" value="/Admin/Seller_Einfo.jsp" />
                  <input type="hidden" name="act" value="selleredit" />
                  <input type="hidden" name="first" value="update" />
                  <input name="submit" type="submit" value="确定修改" />
                </td>
              </tr>
            </table>
          </form></td>
    </tr>
</table>
</div>
<div id="footer">版权所有 &copy;两把刷子小组</div>
  <script language="javascript">
        var email_empty = "Email地址不能为空";
        var email_format = "Email 地址无效";
		var phone_empty = "电话号码不能为空";
		var phone_format = "电话号码格式错误";
  </script>
</body>
</html>