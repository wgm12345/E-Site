<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>
<c:if test="${not empty param.msg}">
	<script type="text/javascript" language="javascript">
		alert("${param.msg}");
		location.href="Order_List.jsp";
	</script>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
		<meta http-equiv="expires" content="Wed, 26 Feb 1970 08:21:57 GMT" />
		<title>管理中心 - 审核订单</title>
		<link href="<c:url value="/Admin/styles/general.css" />" rel="stylesheet" type="text/css" />
		<link href="<c:url value="/Admin/styles/main.css" />" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<h1>
			<span><a href='<c:url value="/Admin/Admin_Main.jsp" />'>管理中心</a> - 审核订单 </span>
		</h1>
		<div class="main-div1">
			<table width="100%" class="btable">
				<tr>
					<td>
					<form name="eidtOrder" action="OrderManageServlet" method="post"> 
					<input type="hidden" name="act" value="auditOrder" />
					<input type="hidden" name="orderId" value="${orderBean.oid}" />
					<input type="hidden" name="fromPage" value="/Admin/Order_Auditorder.jsp" />
						<table border="0" align="center" cellpadding="0" cellspacing="0" class="orderitemtable">
							<tr>
								<th>
									审核情况：
								</th>
								<td width="60%">
									<select name="sstatus" style="width:80px;" >
								        <option value="0">通过审核</option>
								        <option value="1">拒绝审核</option>
								    </select>
								</td>
							</tr>
							
							<tr>
								<td colspan="2" style="padding-left:40%;">
									<input type="submit" name="submit" value="提交" /> &nbsp;
									<input type="reset" name="reset" value="重置" />
								</td>
							</tr>
						</table>
					</form>
					</td>
				</tr>
			</table>
		</div>
		<div id="footer">
			版权所有 &copy; E-site
		</div>
	</body>
</html>
