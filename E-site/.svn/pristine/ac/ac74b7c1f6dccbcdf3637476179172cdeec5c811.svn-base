<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
		<meta http-equiv="expires" content="Wed, 26 Feb 1970 08:21:57 GMT" />
		<title>管理中心 - 订单详细信息</title>
		<link href="<c:url value="/Admin/styles/general.css" />" rel="stylesheet" type="text/css" />
		<link href="<c:url value="/Admin/styles/main.css" />" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<h3>
			<span><a href='<c:url value="/Admin/Admin_Main.jsp" />'>管理中心</a> - 订单详细信息页 </span>
		</h3>
		<div class="main-div1">
			<table width="100%" class="btable">
				<tr>
					<td>
						<table border="0" align="center" cellpadding="0" cellspacing="0" class="orderitemtable">
							<tr>
								<th>
									所属用户：
								</th>
								<td>
									${orderBean.cid}&nbsp;
								</td>
							</tr>
							<tr>
								<th>
									真实姓名：
								</th>
								<td>
									${orderBean.oname}&nbsp;
								</td>
							</tr>
				
							<tr>
								<th>
									电话号码：
								</th>
								<td>
									${orderBean.ophone}&nbsp;
								</td>
							</tr>
							<tr>
								<th>
									联系地址：
								</th>
								<td>
									${orderBean.oaddress}&nbsp;
								</td>
							</tr>
							<tr>
								<th>
									下单时间：
								</th>
								<td>
									${orderBean.orderdate}&nbsp;
								</td>
							</tr>
							<tr>
								<th>
									联系邮箱：
								</th>
								<td>
									${orderBean.oemail}&nbsp;
								</td>
							</tr>
				             <tr>
								<th>
									付款方式：
								</th>
								<td>
									${orderBean.opaytype}&nbsp;
								</td>
							</tr>
							<tr>
								<th>
									件数：
								</th>
								<td>
									${orderBean.osize}&nbsp;
								</td>
							</tr>
							<tr>
								<th>
									总金额：
								</th>
								<td>
									${orderBean.ototalprice}&nbsp;
								</td>
							</tr>
							<tr>
								<th>
									审核情况：
								</th>
								<td style="color:red;">
									${orderBean.ostatus}&nbsp;
								</td>
							</tr>
						
			
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div class="list-div" id="listDiv">
		<table cellpadding="0" cellspacing="1">
		  <tr>
			<th>商品图片</th>
			<th>商品编号</th>
			<th>商品名称</th>
			<th>商品单价</th>
			<th>商品数量</th>
		  </tr>
		<c:forEach var="orderItemBean" items="${orderItemList}">
		  <tr>
			<td align="center">
			<img src="<c:url value='${orderItemBean.fimg}' />" class="foodimg" alt="${orderItemBean.fname}" width="126"   height="88"/>&nbsp;
			</td>
			<td align="center">
			${orderItemBean.fid}&nbsp;
			</td>
			<td align="center">
			${orderItemBean.fname}&nbsp;
			</td>
			<td align="center" style="color:red;">
			￥${orderItemBean.fprice}&nbsp;
			</td>
			<td align="center">
			${orderItemBean.ncount}&nbsp;
			</td>
		  </tr>
		</c:forEach>
		  <tr>
			<td colspan="5" style="color:red;" align="right">合计：￥${orderBean.ototalprice}&nbsp;</td>
		  </tr>
		  <tr>
			<td colspan="5" align="center" style="border:0px;padding-top:5px;"><input type="button" onclick="javasctipr:history.back();" value="返回上一页" /></td>
		  </tr>
		</table>
		</div>
		<div id="footer">
			版权所有 &copy; E-site
		</div>
	</body>
</html>
