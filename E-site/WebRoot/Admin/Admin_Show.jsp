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
	<title>�������� - ����Ա���� </title>
	<link href="styles/general.css" rel="stylesheet" type="text/css" />
	<link href="styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>
<span class="action-span"><a href="Admin_Show.jsp">������ʾ</a></span>
<span class="action-span"><a href="Admin_Edit.jsp">�����޸�&nbsp;&nbsp;</a></span>
<span class="action-span"><a href="Admin_Editpass.jsp">�����޸�</a>&nbsp;&nbsp;</span>
<span><a href="Admin_Main.jsp">��������</a>  - ����Ա���� </span>
</h1><div class="main-div1">
    <table width="100%" class="btable">
        <tr>
            <td><table cellspacing="0" class="tableList">
                <tr>
                    <th width="100">��&nbsp;��&nbsp;&nbsp;��:</th>
                    <td>${sessionScope.seller.sid}&nbsp;</td>
                </tr>
               
                <tr>
                    <th>��ʵ����:</th>
                    <td>${sessionScope.seller.sname}&nbsp;</td>
                </tr>
                <tr>
                    <th>��������:</th>
                    <td>${sessionScope.seller.semail}&nbsp;</td>
                </tr>
                <tr>
                    <th>�绰����:</th>
                    <td>${sessionScope.seller.sphone}&nbsp;</td>
                </tr>
                <tr>
                    <th>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ַ:</th>
                    <td>${sessionScope.seller.saddress}&nbsp;</td>
                </tr>
            </table></td>
        </tr>
    </table>
</div>
<div id="footer">��Ȩ���� &copy; E-site</div>
</body>
</html>