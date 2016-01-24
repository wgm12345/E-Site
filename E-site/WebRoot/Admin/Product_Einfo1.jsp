<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<c:choose>
<c:when test="${not empty param.suser}">
	<c:if test="${userBean==null}">
		<script language="javascript">
            location.href="<c:url value='/servlet/ProductEinfoServlet?suser=" + "${param.suser}" + "&fromPage=/Admin/Product_Einfo1.jsp' />";
        </script>
    </c:if>
</c:when>
<c:when test="${not empty param.msg}">
	<script type="text/javascript" language="javascript">
		alert("${param.msg}");
		location.href="<c:url value='/Admin/Product_Info.jsp?suser=${param.username}' />";
	</script>
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
	<title>�������� - �޸����� </title>
	<link href="<c:url value="/Admin/styles/general.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/Admin/styles/main.css" />" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<c:url value="/js/user.js" />"></script>

</head>
<body>
<h1>
<span class="action-span"><a href="<c:url value="/Admin/Product_Info.jsp?suser=${param.suser}" />">������ʾ</a></span>
<span class="action-span"><a href="<c:url value="/Admin/Product_Einfo1.jsp?suser=${param.suser}" />">�����޸�</a>&nbsp;&nbsp;</span>
<span class="action-span"><a href="<c:url value="/Admin/Product_List1.jsp" />">��Ʒ�б�</a>&nbsp;&nbsp;</span>
<span><a href="<c:url value="/Admin/Admin_Main.jsp" />">��������</a>  - ��Ʒ�����޸� </span>
</h1><div class="main-div1">
<table width="100%" class="btable">
    <tr>
        <td><form name="foodEdit" action="<c:url value="/servlet/ProductEinfoServlet" />" method="post" onsubmit="return checkSellerEditFood();" enctype="multipart/form-data">
            <table cellspacing="0" class="tableList">
              <tr>
                <th width="100">��Ʒ���:</th>
                <td> <input name="fid" type="text" maxlength="30" readonly="readonly" value="${userBean.fid}" /></td>
              </tr>
              <tr>
                <th>��Ʒ����:</th>
                <td>
                  <input name="fname" type="text" maxlength="30" value="${userBean.fname}" /></td>
              </tr>
              <tr>
                <th>��Ʒ����:</th>
                <td><input name="fprice" type="text" value="${userBean.fprice}" /></td>
              </tr>
                            <tr>
                <th>��Ʒ����:</th>
                <td>
                <c:choose>
                	<c:when test="${userBean.ftype=='0'}">
                	<input type="radio" name="ftype" value="0" checked="checked" />ʳ��&nbsp;
                	<input type="radio" name="ftype" value="1" />�·�&nbsp;
                	<input type="radio" name="ftype" value="2" />�����Ʒ
                	</c:when>
                	<c:when test="${userBean.ftype=='1'}">
                	<input type="radio" name="ftype" value="0"  />ʳ��&nbsp;
                	<input type="radio" name="ftype" value="1" checked="checked"/>�·�&nbsp;
                	<input type="radio" name="ftype" value="2" />�����Ʒ
                	</c:when>
                	<c:otherwise>
                	<input type="radio" name="ftype" value="0" />ʳ��&nbsp;
                	<input type="radio" name="ftype" value="1" />�·�&nbsp;
                	<input type="radio" name="ftype" value="2" checked="checked" />�����Ʒ
                	</c:otherwise>
                </c:choose>
                </td>
              </tr>
              <tr>
               <th>��&nbsp;&nbsp;��:</th>
                <td><input name="fpraise" type="text" value="${userBean.fpraise}" readonly="readonly"/></td>
              </tr>
              <tr>
               <th>��Ʒ����:</th>
                <td><textarea name="fdescription" cols="30" rows="6">${userBean.fdescription}</textarea></td>
              </tr>
              <tr>
                <th>��ƷͼƬ��</th>
                  <td align="left">&nbsp;
          	           <input type="hidden" name="oldimg" id="oldimg" value="${userBean.fimg}" />
                       <input type="file" name="fimg" id="fimg" title="ͼƬ��ʽֻ����.jpg .gif .png .bmp" />
                  </td>
              </tr>
 
              <tr>
                <th>&nbsp;</th>
                <td>
                  <input type="hidden" name="fromPage" value="/Admin/Product_Einfo1.jsp" />
                  <input name="submit" type="submit" value="ȷ���޸�" />
                </td>
              </tr>
            </table>
          </form></td>
    </tr>
</table>
</div>
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