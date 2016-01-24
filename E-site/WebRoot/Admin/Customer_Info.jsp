<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<c:choose>
<c:when test="${not empty param.suser}">
	<c:if test="${userBean==null}">
		<script language="javascript">
            location.href="<c:url value='/servlet/CustomerManageServlet?suser=" + "${param.suser}" + "&fromPage=/Admin/Customer_Info.jsp&act=customerinfo' />";
        </script>
    </c:if>
</c:when>
<c:otherwise>
	<script language="javascript">
		location.href="<c:url value='/Admin/Customer_List.jsp' />";
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
	<title>�������� ��Ա���� </title>
	<link href="<c:url value="/Admin/styles/general.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/Admin/styles/main.css" />" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>
<span class="action-span"><a href="<c:url value="/Admin/Customer_Info.jsp?suser=${userBean.cid}" />">������ʾ</a></span>
<span class="action-span"><a href="<c:url value="/Admin/Customer_Einfo.jsp?suser=${userBean.cid}" />">�����޸�</a>&nbsp;&nbsp;</span>
<span class="action-span"><a href="<c:url value="/Admin/Customer_List.jsp" />">��Ա�б�</a>&nbsp;&nbsp;</span>
<a href='<c:url value="/Admin/Admin_Main.jsp" />'>��������</a>  - ��Ա���� 
</h1><div class="main-div1">
    <table width="100%" class="btable">
        <tr>
            <td><table cellspacing="0" class="tableList">
                <tr>
                    <th width="100">��&nbsp;��&nbsp;&nbsp;��:</th>
                    <td>${userBean.cid}&nbsp;</td>
                </tr>
                <tr>
                    <th>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:</th>
                    <td>${userBean.csex}&nbsp;</td>
                </tr>
                <tr>
                    <th>��ʵ����:</th>
                    <td>${userBean.cname}&nbsp;</td>
                </tr>
                <tr>
                    <th>��������:</th>
                    <td>${userBean.cemail}&nbsp;</td>
                </tr>
                <tr>
                    <th>�绰����:</th>
                    <td>${userBean.cphone}&nbsp;</td>
                </tr>
                <tr>
                    <th>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ַ:</th>
                    <td>${userBean.caddress}&nbsp;</td>
                </tr>
               <tr>
                <th>ע��ʱ��:</th>
                <td>${userBean.cregdate}&nbsp;</td>
              </tr>
              <tr>
                <th>����½:</th>
                <td>${userBean.clastdate}&nbsp;</td>
              </tr>
                
            </table></td>
        </tr>
    </table>
</div>
<div id="footer">��Ȩ���� &copy; E-site</div>
</body>
</html>