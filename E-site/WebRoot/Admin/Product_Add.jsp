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
	<title>�������� - ������Ʒ</title>
	<link href="<c:url value='/Admin/styles/general.css' />" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/Admin/styles/main.css' />" rel="stylesheet" type="text/css" />
    <script language="javascript" src="<c:url value='/js/calendar.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/user.js' />"></script>
  
</head>
<body>
<h1>
<span class="action-span"><a href="<c:url value='/Admin/Product_List1.jsp' />">��Ʒ�б�</a></span>
<span><a href="<c:url value='/Admin/Admin_Main.jsp ' />">��������</a> - ������Ʒ</span>
</h1>
<div class="main-div">
<!-- �����׵ĵط������������������������������������������������� -->
<form method="post" onsubmit="return checkSellerAddFood();" action="<c:url value='/servlet/ProductAddServlet' />" name="foodAdd" enctype="multipart/form-data">
<table width="100%" >
   <tr>
    <td class="label">��Ʒ����:</td>
    <td><input name="fname" type="text"/>
    	<span id="foodname">(����)</span></td>
  </tr>

  <tr>
    <td class="label">��Ʒ����:</td>
    <td><input name="fprice" type="text"/>
    <span id="foodprice">(����)</span></td>
  </tr>
  
   <tr>
    <td class="label">��Ʒ����:</td>
    <td><input name="ftype" type="radio" value="0" checked="checked" />&nbsp;ʳ��&nbsp;
        <input type="radio" name="ftype" value="1"/>&nbsp;�·�&nbsp;
        <input type="radio" name="ftype" value="2"/>&nbsp;�����Ʒ&nbsp;</td>
  </tr>
  <tr>
    <td class="label">��ƷͼƬ:</td>
    <td>
        <input type="hidden" name="oldimg" id="oldimg" value="/foodImg/nopic.gif" />
        <input type="file" name="fimg" id="fimg" title="ͼƬ��ʽֻ����.jpg .gif .png .bmp" />

  </tr>
  <tr>
    <td class="label">��Ʒ����:</td>
    <td><textarea name="fdescription" cols="30" rows="6"></textarea></td>
  </tr>
  <tr>
  	<td align="right">
  	  <input name="submit" type="submit" value="����" class="button" />
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
            	location.href="<c:url value="/Admin/Product_List1.jsp" />";
            </script>
        </c:if>
    	<script language="javascript">
    		alert('${param.msg}');
    		location.href="<c:url value="/Admin/Product_Add.jsp" />";
    	</script>
        <c:if test="${not empty param.success}">
        	<script language="javascript">
            	location.href="<c:url value="/Admin/Product_List1.jsp" />";
            </script>
        </c:if>
    </c:when>
</c:choose>
<div id="footer">��Ȩ���� &copy;E-site</div>
<script language="javascript" >
  <!--
        var mcname_empty = "��Ʒ���Ʋ���Ϊ�ա�";
		var mcprice_empty = "��Ʒ���۲���Ϊ��";
		var mcprice_msg = "��Ʒ�۸�ֻ��Ϊ������";
		var mcimg_msg = "ͼƬ��ʽ����.������ѡ����ƷͼƬ.\n\nͼƬ��ʽֻ��Ϊ gif jpg png bmp";
		var Type_empty = "��ѡ����Ʒ���";
		var mcimg_empty = "��ѡ����ƷͼƬ�ļ�\n\n������ʹ����ƷͼƬ"
	-->
</script>
</body>
</html>