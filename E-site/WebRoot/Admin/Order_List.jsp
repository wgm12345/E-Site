<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<c:if test="${orderList==null}">
	<c:redirect url="/servlet/OrderManageServlet?act=orderList&fromPage=/Admin/Order_List.jsp&curPage=1"></c:redirect>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
	<meta http-equiv="expires" content="Wed, 26 Feb 1970 08:21:57 GMT" />
	<title>��������-�����б� </title>
	<link href="<c:url value="/Admin/styles/general.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/Admin/styles/main.css" />" rel="stylesheet" type="text/css" />
    <script language="javascript" src="<c:url value="/js/calendar.js" />"></script>
    <script language="javascript">
		function pagingOnClick(num){
			if(num==1){
				searchForm.curPage.value=1;
			}
			if(num==2){
				searchForm.curPage.value=${curPage} - 1;
			}
			if(num==3){
				searchForm.curPage.value=${curPage} + 1;
			}
			if(num==4){
				searchForm.curPage.value=${pageCount};
			}
			searchForm.submit();
		}
		
		function selected(sstatus) {
			if(sstatus==null) {
				searchForm.sstatus.options[0].selected=true;
			} else if(sstatus=="0") {
				searchForm.sstatus.options[1].selected=true;
			} else if(sstatus=="1") {
				searchForm.sstatus.options[2].selected=true;
			} else if(sstatus=="2") {
				searchForm.sstatus.options[3].selected=true;
			}
		}
		
		function showOrderItem(orderId){
			location.href="OrderManageServlet?act=orderItem&fromPage=/Admin/Order_Item.jsp&orderId=" + orderId;
		}
		
		function auditOrder(orderId){
			location.href="OrderManageServlet?act=orderItem&fromPage=/Admin/Order_Auditorder.jsp&orderId=" + orderId;
		}
		
		function checkOrderId() {
			var frm=document.forms['searchForm'];
			var orderId=frm.elements['orderId'].value;
			var order = /[0-9]+$/;
			if(!order.test(orderId) || orderId.length==0) {
				alert("�������ֻ��Ϊ����");
				searchForm.orderId.focus();
				return false;
			}
		}
	</script>
</head>
<body>
<h1>
<span><a href='<c:url value="/Admin/Admin_Main.jsp" />'>��������</a>  - �����б� </span>
</h1>
<div class="form-div">
  <form action="<c:url value="/servlet/OrderManageServlet"/>" name="searchForm" onsubmit="return checkOrderId();">
    <img src="<c:url value="/Admin/images/icon_search.gif" />" width="26" height="22" border="0" alt="SEARCH" />
    &nbsp;�����û� &nbsp;<input type="text" name="scuser" value="${scuser}" />
    &nbsp;������� &nbsp;<input type="text" name="orderId" value="${orderId}" />
    <br/><img src="<c:url value="/Admin/images/icon_search.gif" />" width="26" height="22" border="0" alt="SEARCH" />
    &nbsp;���״̬ &nbsp;<select name="sstatus" style="width:80px;" >
        <option value="">���м�¼</option>
        <option value="0">ͨ�����</option>
        <option value="1">���ʧ��</option>
        <option value="2">�ȴ����</option>
    </select>
    <input type="submit" value=" ���� " class="button" />
    <input type="hidden" name="act" value="orderList" />
    <input type="hidden" name="fromPage" value="/Admin/Order_List.jsp" />
    <input type="hidden" name="curPage" value="1" />
  </form>
</div>
<div class="list-div" id="listDiv">
<table cellpadding="0" cellspacing="1">
  <tr>
    <th>�������</th>
    <th>�����û�</th>
    <th>��ʵ����</th>
    <th>�µ�ʱ��</th>
    <th>������</th>
    <th>����</th>
  </tr>
  <c:forEach var="orderBean" items="${orderList}">
    <tr>
    <td align="center">${orderBean.oid}</td>
    <td align="center">${orderBean.cid}</td>
    <td align="center">${orderBean.oname}</td>
    <td align="center">${orderBean.orderdate}</td>
    <td align="center" style="color:#FF0000;">${orderBean.ostatus}</td>
   	<td align="center">
   		<a href="#" onClick="showOrderItem('${orderBean.oid}');return false;">��������</a>&nbsp;
   		<a href="#" onClick="auditOrder('${orderBean.oid}');return false;">��˶���</a>
   	</td>
 	</tr>
  </c:forEach>
    <tr>
      <td align="right" nowrap="true" colspan="8" height="22px">
            <div id="turn-page">
        �ܼ�  <span id="totalRecords">${recordSize}</span>
        ����¼��Ϊ <span id="totalPages">${pageCount}</span>
        ҳ��ǰ�� <span id="pageCurrent">${curPage}</span>
        ҳ 
        <span id="page-link">
        <c:choose>
		<c:when test="${curPage==1}">
		<span>��ҳ</span>
		<span>��һҳ</span>
		</c:when>
		<c:otherwise>
		<a href="#" onClick="pagingOnClick(1);return false;" >��ҳ</a>
		<a href="#" onClick="pagingOnClick(2);return false;" >��һҳ</a>
		</c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${curPage==pageCount}">
		<span>��һҳ</span>
		<span>βҳ</span>
		</c:when>
		<c:otherwise>
		<a href="#" onClick="pagingOnClick(3);return false;" >��һҳ</a>
		<a href="#" onClick="pagingOnClick(4);return false;" >β ҳ</a>
		</c:otherwise>
		</c:choose>
        </span></div></td>
  </tr>
</table>
		<script langauge="javascript">
            window.onload = function()
            {
              selected(${sstatus});
            }
        </script>
</div>
<div id="footer">��Ȩ���� &copy;E-site</div>
</body>
</html>