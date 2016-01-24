<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<c:choose>
	<c:when test="${not empty param.suser}">
		<c:if test="${userBean==null}">
			<script language="javascript">
	            location.href="<c:url value='/servlet/ProductManageServlet?suser=" + "${param.suser}" + "&fromPage=/Admin/Product_Info.jsp&act=foodinfo' />";
	        </script>
	    </c:if>
	</c:when>
	
	<c:otherwise>
		<script language="javascript">
			location.href="<c:url value='/Admin/Product_List1.jsp' />";
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
	<title>�������� - ��Ʒ���� </title>
	<link href="<c:url value="/Admin/styles/general.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/Admin/styles/main.css" />" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>
<span class="action-span"><a href="<c:url value="/Admin/Product_Info.jsp?suser=${userBean.sid}" />">������ʾ</a></span>
<span class="action-span"><a href="<c:url value="/Admin/Product_Einfo1.jsp?suser=${userBean.sid}" />">�����޸�</a>&nbsp;&nbsp;</span>
<span class="action-span"><a href="<c:url value="/Admin/Product_List1.jsp" />">��Ʒ�б�</a>&nbsp;&nbsp;</span>
<a href='<c:url value="/Admin/Admin_Main.jsp" />'>��������</a> - ��Ʒ���� 
</h1>
<div class="main-div1">
    <table width="100%" class="btable">
        <tr>
            <td><table cellspacing="0" class="tableList">
                 <tr>
                    <th>��ƷͼƬ:</th>
                    <td align="center"><img src="<c:url value="${userBean.fimg}"/>" class="cimg" alt="${userBean.fname}  width="126"   height="88""/></td>
                </tr>
                <tr>
                    <th width="100">��Ʒ���:</th>
                    <td>${userBean.fid}&nbsp;</td>
                </tr>
                <tr>
                    <th>��Ʒ����:</th>
                    <td>${userBean.fname}&nbsp;</td>
                </tr>
                <tr>
                    <th>��Ʒ����:</th>
                    <td>${userBean.fprice}&nbsp;</td>
                </tr>
                <tr>
                    <th>��Ʒ����:</th>
                    <td>${userBean.ftype}&nbsp;(0��ʾ��ʳƷ��1��ʾ���·���2��ʾ�������Ʒ)</td>
                </tr>
                <tr>
                    <th>��Ʒ����:</th>
                    <td>${userBean.fdescription}&nbsp;</td>
                </tr>
                <tr>
                    <th>��&nbsp;&nbsp;��:</th>
                    <td>${userBean.fpraise}&nbsp;</td>
                </tr>
            </table></td>
        </tr>
    </table>
</div>
<div id="footer">��Ȩ���� &copy; E-site</div>
</body>
</html>