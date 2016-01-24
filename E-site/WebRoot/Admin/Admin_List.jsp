<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>
<c:if test="${adminList==null}">
	<c:redirect
		url="/servlet/AdminManageServlet?fromPage=/Admin/Admin_List.jsp&act=adminList"></c:redirect>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
<meta http-equiv="expires" content="Wed, 26 Feb 1970 08:21:57 GMT" />
<title>�������� - ����Ա�б�</title>
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
		if (confirm("��ȷ��Ҫɾ���ù���Ա�˺���?")) {
				location.href = "<c:url value='/servlet/AdminManageServlet?fromPage=/Admin/Admin_List.jsp&del="
						+ suser + "&act=deladmin' />"
		}
	}

	function showinfo(suser) {
		location.href = "<c:url value='/Admin/Admin_Info.jsp?suser=' />"
				+ suser;
	}
	function editinfo(suser) {
		location.href = "<c:url value='/Admin/Admin_Einfo.jsp?suser=' />"
				+ suser;
	}
</script>
</head>
<body>
	<h1>
		<span class="action-span"><a
			href="<c:url value="/Admin/Admin_Add.jsp" />">���ӹ���Ա</a></span> <span><a
			href="#">��������</a> - ����Ա�б� </span>
	</h1>
	<div class="form-div">
		<form action="<c:url value="/servlet/AdminManageServlet"/>"
			name="searchForm">
			<img src="<c:url value="/Admin/images/icon_search.gif" />" width="26"
				height="22" border="0" alt="SEARCH" />&nbsp;����Ա�û��� &nbsp; <input
				type="text" name="suser" value="${param.suser}" /> &nbsp;����Ա��ʵ����
			&nbsp; <input type="text" name="sname" value="${param.sname}" />&nbsp;
			<input type="submit" value=" ���� " class="button" /> <input
				type="hidden" name="act" value="adminList" /> <input type="hidden"
				name="fromPage" value="/Admin/Admin_List.jsp" /> <input
				type="hidden" name="curPage" value="1" />
		</form>
	</div>
	<div class="list-div" id="listDiv">
		<!--�û��б�����-->
		<table cellpadding="0" cellspacing="1">
			<tr>
				<th>�û���</th>
				<th>��ʵ����</th>
				<th>�ʼ���ַ</th>
				<th>�绰����</th>
				<th>����</th>
			</tr>
			<c:forEach var="userBean" items="${adminList}">
				<tr>
					<td align="center">${userBean.mid}</td>
					<td align="center">${userBean.mname}</td>
					<td align="center">${userBean.memail}</td>
					<td align="center">${userBean.mphone}</td>
					<td align="center"><span
						onclick="showinfo('${userBean.mid}');" style="cursor:hand;"
						title="�鿴����Ա����"> <img
							src="<c:url value="/Admin/images/icon_view.gif"/>" border="0"
							height="16" width="16" /></span> <span
						onclick="editinfo('${userBean.mid}');" style="cursor:hand;"
						title="�༭����Ա����"> <img
							src="<c:url value="/Admin/images/icon_edit.gif"/>" border="0"
							height="16" width="16" /></span> <span
						onclick="confirm_redirect('${userBean.mid}');" style="cursor:hand;"
						style="cursor:hand;" title="ɾ������Ա"> <img
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
		location.href="<c:url value='/Admin_List.jsp'/>";
	</script>
	</c:if>

</body>
</html>