<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//System.out.println(basePath);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link rel="shortcut icon" href="../static/favicon.ico" />
	<jsp:include page="../static/head.jsp"/>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="images/logo.png" /></div>
	<div class="help">
		<a href="cartPage.do" class="shopping">查看购物车</a>
		<c:if test="${sessionScope.user!=null}"><a href="userOrder.do?uid=${sessionScope.user.uid}">我的订单</a>&nbsp;用户:${sessionScope.user.uname}&nbsp;&nbsp;<a href="updateUserPage.do">更新个人信息</a><a href="updatePwdPage.do">修改密码</a><a href="logout.do">注销</a></c:if>
		<c:if test="${sessionScope.user==null}">
			<button type="button" class="btn btn-default" onclick="window.location.href='login.do'">登录</button>
			<button type="button" class="btn btn-default" onclick="window.location.href='reg.do'">注册</button>
		</c:if>
	</div>
	<div class="navbar">
		<button type="button" onclick="window.location.href='index.do'" class="btn btn-warning btn-lg ">首页</button>
		<div class="searchBook">
			<form method="post" action="productList.do">
				查找书籍：<input  type="text" class="text" name="key" placeholder="请输入商品关键字"  /> <input class="btn btn-info" type="submit" name="submit" value="搜索" />
			</form>
		</div>
	</div>
</div>
<div id="childNav">
	<div class="wrap">
		<ul class="clearfix">
			<c:forEach items="${bts}" var="bt">
			<li><a href="productList.do?type=${bt}" >${bt}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<div id="main" class="wrap">
	<div class="lefter">
		<div class="box">
			<h2>图书分类</h2>
			<c:forEach items="${bts}" var="bt">
			<dl>
				<dd><a href="productList.do?type=${bt}" >${bt}</a></dd>
			</dl>
			</c:forEach>
			
		</div>
		<div class="spacer"></div>
		<div class="last-view">
			<h2>最近浏览</h2>
			<c:forEach items="${Cbooks}" var="cbook" end="4">
			<dl class="clearfix">
				<dt><img height="50" width="50" src="images/product/${cbook.image}" /></dt>
				<dd><a href="bookView.do?bid=${cbook.bid}">${cbook.bname}</a></dd>
			</dl>
			</c:forEach>
		</div>
	</div>
	<div class="main">
		<div class="demo">
			<a class="control prev"></a><a class="control next abs"></a><!--自定义按钮，移动端可不写-->
			<div class="demo">
				<a class="control prev"></a><a class="control next abs"></a><!--自定义按钮，移动端可不写-->
				<div class="slider"><!--主体结构，请用此类名调用插件，此类名可自定义-->
					<ul>
						<li><a href="bookView.do?bid=10"><img src="images/1.jpg" alt="于人间烟火处彰显道义和担当，在悲欢离合中抒写情怀和热望。" /></a></li>
						<li><a href="bookView.do?bid=11"><img src="images/2.jpg" alt="一部经典之作，一部理性之作。" /></a></li>
						<li><a href="bookView.do?bid=12"><img src="images/3.jpg" alt="美国知名心理医师、著名家庭与婚姻治疗师、知名创伤治愈专家贝弗莉· 恩格尔全新力作。" /></a></li>
						<li><a href="bookView.do?bid=13"><img src="images/4.jpg" alt="被马斯克用火箭送上太空的科幻神作，讲述人类未来两万年的历史。" /></a></li>
						<li><a href="bookView.do?bid=14"><img src="images/5.jpg" alt="《三体》是一部让人眼界大开的科幻小说。看完后，仰望夜空，你看到的星星变得不一样了。" /></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="spacer clear"></div>
		<div class="hot">
			<h2>最新上架</h2>
			<ul class="product clearfix">
				<c:forEach items="${books}" var="book" end="11">
				<li>
					<dl>
						<dt><a href="bookView.do?bid=${book.bid}" target="_blank"><img src="images/product/${book.image}" /></a></dt>
						<dd class="title"><a href="bookView.do?bid=${book.bid}" target="_blank">${book.bname}</a></dd>
						<dd class="price">￥${book.pirce}</dd>
					</dl>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/YuxiSlider.jQuery.min.js"></script>
<script src="js/index.js"></script>
<jsp:include page="../static/footer.jsp"/>
</body>
</html>
