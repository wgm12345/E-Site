<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>
<c:if test="${sellerList==null}">
	<c:redirect
		url="/servlet/SellerManageServlet?fromPage=/Admin/Seller_List.jsp&act=sellerList"></c:redirect>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
<meta http-equiv="expires" content="Wed, 26 Feb 1970 08:21:57 GMT" />
<title>管理中心 - 店家列表</title>
<link href="<c:url value="/Admin/styles/general.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/Admin/styles/main.css" />" rel="stylesheet"
	type="text/css" />
<script language="javascript">
	function pagingOnClick(num) {
		if (num == 1) {
			searchForm.curPage.value = 1;
		}
		if (num == 2) {
			searchForm.curPage.value = ${curPage} - 1;
		}
		if (num == 3) {
			searchForm.curPage.value = ${curPage} + 1;
		}
		if (num == 4) {
			searchForm.curPage.value = ${pageCount};
		}
		searchForm.submit();
	}

	function confirm_redirect(suser) {
		if (confirm("您确定要删除该店家账号吗?")) {
				location.href = "<c:url value='/servlet/SellerManageServlet?fromPage=/Admin/Seller_List.jsp&del="
						+ suser + "&act=delseller' />"
		}
	}

	function showinfo(suser) {
		location.href = "<c:url value='/Admin/Seller_Info.jsp?suser=' />"
				+ suser;
	}
	function editinfo(suser) {
		location.href = "<c:url value='/Admin/Seller_Einfo.jsp?suser=' />"
				+ suser;
	}
</script>
</head>
<body>
	<h1>
		<span class="action-span"><a
			href="<c:url value="/Admin/Seller_Add.jsp" />">添加店家</a></span> <span><a
			href="#">管理中心</a> - 店家列表 </span>
	</h1>
	<div class="form-div">
		<form action="<c:url value="/servlet/SellerManageServlet"/>"
			name="searchForm">
			<img src="<c:url value="/Admin/images/icon_search.gif" />" width="26"
				height="22" border="0" alt="SEARCH" />&nbsp;店家编号 &nbsp; <input
				type="text" name="suser" value="${param.suser}" /> &nbsp;店名
			&nbsp; <input type="text" name="sname" value="${param.sname}" />&nbsp;
			<input type="submit" value=" 搜索 " class="button" /> <input
				type="hidden" name="act" value="sellerList" /> <input type="hidden"
				name="fromPage" value="/Admin/Seller_List.jsp" /> <input
				type="hidden" name="curPage" value="1" />
		</form>
	</div>
	<div class="list-div" id="listDiv">
		<!--用户列表部分-->
		<table cellpadding="0" cellspacing="1">
			<tr>
				<th>用户名</th>
				<th>真实姓名</th>
				<th>邮件地址</th>
				<th>电话号码</th>
				<th>操作</th>
			</tr>
			<c:forEach var="userBean" items="${sellerList}">
				<tr>
					<td align="center">${userBean.sid}</td>
					<td align="center">${userBean.sname}</td>
					<td align="center">${userBean.semail}</td>
					<td align="center">${userBean.sphone}</td>
					<td align="center"><span
						onclick="showinfo('${userBean.sid}');" style="cursor:hand;"
						title="查看店家资料"> <img
							src="<c:url value="/Admin/images/icon_view.gif"/>" border="0"
							height="16" width="16" /></span> <span
						onclick="editinfo('${userBean.sid}');" style="cursor:hand;"
						title="编辑店家资料"> <img
							src="<c:url value="/Admin/images/icon_edit.gif"/>" border="0"
							height="16" width="16" /></span> <span
						onclick="confirm_redirect('${userBean.sid}');" style="cursor:hand;"
						style="cursor:hand;" title="删除店家"> <img
							src="<c:url value="/Admin/images/icon_drop.gif"/>" border="0"
							height="16" width="16" /></span></td>
				</tr>
			</c:forEach>
			<tr>
				<td align="right" nowrap="true" colspan="7" height="22px">
					<div id="turn-page">
						总计 <span id="totalRecords">${recordSize}</span> 个记录分为 <span
							id="totalPages">${pageCount}</span> 页当前第 <span id="pageCurrent">${curPage}</span>
						页 <span id="page-link"> <c:choose>
								<c:when test="${curPage==1}">
									<span>首页</span>
									<span>上一页</span>
								</c:when>
								<c:otherwise>
									<a href="#" onClick="pagingOnClick(1);return false;">首页</a>
									<a href="#" onClick="pagingOnClick(2);return false;">上一页</a>
								</c:otherwise>
							</c:choose> <c:choose>
								<c:when test="${curPage==pageCount}">
									<span>下一页</span>
									<span>尾页</span>
								</c:when>
								<c:otherwise>
									<a href="#" onClick="pagingOnClick(3);return false;">下一页</a>
									<a href="#" onClick="pagingOnClick(4);return false;">尾 页</a>
								</c:otherwise>
							</c:choose>
						</span>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div id="footer">版权所有 &copy; 两把刷子小组</div>
	<c:if test="${not empty param.msg}">
		<script type="text/javascript" language="javascript">
		alert("${param.msg}");
		location.href="<c:url value='/Seller_List.jsp'/>";
	</script>
	</c:if>

</body>
</html>