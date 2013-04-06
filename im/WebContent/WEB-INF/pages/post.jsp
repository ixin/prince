<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!--[if lt IE 9]>
      <script src="//cdnjs.bootcss.com/ajax/libs/html5shiv/3.6.2/html5shiv.js"></script>
<![endif]-->
<link href="${ctxPath}/styles/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="${ctxPath}/styles/style.css" rel="stylesheet">
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="${ctxPath}">Prince</a>
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li><a href="${ctxPath}">首页</a></li>
						<li><a href="${ctxPath}/about">关于</a></li>
						<li><a href="${ctxPath}/contact">联系我</a></li>
					</ul>
					<ul class="nav pull-right">
						<c:choose>
							<c:when test="${empty sessionScope.u}">
								<li><a href="#" data-toggle="modal" data-target="#myLoginModal">登录</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${ctxPath}/admin/frameMain.html" class="hidden-phone visible-tablet visible-desktop" >设置</a></li>
								<li id="fat-menu" class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-user"></i>小辛<i class="icon-caret-down"></i></a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="${ctxPath}/admin/frameMain.html">我的账户</a></li>
										<li class="divider"></li>
										<li><a tabindex="-1" class="visible-phone" href="${ctxPath}/admin/frameMain.html">设置</a></li>
										<li class="divider visible-phone"></li>
										<li><a tabindex="-1" href="${ctxPath}/j_spring_security_logout">注销</a></li> 
									</ul>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- end top -->
	<div class="container">
		<div class="content">
		<div class="container-fluid">
				<div class="row-fluid">
					<article class="span8">
						<header>
							<h1>URL 映射</h1>
							<p>作者：小辛&nbsp;&nbsp;<time datetime="2013-04-04">2013年04月04日</time></p>
						</header>
						
						<p>为什么需要详细描述 URL 映射
						<p>Nutz.Mvc 的核心任务就是将 HTTP 请求的 URL 映射到某一个入口函数，如果你看完了 Nutz.Mvc 概述你大概应该知道，映射的配置信息是通过注解 @At 来设置的，@At 注解也非常简单，配置起来应该没有什么障碍。

但是，依然在某些时候，你会在你的应用出现 404 错误，为了能让你在编写项目是，心里非常有底，这里将详细的解释一下JSP/Servlet 以及 Nutz.Mvc 映射部分的工作原理，在你遇到讨厌的 404 时，只要通读本文，相信就能找到问题的症结。
						<p>为什么需要请求范围的模块
Top
无论 Struts2 还是 Spring，都提供了一种控制器： 每次请求，创建实例，使用后即抛弃。这样的控制器的好处就是可以放心的吧 request 和 response 对象放心的存成它的私有属性，反正使用一次后就丢掉了。

在 Nutz.Mvc，所谓控制器，实际上就是 Module，默认的，所有的模块都是整个应用程序唯一的，除非你在 Ioc 配置文件里另有说明。

那么 Nutz 可以做到每次请求即抛弃的控制器（Module）吗？ 答案是肯定的，稍微有点麻烦，但是绝对不会繁琐的让你头疼，你需要自己动手做点事情，如果你对编写 JSP/Servlet 应用程序有点基本的支持，这点事情对你不会构成负担。

怎样做？
Top
我们这里给你举一个简单的例子，假设你有一个模块，通过 Nutz.Ioc 来配置：

你的模块代码
Top
@InjectName("myModule")
public class MyModule{

	private HttpServletRequest request;
	
	@At("/abc")
	public String tryIt(){
		return request.getParameter("abc");
	}
}
修改 Ioc 配置文件
Top
...
myModule : {
	type : 'com.you.app.MyModule',
	scope : 'request',
	fields : {
		request : {refer: '$request'}
	}
}
...
请注意 scope : 'request' 以及 fields 里 request 字段的属性 refer: '$request'
scope 指明了这个对象存在的上下文环境，如果你不指明，默认是 'app'
更多关于 scope，请参看
关键就是这个 refer: '$request'，很抱歉，你得自己设置它的值。怎样设置呢？通过 web.xml 的 HttpFilter

添加 HttpFilter
Top
注: 如果你使用的是 Nutz.1.b.37 以及之后的版本，不需要做这个操作，因为每次请求，它都会自动增加 下面的属性，而之前的版本则不会。

增加一个 HttpFilter

public class MyFilter implements Filter {
	public void destroy() {}
	public void init(FilterConfig arg0) throws ServletException {}
	
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		req.setAttribute("$request", req);
		chain.doFilter(req, resp);
	}
}
将它配置在 web.xml 里，具体怎么配置我想就不用我废话了吧

最后
Top
这样，就可以做到 Request 级别的 Module 了，即，每次请求，都会重新创建你的 Module 实例
						<hr />
						<ul class="pager">
							<li class="previous"><a href="#">&larr; Older</a></li>
							<li class="next"><a href="#">Newer &rarr;</a></li>
						</ul>
						<section>
							<header>
								<h3>评论</h3>
							</header>
							<textarea class="span12" rows="8" cols="80"></textarea>
						</section>
					</article>
					<aside class="span4">
						<section>
							<header><h4>热门文章</h4></header>
							<ul>
								<li><a href="javascript:void(0)" target="_blank">web.xml 中的映射 - url-pattern</a></li>
								<li><a href="javascript:void(0)" target="_blank">在 Nutz.Mvc 中的映射</a></li>
								<c:forEach var="topTitle" items="${topTitle}">
									<li><a href="${ctxPath}/post/${topTitle.id}/">${topTitle.title}</a></li>
								</c:forEach>
							</ul>
						</section>
						<section>
							<header><h4>友情链接</h4></header>
							<ul>
								<li><a href="http://www.google.com" target="_blank">Google.com</a></li>
								<li><a href="javascript:void(0)" target="_blank">萌糖燃糖</a></li>
								<li><a href="javascript:void(0)" target="_blank">糯米团团</a></li>
								<li><a href="javascript:void(0)" target="_blank">木瓜博客</a></li>
								<li><a href="http://www.ilovejava.net" target="_blank">ilovejava.net</a></li>
								<li><a href="javascript:void(0)" target="_blank">游鱼技术站</a></li>
								<li><a href="javascript:void(0)" target="_blank">简单生活</a></li>
							</ul>
						</section>
					</aside>
				</div>
				</div>
		</div>
		<footer>
			<p>
				© <a href="https://github.com/ixin/prince">Prince</a>
				2013  由 <a href="http://ixin.me">ixin.me</a> &amp; <a href="http://meido.mx">meido.mx</a> 提供.
			</p>
		</footer>
	</div>
	<!-- 登录Modal -->
	<div id="myLoginModal" class="modal hide fade" tabindex="-1" >
  		<div class="modal-body">
	    	<form class="form-signin" method="post" action="${ctxPath}/j_spring_security_check">
        		<h2 class="form-signin-heading">请登录</h2>
        		<input type="text" class="input-block-level" placeholder="Username" name="j_username">
        		<input type="password" class="input-block-level" placeholder="Password" name="j_password">
        		<label class="checkbox">
          			<input type="checkbox" value="remember-me"> 记住我
        		</label>
        		<button class="btn btn-large btn-primary" type="submit">登录</button>
      		</form>
  		</div>
	</div>

<script src="${ctxPath}/scripts/jquery-1.8.0.min.js"></script>
<script src="${ctxPath}/scripts/bootstrap.min.js"></script>
</body>
</html>