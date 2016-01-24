<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>
<c:choose>
	<c:when test="${not empty param.success}">
		<c:set var="success" value="${param.success}" scope="request" />
	</c:when>
	<c:otherwise>
		<c:set var="success" value="Customer_Login.jsp" scope="request" />
		<c:if test="${sessionScope.user ne null}">
			<c:redirect url="Customer/Change_Info.jsp" />
		</c:if>
	</c:otherwise>
</c:choose>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
		<meta http-equiv="expires" content="Wed, 26 Feb 1970 08:21:57 GMT" />
		
		 <link href="<c:url value='/bootstrap-3.3.5-dist/css/bootstrap.css' />" rel="stylesheet" type="text/css" />
    	<link href="<c:url value='/images/css/page-core.css' />" rel="stylesheet" type="text/css" />
    	<script type="text/javascript" src="<c:url value='/js/user.js' />"></script>
    	<script type="text/javascript" src="<c:url value='/bootstrap-3.3.5-dist/js/bootstrap.js' />"></script>
		
		<script src="js/jquery/jquery-1.10.0.js" type=text/javascript></script>
		<script src="js/jquery/jquery.validate-1.13.1.js" type="text/javascript"></script>
		<link href="<c:url value='images/css/style.css' />" rel="stylesheet" type="text/css" />
		<link href="<c:url value='images/css/bootcss.css' />" rel="stylesheet" type="text/css" />
		<link href="<c:url value='css/main.css' />" rel="stylesheet" type="text/css" />
		<link href="<c:url value='css/reset.css' />" rel="stylesheet" type="text/css" />
		<title>会员登陆</title>
		<script type="text/javascript" src="<c:url value='js/user.js ' />"></script>
	</head>
	<body>
		<%@include file="Header.jsp" %>
		<div id="container">
		<div class="shoppingCart comWidth">
			<div class="shopping_item">
				<h3 class="shopping_tit">
					会员登陆
				</h3>
				<form name="loginUser" action="<c:url value='/servlet/LoginServlet' />"
					method="post" onSubmit="return checkLoginForm();">
					<div class="globalModuleContent">
						<ul class="login" style="color:black;">
							<li>
								用户名:
								<input name="suser" type="text" class="textInput"
									value="${cookie.suser.value}" />
							</li>
							<li>
								密&nbsp;&nbsp;&nbsp; 码:
								<input name="spwd" type="password" class="textInput" />
							</li>
							<li>
								验证码:
								<input name="rand" type="text" class="textInput2" size="4"
									maxlength="4" />
								&nbsp;&nbsp;
								<img src="<c:url value='/inc/rand.jsp' />" onClick="this.src='<c:url value='/inc/rand.jsp' />'"
									class="imgrand" />
							</li>
							   <div style="height:10px;"></div>
							<li class="submitli">
				<!--				<input type="image" name="login" src="<c:url value='/images/btn_signin.gif' />"
									class="vAlign" />
								<a href="<c:url value='/Customer_Reg.jsp' />"><img src="<c:url value='/images/btn_register.gif' />"
										alt="注册新会员" class="vAlign" />
								</a>
					-->	
					<input  type="submit" name="login"  value="	登录	" class=" button button-raised button-pill button-primary button-small" style="text-align:center;display:block; float:left;pading:0 ; margin:0;"/>&nbsp;&nbsp;
					<div class="button button-caution button-primary button-pill button-small" style="display:block; float:left;pading:0 ; margin:0 10px ;">
						<a href="<c:url value='/Customer_Reg.jsp' />" >注册</a>
					</div>
					
						<input type="hidden" name="fromPage" value="${success}" />
								<input type="hidden" name="msg" value="/msg.jsp" />
							</li>
						</ul>
					</div>
				</form>
			</div>
			
			</div>
		</div>
		<div class="hr_25"></div>
		<%@include file="/Footer.jsp" %>
<script language="javascript">
  <!--
		var username_empty = "用户名不能为空。";
		var password_empty = "登录密码不能为空。";
		var rand_msg = "验证码只能是4位数!";
	-->
</script>
	</body>
</html>
