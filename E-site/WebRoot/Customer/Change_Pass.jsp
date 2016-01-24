<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>
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
	
	<title>用户中心</title>
	<script type="text/javascript" src="<c:url value='/js/user.js' />"></script>
</head>
<body>
<%@include file="/Header.jsp" %>
<div style="height:250px;border:0px solid #000;">
<div id="container">
<!--
<div id="globalLeft">
  
<div class="globalModule">
  <h3>会员中心</h3>
  <ul class="listStyle">
    <li><a href="<c:url value='/Customer/Change_Info.jsp' />">用户信息</a></li>
    <li><a href="<c:url value='/Customer/Change_Pass.jsp' />">修改密码</a></li>
    <li><a href="<c:url value='/Cart.jsp' />">查看购物车</a></li>
    <li><a href="<c:url value='/Customer/Show_Orderlist.jsp' />">我的订单</a></li>
    <li><a href="<c:url value='/servlet/LogoutServlet?act=user' />">退出</a></li>
  </ul>
</div>
</div>-->
<div class="shoppingCart comWidth">
	<div class="shopping_item">
	<div  style="height:200px;width:20%;float:left" >
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
        <h3 class="shopping_tit">密码修改</h3>
        <div class="globalModuleContent">
          <form name="resetPwdUser" action="<c:url value='/servlet/UpdateServlet' />" method="post" onsubmit="return checkResetPwdForm();">
            <table cellspacing="0" class="tableList">
              <tr>
                <th width="100">原始密码:</th>
                <td><input name="old_password" type="password" size="30" class="textInput" /></td>
              </tr>
              <tr>
                <th>新&nbsp;&nbsp;密&nbsp;&nbsp;码:</th>
                <td><input name="new_password" type="password" size="30" class="textInput" onkeyup="checkIntensity(this.value)"/></td>
              </tr>
              <tr>
           		 <th>密码强度:</th>
           		 <td>
              		 <table width="130" border="0" cellspacing="0">
                	   <tr align="center">
                			<td width="33%" id="pwd_lower" style="border-bottom:2px solid #dadada;">弱</td>
                			<td width="33%" id="pwd_middle" style="border-bottom:2px solid #dadada;">中</td>
               			    <td width="33%" id="pwd_high" style="border-bottom:2px solid #dadada;">强</td>
             		   </tr>
             		 </table>
             	 </td>
         	  </tr>
              <tr>
                <th>确认密码:</th>
                <td><input name="comfirm_password" type="password" size="30" class="textInput" /></td>
              </tr>
              <tr>
                <td></td>
                <td>
                <div style="height:10px;"></div>
                  <input  type="submit" name="submit"  value="确定修改" class=" button button-raised button-pill button-primary button-small" style="text-align:center;display:block; float:left;pading:0 ; margin:0;"/>&nbsp;&nbsp;
                  <input type="hidden" name="fromPage" value="/Customer/Change_Pass.jsp" />
                  <input type="hidden" name="msg" value="/msg.jsp" />
                  <input type="hidden" name="act" value="updatePwd" />
                </td>
              </tr>
            </table>
          </form>
		</div>
	</div></div>
</div>
</div></div>
 <div id="globalFooter">
	<div id="footerLine">
				<img src="<c:url value='/images/footer_line.jpg' />" alt="" />
			</div></div>
  <script language="javascript">
		var old_password_empty = "旧密码不能为空。";
		var new_password_empty = "新密码不能为空。";
		var comfirm_password_empty = "确认密码不能为空。";
		var old_password_shorter = "旧密码不能小于 3 个字符.";
		var new_password_shorter = "新密码不能小于 3 个字符.";
		var comfirm_password_shorter = "确认密码不能小于 3 个字符.";
		var comfirm_password_msg = "两次输入的密码不一致";
  </script>
	<%@include file="/Footer.jsp" %>
</body>
</html>