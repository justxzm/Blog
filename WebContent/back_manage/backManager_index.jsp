<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>backManage</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,700">
<link rel="stylesheet" href="css/style.min.css">
<!--[if IE]>
		<script src="http://libs.baidu.com/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
<script type="text/javascript">
	function articleListManage(){
		document.getElementById("iframepage").src = "articleList_Manage.jsp";
		setTimeout(change, 1000);
	}
	function indexPreview() {
		document.getElementById("iframepage").src = "../front_develop/index.jsp";
		setTimeout(change, 1000);
	}
	function articleAdd() {
		document.getElementById("iframepage").src = "articleAdd.jsp";
		setTimeout(change, 1000);
	}
	function commentManage(){
		document.getElementById("iframepage").src = "articleList_Comment.jsp";
		setTimeout(change, 1000);
	}
	function rootSetUp(){
		document.getElementById("iframepage").src = "rootSetUp.jsp";
		setTimeout(change, 1000);
	}
	function change() {
		document.getElementById("mm-menu-toggle").click();
	}
</script>
</head>
<body>
	<div id="wrapper" class="wrapper">
	<!--#3071A8-->
		<header class="header htmleaf-header"
			style="background-color:#ffffff;height: 555px;">
		<h1>
			By <a style="color:#000000" href="../front_develop/index.jsp">Try.Catch</a><span>All Rights Reserved</span>
		</h1>
		<iframe src="../front_develop/index.jsp" frameborder="0"
			id='iframepage' width="100%" height="100%"></iframe> </header>

		<main> </main>
	</div>
	<!-- /wrapper -->

	<button id="mm-menu-toggle" class="mm-menu-toggle">Toggle Menu</button>
	<nav id="mm-menu" class="mm-menu">
	<div
		style="position: relative; width: 100%; height: 188px; background-color: #428ac9;">
		<h2 class="mm-menu__title">控制台</h2>
	</div>
	<ul class="mm-menu__items">
		<li class="mm-menu__item"><a class="mm-menu__link" href="#"
			onclick="indexPreview()"> <span class="mm-menu__link-text"><i
					class="md md-home"></i>主页预览</span>
		</a></li>
		<li class="mm-menu__item"><a class="mm-menu__link" href="#"
			onclick="articleAdd()"> <span class="mm-menu__link-text"><i
					class="md md-person"></i>随笔</span>
		</a></li>
		<li class="mm-menu__item"><a class="mm-menu__link" href="#" onclick="articleListManage()">
				<span class="mm-menu__link-text"><i class="md md-inbox"></i>文章管理</span>
		</a></li>
		<li class="mm-menu__item"><a class="mm-menu__link" href="#" onclick="commentManage()">
				<span class="mm-menu__link-text"><i class="md md-favorite"></i>评论管理</span>
		</a></li>
		<li class="mm-menu__item"><a class="mm-menu__link" href="#" onclick="rootSetUp()">
				<span class="mm-menu__link-text"><i class="md md-settings"></i>设置</span>
		</a></li>
	</ul>
	</nav>
	<!-- /nav -->

	<script src="js/production/materialMenu.min.js"></script>
	<script>
		var menu = new Menu;
	</script>
</body>
</html>