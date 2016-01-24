<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<c:choose>
<c:when test="${not empty param.suser}">
	<c:if test="${userBean==null}">
		<script language="javascript">
            location.href="<c:url value='/servlet/SellerManageServlet?suser=" + "${param.suser}" + "&fromPage=/Admin/Seller_Info.jsp&act=sellerinfo' />";
        </script>
    </c:if>
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
	<title>管理中心 - 店家资料 </title>
	<link href="<c:url value="/Admin/styles/general.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/Admin/styles/main.css" />" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>
<span class="action-span"><a href="<c:url value="/Admin/Seller_Info.jsp?suser=${userBean.sid}" />">资料显示</a></span>
<span class="action-span"><a href="<c:url value="/Admin/Seller_Einfo.jsp?suser=${userBean.sid}" />">资料修改</a>&nbsp;&nbsp;</span>
<span class="action-span"><a href="<c:url value="/Admin/Seller_List.jsp" />">店家列表</a>&nbsp;&nbsp;</span>
<a href='<c:url value="/Admin/Admin_Main.jsp" />'>管理中心</a>  - 店家资料 
</h1><div class="main-div1">
    <table width="100%" class="btable">
        <tr>
            <td><table cellspacing="0" class="tableList">
                <tr>
                    <th width="100">用&nbsp;户&nbsp;&nbsp;名:</th>
                    <td>${userBean.sid}&nbsp;</td>
                </tr>
                <tr>
                    <th>店 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</th>
                    <td>${userBean.sname}&nbsp;</td>
                </tr>
                <tr>
                    <th>电子邮箱:</th>
                    <td>${userBean.semail}&nbsp;</td>
                </tr>
                <tr>
                    <th>电话号码:</th>
                    <td>${userBean.sphone}&nbsp;</td>
                </tr>
                <tr>
                    <th>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</th>
                    <td>${userBean.sdescription}&nbsp;</td>
                </tr>
                <tr>
                    <th>点&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赞:</th>
                    <td>${userBean.spraise}&nbsp;</td>
                </tr>
                <tr>
                    <th>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</th>
                    <td>${userBean.saddress}&nbsp;</td>
                </tr>
              <tr>
                <th>注册时间:</th>
                <td>${userBean.sregdate}&nbsp;</td>
              </tr>
              <tr>
                <th>最后登陆:</th>
                <td>${userBean.slastdate}&nbsp;</td>
              </tr>
            </table></td>
        </tr>
    </table>
</div>
<div id="footer">版权所有 &copy; 两把刷子小组</div>
</body>
</html>