<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>
<c:if test="${foodList==null}">
	<c:redirect url="/servlet/MainServlet?fromPage=/Show.jsp"></c:redirect>
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
		<meta http-equiv="expires" content="Wed, 26 Feb 1970 08:21:57 GMT" />
		
		    	
    	<script type="text/javascript" src="<c:url value='/js/user.js' />"></script>
    	<script type="text/javascript" src="<c:url value='/js/jquery/jquery-1.11.1.js' />"></script>
    	<script type="text/javascript" src="<c:url value='/js/jquery/jquery-2.1.1.js' />"></script>		
		<link href="<c:url value='/images/css/style.css' />" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/css/main.css' />" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/css/reset.css' />" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/images/css/page-core.css' />" rel="stylesheet" type="text/css" />
		<title>网站首页</title>
		
		
		<script language="javascript">
	
		function praise(fid) {
			location.href="MainServlet?fromPage=/Show.jsp&fid=" + fid + "&act=praiseFood";
		}
		
		    
		   function showFood(fid)
		{
				location.href="MainServlet?fromPage=/ShowGoodDetail.jsp&fid=" + fid + "&act=showFood";
				 
		}
		   function showCloth(fid)
		{
				location.href="MainServlet?fromPage=/ShowGoodDetail.jsp&fid=" + fid + "&act=showFood";
				 
		}
		   function showDigit(fid)
		{
				location.href="MainServlet?fromPage=/ShowGoodDetail.jsp&fid=" + fid + "&act=showFood";
				 
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
		<script type="text/javascript">
    		$(document).ready(function(){
  				$("ul.rlist").each(function(){
    				$(this).children(":gt(6)").hide();
  				});
			});
		</script>
		
	</head>
	<body>
	<%@include file="Header.jsp" %>
	
<div class="b-page-body">        
         <!--零食区-->
        <div class="container-row">
            <div class="b-section-head">
                <div class="b-head">
                    <span class="b-head-i"></span>
                    <span class="b-head-t">
                        <a href="/video/douga.html" title="动画"><h2>零食区</h2></a>
                    </span>
                </div>
            </div>
            <div class="b-section-body">
                <div class="b-l">
                    <div class="b-head">
                        <ul class="b-slt-tab">
                            <li class="on" data-source="/index/ding.json" push=""><span class="b-tab-text">热门商品</span></li>
                            <li data-source="/index/ranking.json"><span class="b-tab-text">最新上架</span></li>
                        </ul>
                        <div class="b-link-more"><a href="#">更多<i class="b-icon b-icon-arrow-r"></i></a></div>
                    </div>
                    <div class="b-body">
                        <ul class="vidbox v-list" style="height: 640px;">
                            <c:if test="${empty foodList}"><br/>&nbsp;&nbsp;&nbsp;当前分类下没有任何商品.<br/></c:if>
                            <c:forEach var="foodBean" items="${foodList}">
                                <li >
                                    <div class="v m300" style="height: 180px;">
                                        <a class="preview" onclick="showFood('${foodBean.fid}');">
                                            <div class="medal"></div>
                                            <div class="original"></div>
                                            <div class="border"></div>
                                            <!--<img src="http://i2.hdslb.com/320_200/u_user/6f1b8d50849d2dc27881f054464aa4c7.jpg" loaded="loaded"  style="opacity: 1;">-->
                                            <img  src="<c:url value='${foodBean.fimg}' />" alt="点击图片查看具体商品" loaded="loaded"  style="opacity: 1;"/>
                                        </a>
                                        <a onclick="showFood('${foodBean.fid}');" target="_blank" title="">
                                            <div class="t" style="height: 80px;">
                                                <p class="name">
                                                    <span class="goodsPrice">${foodBean.fname}</span>
                                                </p>
                                                <p class="price">
                                                    价格： <span class="goodsPrice font-price">${foodBean.fprice}</span> 点赞：<span class="goodsPrice font-price">${foodBean.fpraise}</span><span class="btnList" style="float:right"><input type="image" src="<c:url value='/images/press_praise.jpg' />" onClick="praise('${foodBean.fid}');" alt="点赞" /></span>
                                                </p>
                                                <!--<p class="brief">-->
                                                    <!--详细说明:-->
                                                    <!--<span class="goodsPrice">${foodBean.fdescription}</span>-->
                                                <!--</p>-->
                                                
                                            </div>
                                            <!--<div class="i">-->
                                                <!--<span><i class="b-icon b-icon-v-play"></i>购买</span><span><i class="b-icon b-icon-v-dm"></i>查看</span>-->
                                            <!--</div>-->
                                        </a>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="b-r">
                    <div class="b-head">
                        <div class="left"><span class="b-head-t">排行</span></div>
                    </div>
                    <div class="b-body">
                        <ul class="rlist">
                      
                            <c:forEach var="foodRank" items="${foodRankList}">
                                <li class="on">
	                                <div class="preview">
	                                    <a href="#">
	                                        <img src="<c:url value='${foodRank.fimg}' />">
	                                    </a>
	                                </div>
                                    <a href="#" onclick="showFood('${foodRank.fid}');">${foodRank.fname}</a>&nbsp;&nbsp;
                                    <span class="goodsPrice">${foodRank.fpraise}</span><br />
                                </li>
                            </c:forEach>
                            

                        </ul>
                        <div class="more-link">
                            <a href="/video/bangumi-two-1.html#!order=hot&amp;page=1&amp;range=2015-12-25,2016-01-01">查看更多</a>
                        </div>
                    </div>
                </div>
                </div>
        </div>     
          
                 <!--服装区-->
        <div class="container-row">
            <div class="b-section-head">
                <div class="b-head">
                    <span class="b-head-i"></span>
                    <span class="b-head-t">
                        <a href="/video/douga.html" title="动画"><h2>服装区</h2></a>
                    </span>
                </div>
            </div>
            <div class="b-section-body">
                <div class="b-l">
                    <div class="b-head">
                        <ul class="b-slt-tab">
                            <li class="on" data-source="/index/ding.json" push=""><span class="b-tab-text">热门商品</span></li>
                            <li data-source="/index/ranking.json"><span class="b-tab-text">最新上架</span></li>
                        </ul>
                        <div class="b-link-more"><a href="/video/douga.html">更多<i class="b-icon b-icon-arrow-r"></i></a></div>
                    </div>
                    <div class="b-body">
                        <ul class="vidbox v-list" style="height: 640px;">
                            <c:if test="${empty clothList}"><br/>&nbsp;&nbsp;&nbsp;当前分类下没有任何商品.<br/></c:if>
                            <c:forEach var="clothBean" items="${clothList}">
                                <li>
                                    <div class="v m300" style="height: 180px;">
                                        <a class="preview" onclick="showCloth('${clothBean.fid}');">
                                            <div class="medal"></div>
                                            <div class="original"></div>
                                            <div class="border"></div>
                                            <!--<img src="http://i2.hdslb.com/320_200/u_user/6f1b8d50849d2dc27881f054464aa4c7.jpg" loaded="loaded"  style="opacity: 1;">-->
                                            <img src="<c:url value='${clothBean.fimg}' />" alt="点击图片查看具体商品" loaded="loaded"  style="opacity: 1;"/>
                                        </a>
                                        <a onclick="showCloth('${clothBean.fid}');" target="_blank" title="">
                                            <div class="t" style="height: 80px;">
                                                <p class="name">
                                                    <span class="goodsPrice">${clothBean.fname}</span>
                                                </p>
                                                <p class="price">
                                                    价格： <span class="goodsPrice font-price">${clothBean.fprice}</span> 点赞：<span class="goodsPrice font-price">${clothBean.fpraise}</span><span class="btnList" style="float:right"><input type="image" src="<c:url value='/images/press_praise.jpg' />" onClick="praise('${foodBean.fid}');" alt="点赞" /></span>
                                                </p>
                                                <!--<p class="brief">-->
                                                    <!--详细说明:-->
                                                    <!--<span class="goodsPrice">${foodBean.fdescription}</span>-->
                                                <!--</p>-->
                                                
                                            </div>
                                            <!--<div class="i">-->
                                                <!--<span><i class="b-icon b-icon-v-play"></i>购买</span><span><i class="b-icon b-icon-v-dm"></i>查看</span>-->
                                            <!--</div>-->
                                        </a>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                
                <div class="b-r">
                    <div class="b-head">
                        <div class="left"><span class="b-head-t">排行</span></div>
                    </div>
                    <div class="b-body">
                        <ul class="rlist">
                      
                            <c:forEach var="clothRank" items="${clothRankList}">
                                <li class="on">
	                                <div class="preview">
	                                    <a href="#">
	                                        <img src="<c:url value='${clothRank.fimg}' />">
	                                    </a>
	                                </div>
                                    <a href="#" onclick="showCloth('${clothRank.fid}');">${clothRank.fname}</a>&nbsp;&nbsp;
                                    <span class="goodsPrice">${clothRank.fpraise}</span><br />
                                </li>
                            </c:forEach>
                            

                        </ul>
                        <div class="more-link">
                            <a href="/video/bangumi-two-1.html#!order=hot&amp;page=1&amp;range=2015-12-25,2016-01-01">查看更多</a>
                        </div>
                    </div>
                </div>
            </div>
          
      
               
                 <!--数码区-->
        <div class="container-row">
            <div class="b-section-head">
                <div class="b-head">
                    <span class="b-head-i"></span>
                    <span class="b-head-t">
                        <a href="/video/douga.html" title="动画"><h2>数码区</h2></a>
                    </span>
                </div>
            </div>
            <div class="b-section-body">
                <div class="b-l">
                    <div class="b-head">
                        <ul class="b-slt-tab">
                            <li class="on" data-source="/index/ding.json" push=""><span class="b-tab-text">热门商品</span></li>
                            <li data-source="/index/ranking.json"><span class="b-tab-text">最新上架</span></li>
                        </ul>
                        <div class="b-link-more"><a href="/video/douga.html">更多<i class="b-icon b-icon-arrow-r"></i></a></div>
                    </div>
                    <div class="b-body">
                        <ul class="vidbox v-list" style="height: 640px;">
                            <c:if test="${empty digitList}"><br/>&nbsp;&nbsp;&nbsp;当前分类下没有任何商品.<br/></c:if>
                            <c:forEach var="digitBean" items="${digitList}">
                                <li>
                                    <div class="v m300" style="height: 180px;">
                                        <a class="preview" onclick="showFood('${digitBean.fid}');">
                                            <div class="medal"></div>
                                            <div class="original"></div>
                                            <div class="border"></div>
                                            <!--<img src="http://i2.hdslb.com/320_200/u_user/6f1b8d50849d2dc27881f054464aa4c7.jpg" loaded="loaded"  style="opacity: 1;">-->
                                            <img src="<c:url value='${digitBean.fimg}' />" alt="点击图片查看具体商品" loaded="loaded"  style="opacity: 1;"/>
                                        </a>
                                        <a onclick="showFood('${digitBean.fid}');" target="_blank" title="">
                                            <div class="t" style="height: 80px;">
                                                <p class="name">
                                                    <span class="goodsPrice">${digitBean.fname}</span>
                                                </p>
                                                <p class="price">
                                                    价格： <span class="goodsPrice font-price">${digitBean.fprice}</span> 点赞：<span class="goodsPrice font-price">${foodBean.fpraise}</span><span class="btnList" style="float:right"><input type="image" src="<c:url value='/images/press_praise.jpg' />" onClick="praise('${foodBean.fid}');" alt="点赞" /></span>
                                                </p>
                                                <!--<p class="brief">-->
                                                    <!--详细说明:-->
                                                    <!--<span class="goodsPrice">${foodBean.fdescription}</span>-->
                                                <!--</p>-->
                                                
                                            </div>
                                            <!--<div class="i">-->
                                                <!--<span><i class="b-icon b-icon-v-play"></i>购买</span><span><i class="b-icon b-icon-v-dm"></i>查看</span>-->
                                            <!--</div>-->
                                        </a>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                
                
                <div class="b-r">
                    <div class="b-head">
                        <div class="left"><span class="b-head-t">排行</span></div>
                    </div>
                    <div class="b-body">
                        <ul class="rlist">
                      
                            <c:forEach var="digitRank" items="${digitRankList}">
                                <li class="on">
	                                <div class="preview">
	                                    <a href="#">
	                                        <img src="<c:url value='${digitRank.fimg}' />">
	                                    </a>
	                                </div>
                                    <a href="#" onclick="showFood('${digitRank.fid}');">${digitRank.fname}</a>&nbsp;&nbsp;
                                    <span class="goodsPrice">${digitRank.fpraise}</span><br />
                                </li>
                            </c:forEach>
                            

                        </ul>
                        <div class="more-link">
                            <a href="/video/bangumi-two-1.html#!order=hot&amp;page=1&amp;range=2015-12-25,2016-01-01">查看更多</a>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>

</div>
</div>

<%@include file="Footer.jsp" %>
		
	</body>
</html>
