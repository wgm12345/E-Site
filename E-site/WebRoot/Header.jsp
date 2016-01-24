<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        
<head>
   
<!--      header 的样式和js 
    <link href="<c:url value='/bootstrap-3.3.5-dist/css/bootstrap.css' />" rel="stylesheet" type="text/css" />
    <link href="<c:url value='/images/css/page-core.css' />" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<c:url value='/js/user.js' />"></script>
    <script type="text/javascript" src="<c:url value='/bootstrap-3.3.5-dist/js/bootstrap.js' />"></script>
-->  

    <title>网站首页</title>

        <script language="javascript">

                function praise(fid) {
                    location.href="MainServlet?fromPage=/Show.jsp&fid=" + fid + "&act=praiseFood";
                }
        function showShopInfo(sid) {
            location.href="MainServlet?fromPage=/Shop_Info.jsp&sid="+ sid+ "&act=enterShop";
        }
        function pagingOnClick(num){
            if(num==1){
                searchForm.curPage.value=1;
            }
            if(num==2){
                searchForm.curPage.value=${curPage} - 1;
            }
            if(num==3){
                searchForm.curPage.value=${curPage} + 1;
            }
            if(num==4){
                searchForm.curPage.value=${pageCount};
            }
            searchForm.submit();
        }
    </script>
</head>

<div class="z_top_container">
    <div class="z_top b-header-blur">
        <div class="b-header-mask-wrp"><div class="b-header-mask-bg" style="background-image: url(/E-site/images/headBackgroundImage.jpg);"></div><div class="b-header-mask"></div></div>
        <div class="z_header">
            <div class="z_top_nav row">
                <ul class="col-lg-offset-2">
                    <!--<li class="home">-->
                    <!--<a class="i-link" href="http://www.bilibili.com/"><span>主站</span></a>-->
                    <!--</li>-->
                    <!--<li class="hbili"><a class="i-link" href="http://h.bilibili.com/" title="画友">画友</a></li>-->
                    <!--<li hasframe="true">-->
                    <!--<a class="i-link" href="http://game.bilibili.com/" title="游戏中心">游戏中心</a>-->
                    <!--<div class="i_div game" data-frame="game" style="display: none;"><iframe src="//www.bilibili.com/page-proxy/game-nav.html" frameborder="0" width="100%" height="100%"></iframe></div>-->
                    <!--</li>-->
                    <!--<li class="live"><a class="i-link" target="_blank" href="http://live.bilibili.com" title="直播">直播<em class="beta"></em></a></li>-->
                    <!--<li class="yoo" hasframe="true">-->
                    <!--<a class="i-link" target="_blank" href="http://yoo.bilibili.com/index.html" title="日本游">日本游<em class="new"></em></a>-->
                    <!--<div class="i_div travel" data-frame="travel" style="display: none;"><iframe src="//www.bilibili.com/page-proxy/yoo-nav.html" frameborder="0" width="100%" height="100%"></iframe></div>-->
                    <!--</li>-->
                    <li><a class="i-link" href="<c:url value='/Show.jsp' />" >首页</a></li>
                    <li><a class="i-link" href="<c:url value='/Customer/Change_Info.jsp' />" >会员中心</a></li>
                    <li><a class="i-link" href="<c:url value='/Cart.jsp' />" >购物车</a></li>
                    <li><a class="i-link" href="<c:url value='/Customer/Show_Orderlist.jsp' />" >查看订单</a></li>

                    <li id="globalTopNavLast"><a class="i-link" href="<c:url value='/Admin_Login.jsp' />" >后台管理</a></li>
                    <li id="globalTopNavRight">&nbsp;</li>
                </ul>
            </div>
            <!--  -->
            <div class="uns_box">
                <ul class="menu">
                    <c:choose>
                        <c:when test="${sessionScope.user ne null}">
                            <!--<li id="i_menu_profile_btn" guest="no" class="u-i i_user" i_menu="#i_menu_profile" style="display: list-item;">-->
                            <!--<a class="i-link" value='/Customer/Change_Info.jsp' />">您好，${sessionScope.user.cid}，欢迎回来!</a>-->
                            <!--</li>-->
                            <!--&lt;!&ndash;href="<c:url value='/servlet/LogoutServlet?act=user' />">退出</a> </span>&ndash;&gt;-->
                            <li guest="no" i_menu="community_msg" class="u-i" style="display: list-item;">
                                <a class="i-link" href="<c:url value='/Customer/Change_Info.jsp' />" target="_blank">您好，${sessionScope.user.cid}</a>
                            </li>
                            <li guest="no" i_menu="community_msg" class="u-i" style="display: list-item;">
                                <a class="i-link" href="<c:url value='/servlet/LogoutServlet?act=user' />">退出</a>
                            </li>
                        </c:when>
                        <c:when test="${sessionScope.user eq null}">
                            <li guest="no" i_menu="community_msg" class="u-i" style="display: list-item;">
                                <a class="i-link" href="<c:url value='/Customer_Reg.jsp' />" >注册</a>
                            </li>
                            <li guest="no" i_menu="community_msg" class="u-i" style="display: list-item;">
                                <a class="i-link" href="<c:url value='/Customer_Login.jsp' />" >登陆</a>
                            </li>
                        </c:when>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
</div>


<<<<<<< .mine
<div class="header"  style="background-image: url("http://i1.hdslb.com/headers/ba57e0a7561ff1a2faca55405fe06d79.png");">
=======
<div class="header"  style="background-image: url(/E-site/images/headBackgroundImage.jpg);">
>>>>>>> .r91
    <div class="header-layer" style="height: 170px;"></div>
    <a class="header-link" href="#" target="_blank" style="height: 170px;"></a>
    <div class="h-center">
        <a href="/" class="logo" style="background-image: url(/E-site/images/icon/logo.png);"></a>
    </div>
    <div class="search">
        <form id="searchForm" name="searchForm" method="get"
              action="<c:url value='/servlet/MainServlet' />">

            <input type="hidden" name="fromPage" value="/Show.jsp" />
            <input name="skey" type="text" id="keyword" value="${param.skey}" alt="请输入关键字,支持模糊查询!" class="search-keyword" />
            <button class="search-submit">
                <a href="<c:url value='/images/btn_search.gif' />">搜索</a>
            </button>
            <!--<input type="image" src="<c:url value='/images/btn_search.gif' />"-->
            <!--class="search-submit" />-->
            <input type="hidden" name="curPage" value="1" />
        </form>
    </div>
</div>