<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	<link href="<c:url value='/images/css/bootcss.css' />" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/images/css/style.css' />" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/css/main.css' />" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/css/reset.css' />" rel="stylesheet" type="text/css" />
	
	<title>用户资料</title>
	<script src="/js/jquery/jquery-1.10.0.js" type=text/javascript></script>
	<script src="/js/jquery/jquery.validate-1.13.1.js" type="text/javascript"></script>
	
  <script language="javascript">
        var email_empty = "Email地址不能为空";
        var email_format = "Email 地址无效";
		var phone_empty = "电话号码不能为空";
		var phone_format = "电话号码格式错误";
  </script>
	<script language="javascript" src="<c:url value='/js/calendar.js' />"></script>
    <script type="text/javascript" src="<c:url value='/js/user.js' />"></script>
</head>
<body>
<%@include file="/Header.jsp" %>
<div class="hr_25"></div>
<div id="container">
<div style="height:400px;border:0px solid #000;">
<div class="shoppingCart comWidth">
<div class="shopping_item">
<div  style="height:250px;width:20%;float:left" >
 <h3 class="shopping_tit">会员中心</h3>

  <ul class="listStyle">
    <li><a href="<c:url value='/Customer/Change_Info.jsp' />">用户信息</a></li>
    <li><a href="<c:url value='/Customer/Change_Pass.jsp' />">修改密码</a></li>
    <li><a href="<c:url value='/Cart.jsp' />">查看购物车</a></li>
    <li><a href="<c:url value='/Customer/Show_Orderlist.jsp' />">我的订单</a></li>
    <li><a href="<c:url value='/servlet/LogoutServlet?act=user' />">退出</a></li>
  </ul>
	
</div>
<div style="float:left; width:80%;padding-left:10px;">
  <h3 class="shopping_tit">用户资料修改</h3>
        <div class="globalModuleContent">
          <form name="formEdit" action="<c:url value='/servlet/UpdateServlet' />" method="post" onsubmit="return checkUpdateInfoForm();">
            <table cellspacing="0" class="tableList">
              <tr>
                <th width="100">用&nbsp;&nbsp;户&nbsp;&nbsp;名:</th>
                <td> <input name="suser" type="text" class="textInput2" size="30" maxlength="30" readonly="readonly" value="${sessionScope.user.cid}" /></td>
              </tr>
              <tr>
                <th>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</th>
                <td>
                <c:choose>
                	<c:when test="${sessionScope.user.csex=='man'}">
                	<input type="radio" name="ssex" value="man" checked="checked" />男&nbsp;&nbsp;<input type="radio" name="ssex" value="woman" />女
                	</c:when>
                	<c:otherwise>
                	<input type="radio" name="ssex" value="man" />男&nbsp;&nbsp;<input type="radio" name="ssex" value="woman" checked="checked" />女
                	</c:otherwise>
                </c:choose>
                </td>
              </tr>
              <tr>
                <th>真实姓名:</th>
                <td>
                  <input name="sname" type="text" class="textInput" size="30" maxlength="30" value="${sessionScope.user.cname}" /></td>
              </tr>

              <tr>
                <th>电子邮箱:</th>
                <td><input name="semail" type="text" size="30" class="textInput" value="${sessionScope.user.cemail}" /></td>
              </tr>
              <tr>
                <th>电话号码:</th>
                <td><input name="sphone" type="text" size="30" class="textInput" value="${sessionScope.user.cphone}" /></td>
              </tr>
              <tr>
                <th>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</th>
                <td><input name="saddress" type="text" size="30" class="textInput" value="${sessionScope.user.caddress}"/></td>
              </tr>

              <tr>
                <th>注册时间:</th>
                <td><input name="dregdate" type="text" size="30" class="textInput2" value="${sessionScope.user.cregdate}" readonly="readonly" /></td>
              </tr>
              <tr>
                <th>最后登陆:</th>
                <td><input name="dlastdate" type="text" size="30" class="textInput2" value="${sessionScope.user.clastdate}" readonly="readonly" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                <div style="height:10px;"></div>
                  <input type="hidden" name="fromPage" value="/Customer/Change_Info.jsp" />
                  <input type="hidden" name="msg" value="/msg.jsp" />
                  <input type="hidden" name="act" value="updateInfo" />
                  <input  type="submit" name="submit"  value="确定修改" 
                  	class=" button button-raised button-pill button-primary button-small" 
                  	style="text-align:center;display:block; pading:0 ; margin:0;"/>&nbsp;&nbsp;
					
                </td>
              </tr>
            </table>
          </form>
		</div>
	</div>
</div>
</div>
</div>
</div>
 <div id="globalFooter">
	<div id="footerLine">
				<img src="<c:url value='/images/footer_line.jpg' />" alt="" />
			</div></div>
		<%@include file="/Footer.jsp" %>
</body>
</html>