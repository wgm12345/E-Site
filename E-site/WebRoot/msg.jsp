<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>
<%@ page import="java.net.*" %> 
<c:choose>
	<c:when test="${sessionScope.LoginCount <= 0}">
		<c:remove var="LoginCount" scope="session" />
		<script type="text/javascript">
			alert("错误次数超过3次.浏览器自动关闭!");
			window.opener = window;
			window.close();
		</script>
	</c:when>
	<c:when test="${not empty param.msg && not empty param.fromPage}">
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<meta http-equiv="pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
				<meta http-equiv="expires" content="Wed, 26 Feb 1970 08:21:57 GMT" />
				 <link href="<c:url value='/bootstrap-3.3.5-dist/css/bootstrap.css' />" rel="stylesheet" type="text/css" />
    	<link href="<c:url value='/images/css/page-core.css' />" rel="stylesheet" type="text/css" />
    	<script type="text/javascript" src="<c:url value='/js/user.js' />"></script>
    	<script type="text/javascript" src="<c:url value='/bootstrap-3.3.5-dist/js/bootstrap.js' />"></script>
				
				
				<c:choose>
				<c:when test="${empty param.success}">
					<meta http-equiv="refresh" content="3;url=${param.fromPage}; charset=utf-8" />
				</c:when>
				<c:otherwise>
					<meta http-equiv="refresh" content="3;url=${param.fromPage}?success=${param.success}; charset=utf-8" />
				</c:otherwise>
				</c:choose>
				<link href="<c:url value='/images/css/style.css' />" rel="stylesheet" type="text/css" />
				<link href="<c:url value='/css/main.css' />" rel="stylesheet" type="text/css" />
				<link href="<c:url value='/css/reset.css' />" rel="stylesheet" type="text/css" />
				<title>系统提示</title>
			</head>
			<body>
				<%@include file="Header.jsp" %>
			<%
						String args= request.getParameter("msg");
                         String str = new String(args.getBytes("ISO-8859-1"),"UTF-8");
			%>
			
			<div class="hr_25"></div>
			<div  class="shoppingCart comWidth">
			<h3 class="shopping_tit">结果</h3>
			<div class="shopping_item" style="height: 40%">
			<p>
			<%=str%>
			<br />
						<c:choose>
						<c:when test="${empty param.success}">
							<a href="${param.fromPage}">如果您的浏览器没有自动跳转，请点击这里</a>
						</c:when>
						<c:otherwise>
							<a href="${param.fromPage}?success=${param.success}">如果您的浏览器没有自动跳转，请点击这里</a>
						</c:otherwise>
						</c:choose>
						</p>
					</div>	
					</div>
			</body>
		</html>
	</c:when>
</c:choose>
