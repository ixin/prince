<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Prince</title>
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
					<section class="span8">
					<c:forEach var="post" items="${obj}">
						<article>
							<header>
								<h1><a href='post/${post.id}' >${post.name}</a></h1>
								<p>作者：${post.own}&nbsp;&nbsp;<time datetime="${post.time}">${post.time}</time>
							</header>
							<p>${post.content}</p>
						</article>
					</c:forEach>
						
						<%-- <c:forEach var="post" items="${posts}">
						<div class="post-list">
							<a href="${ctxPath}/post/${post.id}/" class="profile-title" >${post.title}</a>
							<div style="margin-top:10px;"><span>作者：<a href="#">${post.own}</a>&nbsp;&nbsp;&nbsp;发布时间：&nbsp;${post.time}&nbsp;&nbsp;分类：&nbsp;<a href="#">默认</a> &nbsp;&nbsp;评论：暂无</span></div>
						</div>
						<br />
						<div>${post.content}</div>
						<br />
						<hr />
						</c:forEach> --%>
						<hr />
						<ul class="pager">
							<li class="previous"><a href="#">&larr; Older</a></li>
							<li class="next"><a href="#">Newer &rarr;</a></li>
						</ul>
					</section>
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