<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>管理员登陆</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
		<meta http-equiv="expires" content="Wed, 26 Feb 1970 08:21:57 GMT" />
		<script type="text/javascript" src="js/user.js"></script>
		<link href="<c:url value='bootstrap-3.3.5-dist/css/bootstrap.css' />" rel="stylesheet" type="text/css" />
    	<link href="<c:url value='images/css/page-core.css' />" rel="stylesheet" type="text/css" />
    	<script type="text/javascript" src="<c:url value='/js/user.js' />"></script>
    	<script type="text/javascript" src="<c:url value='/bootstrap-3.3.5-dist/js/bootstrap.js' />"></script>
		<link href="<c:url value='css/main.css' />" rel="stylesheet" type="text/css" />
		<link href="<c:url value='css/reset.css' />" rel="stylesheet" type="text/css" />
		
		<script src="js/jquery/jquery-1.10.0.js" type=text/javascript></script>
		<script src="js/jquery/jquery.validate-1.13.1.js" type="text/javascript"></script>
		<link href="<c:url value='images/css/style.css' />" rel="stylesheet" type="text/css" />
		<link href="<c:url value='images/css/bootcss.css' />" rel="stylesheet" type="text/css" />
		
		<c:if test="${sessionScope.LoginCount <= 0}">
		<c:remove var="LoginCount" scope="session" />
		<script type="text/javascript">
			alert("错误次数超过3次.浏览器自动关闭!");
			window.opener = window;
			window.close();
		</script>
		</c:if>
		<style type="text/css">
		body {
			color: white;
		}
		</style>
	</head>
	
	<body>
	<%@include file="Header.jsp" %>
	<div id="container">
	<div class="shoppingCart comWidth">
	<div class="shopping_item" style="height:300px;background:#AFCEA1; margin: 0px auto;">

		<form method="post" action="<c:url value='/servlet/AdminLoginServlet' />"
			name="AdminLogin" onsubmit="return checkAdminLoginForm();">
			<input type="hidden" name="fromPage" value="/Admin_Login.jsp" />
			<div class="globalModuleContent" style=" margin: 0px auto;">
			<ul class="login" style="color:black;">
			<li style="font-size:15px;height:30px; margin-bottom:10px;">管理员姓名:
			<input type="text" class="textInput" name="suser"  />
			</li>
			<li style="font-size:15px;height:30px; margin-bottom:10px;">管理员密码: <input class="textInput"  type="password" name="spwd" />
			</li>
			<li style="font-size:15px;height:30px; margin-bottom:10px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;验证码：<input type="text" class="textInput" name="rand" style="width:60px;" maxlength="6" />
								
			<img src="<c:url value='/inc/rand2.jsp' />" onclick="this.src='<c:url value='/inc/rand2.jsp' />'"
				class="imgrand" alt="看不清?点击更换另一个验证码." />&nbsp;
			</li><li>
			<label>
				<input type="checkbox" value="1" name="remember" />
				请保存我这次的登录信息。
			</label></li>
			<li>
			<input type="submit" name="login"  value="进入管理中心" class=" button button-raised button-pill button-primary button-small" "/>
			</li>
			</ul></div>
		</form>
		</div></div></div>
		<c:if test="${!empty param.msg}">
		<script type="text/javascript" language="javascript" >
			alert("${param.msg}");
			location.href="<c:url value='/Admin_Login.jsp'/>";
		</script>
		</c:if>
<script language="javascript">
  <!--
		var username_empty = "管理员用户名不能为空。";
		var password_empty = "管理员密码不能为空。";
		var rand_msg = "验证码只能是6位!"
	-->
</script>
		<div class="hr_25"></div>
		<%@include file="/Footer.jsp" %>
</body>
</html>
