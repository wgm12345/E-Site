<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>
<c:if test="${foodList==null}">
	<c:redirect
		url="/servlet/ProductManageServlet?fromPage=/Admin/Product_List1.jsp&act=foodlist"></c:redirect>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
<meta http-equiv="expires" content="Wed, 26 Feb 1970 08:21:57 GMT" />
<title>�������� - ��Ʒ�б�</title>
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
		if (confirm("��ȷ��Ҫɾ������Ʒ��?")) {
				location.href = "<c:url value='/servlet/ProductManageServlet?fromPage=/Admin/Product_List1.jsp&del="
						+ suser + "&act=delfood' />"
		}
	}

	function showinfo(suser) {
		location.href = "<c:url value='/Admin/Product_Info.jsp?suser=' />"
				+ suser;
	}
	function editinfo(suser) {
		location.href = "<c:url value='/Admin/Product_Einfo1.jsp?suser=' />"
				+ suser;
	}
</script>
</head>
<body>
	<h1>
		<span class="action-span"><a
			href="<c:url value="/Admin/Product_Add.jsp" />">������Ʒ</a></span> 
			<span><a href="<c:url value='/Admin/Admin_Main.jsp ' />">��������</a> - ��Ʒ�б� </span>
	</h1>
	<div class="form-div">
		<form action="<c:url value="/servlet/ProductManageServlet"/>"
			name="searchForm">
			<img src="<c:url value="/Admin/images/icon_search.gif" />" width="26"
				height="22" border="0" alt="SEARCH" />&nbsp;��Ʒ��� &nbsp; <input
				type="text" name="suser" value="${param.suser}" /> &nbsp;��Ʒ����
			&nbsp; <input type="text" name="sname" value="${param.sname}" />&nbsp;
			<input type="submit" value=" ���� " class="button" /> <input
				type="hidden" name="act" value="foodlist" /> <input type="hidden"
				name="fromPage" value="/Admin/Product_List1.jsp" /> <input
				type="hidden" name="curPage" value="1" />
		</form>
	</div>
	<div class="list-div" id="listDiv">
		<!--�û��б�����-->
		<table cellpadding="0" cellspacing="1">
			<tr>
			    <th>ͼƬ</th>
				<th>��Ʒ���</th>
				<th>��Ʒ����</th>
				<th>����</th>
				<th>����</th>
			</tr>
			<c:forEach var="userBean" items="${foodList}">
				<tr>
					<td align="center"><img src="<c:url value="${userBean.fimg}"/>" class="cimg" alt="${userBean.fname}"   width="126"   height="88"/></td>
					<td align="center">${userBean.fid}</td>
					<td align="center">${userBean.fname}</td>
					<td align="center">${userBean.fdescription}</td>
					<td align="center" width="100"><span
						onclick="showinfo('${userBean.fid}');" style="cursor:hand;"
						title="�鿴��Ʒ����"> <img
							src="<c:url value="/Admin/images/icon_view.gif"/>" border="0"
							height="16" width="16" /></span> <span
						onclick="editinfo('${userBean.fid}');" style="cursor:hand;"
						title="�༭��Ʒ����"> <img
							src="<c:url value="/Admin/images/icon_edit.gif"/>" border="0"
							height="16" width="16" /></span> <span
						onclick="confirm_redirect('${userBean.fid}');" style="cursor:hand;"
						style="cursor:hand;" title="ɾ����Ʒ"> <img
							src="<c:url value="/Admin/images/icon_drop.gif"/>" border="0"
							height="16" width="16" /></span></td>
				</tr>
			</c:forEach>
			<tr>
				<td align="right" nowrap="true" colspan="7" height="22px">
					<div id="turn-page">
						�ܼ� <span id="totalRecords">${recordSize}</span> ����¼��Ϊ <span
							id="totalPages">${pageCount}</span> ҳ��ǰ�� <span id="pageCurrent">${curPage}</span>
						ҳ <span id="page-link"> <c:choose>
								<c:when test="${curPage==1}">
									<span>��ҳ</span>
									<span>��һҳ</span>
								</c:when>
								<c:otherwise>
									<a href="#" onClick="pagingOnClick(1);return false;">��ҳ</a>
									<a href="#" onClick="pagingOnClick(2);return false;">��һҳ</a>
								</c:otherwise>
							</c:choose> <c:choose>
								<c:when test="${curPage==pageCount}">
									<span>��һҳ</span>
									<span>βҳ</span>
								</c:when>
								<c:otherwise>
									<a href="#" onClick="pagingOnClick(3);return false;">��һҳ</a>
									<a href="#" onClick="pagingOnClick(4);return false;">β ҳ</a>
								</c:otherwise>
							</c:choose>
						</span>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div id="footer">��Ȩ���� &copy; E-site</div>
	<c:if test="${not empty param.msg}">
		<script type="text/javascript" language="javascript">
		alert("${param.msg}");
		location.href="<c:url value='/Product_List1.jsp'/>";
	</script>
	</c:if>
</body>
</html>